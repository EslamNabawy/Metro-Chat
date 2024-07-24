import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:metro_chat/Features/Home/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initializeResources();
  }

  Future<void> _initializeResources() async {
    await _requestPermission();
    _setupAnimation();
    await _setupAudio();
    _navigateToHomeScreen();
  }

  Future<void> _requestPermission() async {
    final status = await Permission.microphone.request();
    if (status.isDenied) {
      // Handle permission denial
      debugPrint('Microphone permission denied');
    }
  }

  void _setupAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  Future<void> _setupAudio() async {
    try {
      await _audioPlayer
          .setAsset('assets/Sounds/splash_screen_sound_effect.mp3');
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  void _navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFadeTransition(
              child: Text(
                "Metro Chat",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 15),
            _buildFadeTransition(
              child: Text(
                "Fast, Secure, and Retro Cool",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFadeTransition({required Widget child}) {
    return FadeTransition(
      opacity: _animation,
      child: child,
    );
  }
}
