import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:metro_chat/Features/Home/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    requestPermission(); // Request permission on app startup

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _audioPlayer = AudioPlayer();
    _playSound();

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  Future<void> requestPermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  Future<void> _playSound() async {
    try {
      await _audioPlayer.setAsset('assets/Sounds/splash_screen_sound_effect.mp3');
      print("Audio asset loaded successfully");
      await _audioPlayer.play();
      print("Audio playback started");
    } catch (e) {
      print("Error playing sound: $e");
    }
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
            FadeTransition(
              opacity: _animation,
              child: Text(
                "Metro Chat",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 15),
            FadeTransition(
              opacity: _animation,
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
}
