import 'package:flutter_bloc/flutter_bloc.dart';

class SignInState {
  final String username;
  final String password;

  SignInState({this.username = '', this.password = ''});

  SignInState copyWith({String? username, String? password}) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void signIn() {
    // Implement your sign-in logic here
  }
}
