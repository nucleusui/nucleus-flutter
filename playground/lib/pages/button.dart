import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum ButtonStyle {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  social,
  icon,
  prefixIcon,
  suffixIcon,
  bothIcon,
  loading,
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key, required this.style});

  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (style) {
          ButtonStyle.primary => Button.primary(
              label: 'Primary',
              onPressed: () {},
            ),
          ButtonStyle.secondary => Button.secondary(
              label: 'Secondary',
              onPressed: () {},
            ),
          ButtonStyle.destructive => Button.destructive(
              label: 'Destructive',
              onPressed: () {},
            ),
          ButtonStyle.outline => Button.outline(
              label: 'Outline',
              onPressed: () {},
            ),
          ButtonStyle.ghost => Button.ghost(
              label: 'Ghost',
              onPressed: () {},
            ),
          ButtonStyle.social => Container(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              margin: const EdgeInsets.all(16),
              child: Button.social(
                label: 'Continue with Apple',
                color: Colors.black,
                prefixIcon: const Icon(Icons.apple, size: 26),
                onPressed: () {},
              ),
            ),
          ButtonStyle.loading => Button.outline(
              label: 'Primary',
              isLoading: true,
              onPressed: () {},
            ),
          ButtonStyle.icon => Button(
              icon: const Icon(Icons.circle),
              onPressed: () {},
            ),
          ButtonStyle.prefixIcon => Button(
              label: 'Prefix Icon',
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.circle),
              ),
              onPressed: () {},
            ),
          ButtonStyle.suffixIcon => Button(
              label: 'Suffix Icon',
              suffixIcon: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Icons.circle),
              ),
              onPressed: () {},
            ),
          ButtonStyle.bothIcon => Button(
              label: 'Both Icon',
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.circle),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Icons.circle),
              ),
              onPressed: () {},
            ),
        },
      ),
    );
  }
}
