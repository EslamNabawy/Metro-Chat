import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:metro_chat/Core/Routing/app_router.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    _setupAnimation();
    _initializeResources();
  }

  void _setupAnimation() {
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  Future<void> _initializeResources() async {
    await Future.wait([
      Permission.microphone.request(),
      _audioPlayer
          .setAsset('assets/Sounds/splash_screen_sound_effect.mp3')
          .then((_) => _audioPlayer.play()),
    ]);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        AppRouter.replace(context, AppRoute.signup);
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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Text("Metro Chat",
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              const SizedBox(height: 15),
              FadeTransition(
                opacity: _animation,
                child: Text("Fast, Secure, and Retro Cool",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
