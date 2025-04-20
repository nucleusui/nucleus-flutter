import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum PlagroundButtonStyle {
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

  final PlagroundButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (style) {
          PlagroundButtonStyle.primary => Button.primary(
              label: 'Primary',
              onPressed: () {},
            ),
          PlagroundButtonStyle.secondary => Button.secondary(
              label: 'Secondary',
              onPressed: () {},
            ),
          PlagroundButtonStyle.destructive => Button.destructive(
              label: 'Destructive',
              onPressed: () {},
            ),
          PlagroundButtonStyle.outline => Button.outline(
              label: 'Outline',
              onPressed: () {},
            ),
          PlagroundButtonStyle.ghost => Button.ghost(
              label: 'Ghost',
              onPressed: () {},
            ),
          PlagroundButtonStyle.social => Container(
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
          PlagroundButtonStyle.loading => Button.outline(
              label: 'Primary',
              isLoading: true,
              onPressed: () {},
            ),
          PlagroundButtonStyle.icon => Button(
              icon: const Icon(Icons.circle),
              onPressed: () {},
            ),
          PlagroundButtonStyle.prefixIcon => Button(
              label: 'Prefix Icon',
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.circle),
              ),
              onPressed: () {},
            ),
          PlagroundButtonStyle.suffixIcon => Button(
              label: 'Suffix Icon',
              suffixIcon: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Icons.circle),
              ),
              onPressed: () {},
            ),
          PlagroundButtonStyle.bothIcon => Button(
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
