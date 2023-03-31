import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';
import 'package:rive_animation/screens/onboding/components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShow = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();

    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            // height: 100,
            bottom: 200,
            left: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShow ? -50 : 0,
            duration: const Duration(milliseconds: 200),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.',
                          )
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(
                          const Duration(
                            milliseconds: 800,
                          ),
                          () {
                            setState(() => isSignInDialogShow = true);
                            customSignInDialog(context).then((value) {
                              setState(() => isSignInDialogShow = false);
                            });
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
