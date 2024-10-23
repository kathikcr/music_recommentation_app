import 'package:flutter/material.dart';
import 'package:music_recommender_application/home_screen.dart';
import 'package:music_recommender_application/prompt_screen.dart';

class TooglePage extends StatefulWidget {
  const TooglePage({super.key});

  @override
  State<TooglePage> createState() => _TooglePageState();
}

class _TooglePageState extends State<TooglePage> {
  bool _showHomeScreen = true;
  void _toggleScreen() {
    setState(() {
      _showHomeScreen = !_showHomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showHomeScreen) {
      return HomeScreen(
        showPromptScreen: _toggleScreen,
      );
    } else {
      return PromptScreen(
        showHomeScreen: _toggleScreen,
      );
    }
  }
}
