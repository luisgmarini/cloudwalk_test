import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
        const Icon(
          CupertinoIcons.guitars,
          size: 90,
        ),
        const SizedBox(height: 16),
        Text(
          'Welcome Band! Please search for your next world trip city! 🤘',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
