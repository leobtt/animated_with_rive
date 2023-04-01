import 'package:flutter/material.dart';
import 'package:rive_animation/models/rive_assets.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.selectBottomNav,
    required this.isActive,
  }) : super(key: key);

  final RiveAsset selectBottomNav;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      // curve: Curves.easeIn,
      margin: const EdgeInsets.only(bottom: 2),
      width: isActive ? 20 : 0,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
