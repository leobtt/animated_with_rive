import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_bar.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/rive_assets.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: const HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(bottomNavs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);

                    if (bottomNavs[index] != selectBottomNav) {
                      setState(() {
                        selectBottomNav = bottomNavs[index];
                      });
                    }

                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavs[index].input!.change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBar(
                        selectBottomNav: selectBottomNav,
                        isActive: bottomNavs[index] == selectBottomNav,
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity:
                              bottomNavs[index] == selectBottomNav ? 1.0 : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavs[index].src,
                            artboard: bottomNavs[index].artboard,
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtils.getRiveController(
                                artboard,
                                stateMachineName:
                                    bottomNavs[index].stateMachineName,
                              );

                              bottomNavs[index].input =
                                  controller.findSMI('active');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
