
import 'package:flutter/material.dart';

class VoiceCommandButton extends StatelessWidget {
  final VoidCallback onPressed;
  const VoiceCommandButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.mic, size: 32, color: Color(0xFFFFD700)),
      onPressed: onPressed,
    );
  }
}
