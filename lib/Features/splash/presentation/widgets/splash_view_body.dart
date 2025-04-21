import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/custom_alert_dialog.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 1.0;
  bool checkingConnection = true;
  Timer? connectionTimer;

  @override
  void initState() {
    super.initState();
    startAnimation();
    checkInternetRepeatedly();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradientDecoration(),
      child: Center(
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
      ),
    );
  }

  void startAnimation() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (!mounted) {
          return;
        }

        setState(
          () {
            _opacity = 1.0;
            _scale = 1.2;
          },
        );

        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (!mounted) {
              return;
            }

            setState(
              () {
                _opacity = 0.0;
                _scale = 1.0;
              },
            );

            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (checkingConnection) {
                  startAnimation(); // Restart animation if still checking
                }
              },
            );
          },
        );
      },
    );
  }

  void checkInternetRepeatedly() {
    int attempts = 0;
    const int maxAttempts = 45; // 30 seconds check

    connectionTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        attempts++;

        final result = await Connectivity().checkConnectivity();
        if (result.first != ConnectivityResult.none) {
          navigateToNextScreen();
          timer.cancel();
        } else if (attempts >= maxAttempts) {
          timer.cancel();
          showNoInternetDialog();
        }
      },
    );
  }

  void showNoInternetDialog() {
    if (!mounted) return;

    checkingConnection = false; // Stop checking
    connectionTimer?.cancel(); // Ensure timer is canceled

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomAlertDialog(
        title: "No Internet Connection",
        content: "Please check your internet connection and try again.",
        onAgree: () {
          setState(
            () {
              checkingConnection = true;
              startAnimation();
              checkInternetRepeatedly();
            },
          );
        },
      ),
    );
  }

  void navigateToNextScreen() async {
    if (!mounted) {
      return;
    }

    checkingConnection = false; // Stop checking
    connectionTimer?.cancel(); // Ensure timer is canceled

    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (mounted) {
      GoRouter.of(context).go(AppRouter.kHomeView);
    }
  }

  @override
  void dispose() {
    connectionTimer?.cancel();
    super.dispose();
  }
}
