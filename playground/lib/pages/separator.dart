import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SeparatorStyle {
  solid,
  dashed,
  dotted,
  vertical,
  labelCenter,
  labelLeading,
  labelTrailing,
  sizeLg,
  dashedWithColor,
  dottedWithColor,
  verticalWithLabel,
}

class SeparatorPage extends StatelessWidget {
  const SeparatorPage({super.key, required this.style});

  final SeparatorStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: switch (style) {
            SeparatorStyle.solid => const Separator(),
            SeparatorStyle.dashed =>
              const Separator(variant: SeparatorVariant.dashed),
            SeparatorStyle.dotted =>
              const Separator(variant: SeparatorVariant.dotted),
            SeparatorStyle.vertical => const SizedBox(
                height: 20,
                child: Separator(orientation: Axis.vertical),
              ),
            SeparatorStyle.labelCenter => const Separator(
                label: 'LABEL - CENTER',
                labelPosition: LabelPosition.center,
              ),
            SeparatorStyle.labelLeading => const Separator(
                label: 'LABEL - LEADING',
                labelPosition: LabelPosition.leading,
              ),
            SeparatorStyle.labelTrailing => const Separator(
                label: 'LABEL - TRAILING',
                labelPosition: LabelPosition.trailing,
              ),
            SeparatorStyle.sizeLg =>
              const Separator(size: SeparatorSize.lg, thickness: 8),
            SeparatorStyle.verticalWithLabel => const SizedBox(
                height: 100,
                child: Separator(
                  orientation: Axis.vertical,
                  label: 'SECTION',
                  labelPosition: LabelPosition.center,
                ),
              ),
            SeparatorStyle.dashedWithColor => const Separator(
                variant: SeparatorVariant.dashed,
                color: Colors.red,
              ),
            SeparatorStyle.dottedWithColor => const Separator(
                variant: SeparatorVariant.dotted,
                color: Colors.red,
                dotSpacing: 12,
                dotRadius: 2,
              ),
          },
        ),
      ),
    );
  }
}
