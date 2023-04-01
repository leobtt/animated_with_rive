import 'package:flutter/animation.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and Animate an iOS app from scratch',
    this.iconSrc = 'assets/icons/ios.svg',
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<Course> courses = [
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in Flutter',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF80A4FF),
  )
];
List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF80A4FF),
  ),
  Course(title: 'Flutter with Rive'),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF80A4FF),
  )
];
