import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 1.0;
  bool _checkingConnection = true;
  Timer? _connectionTimer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _checkInternetRepeatedly();
  }

  void _startAnimation() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (!mounted) return;

        setState(() {
          _opacity = 1.0;
          _scale = 1.2;
        });

        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (!mounted) return;

            setState(() {
              _opacity = 0.0;
              _scale = 1.0;
            });

            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (_checkingConnection) {
                  _startAnimation(); // Restart animation if still checking
                }
              },
            );
          },
        );
      },
    );
  }

  void _checkInternetRepeatedly() {
    int attempts = 0;
    const int maxAttempts = 30; // 30 seconds check

    _connectionTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      attempts++;

      final result = await Connectivity().checkConnectivity();
      if (result.first != ConnectivityResult.none) {
        _navigateToNextScreen();
        timer.cancel();
      } else if (attempts >= maxAttempts) {
        timer.cancel();
        _showNoInternetDialog();
      }
    });
  }

  void _showNoInternetDialog() {
    if (!mounted) return;

    _checkingConnection = false; // Stop checking
    _connectionTimer?.cancel(); // Ensure timer is canceled

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("No Internet Connection"),
        content: const Text("Please check your internet connection and try again."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _checkingConnection = true;
                _startAnimation();
                _checkInternetRepeatedly();
              });
            },
            child: const Text("Try Again"),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void _navigateToNextScreen() async {
    if (!mounted) return;

    _checkingConnection = false; // Stop checking
    _connectionTimer?.cancel(); // Ensure timer is canceled

    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (mounted) {
      GoRouter.of(context).go(AppRouter.kHomeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 1.0, end: _scale),
          builder: (context, double scale, child) {
            return AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: Transform.scale(
                scale: scale,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Welcome To RealEye",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: Image.asset(Assets.imagesSplashLogo),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connectionTimer?.cancel();
    super.dispose();
  }
}
