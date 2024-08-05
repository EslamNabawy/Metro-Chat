import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthState {
  final String username;
  final String password;
  final bool isLoading;
  final String? error;
  final User? user;

  AuthState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    String? error,
    User? user,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthCubit() : super(AuthState()) {
    // Listen to auth state changes
    _auth.authStateChanges().listen((User? user) {
      emit(state.copyWith(user: user));
    });
  }

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> signUp() async {
    if (state.username.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(error: 'Username and password are required'));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    try {
      // Check if username already exists
      final usernameDoc = await _firestore.collection('usernames').doc(state.username).get();
      if (usernameDoc.exists) {
        emit(state.copyWith(isLoading: false, error: 'Username already exists'));
        return;
      }

      // Create user with email and password
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: '${state.username}@example.com',
        password: state.password,
      );

      // Save username to Firestore
      await _firestore.collection('usernames').doc(state.username).set({
        'uid': userCredential.user!.uid,
      });

      // Update user profile
      await userCredential.user!.updateProfile(displayName: state.username);

      emit(state.copyWith(isLoading: false, user: userCredential.user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> signIn() async {
    if (state.username.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(error: 'Username and password are required'));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: '${state.username}@example.com',
        password: state.password,
      );

      emit(state.copyWith(isLoading: false, user: userCredential.user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    emit(AuthState());
  }
}