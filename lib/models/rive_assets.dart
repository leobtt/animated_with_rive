import 'package:rive/rive.dart';

class RiveAsset {
  late SMIBool? input;
  final String artboard, stateMachineName, title, src;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
  ),
];
