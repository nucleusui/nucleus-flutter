import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum CustomChipStyle {
  filled,
  outline,
  prefixIcon,
  suffixIcon,
  avatar,
  disabled,
  error,
  fullWidth,
}

class CustomChipPage extends StatefulWidget {
  const CustomChipPage({super.key, required this.style});

  final CustomChipStyle style;

  @override
  State<CustomChipPage> createState() => _CustomChipPageState();
}

class _CustomChipPageState extends State<CustomChipPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    final color = active ? Colors.white : context.color.accentBold;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (widget.style) {
                CustomChipStyle.filled => CustomChip(
                    label: 'Label',
                    isActive: active,
                    onPressed: () => setState(() => active = !active),
                  ),
                CustomChipStyle.outline => CustomChip(
                    label: 'Label',
                    isActive: active,
                    type: ChipType.outline,
                    onPressed: () => setState(() => active = !active),
                  ),
                CustomChipStyle.prefixIcon => CustomChip(
                    label: 'Label',
                    isActive: active,
                    onPressed: () => setState(() => active = !active),
                    prefixIcon: Icon(Icons.add, size: 16, color: color),
                  ),
                CustomChipStyle.suffixIcon => CustomChip(
                    label: 'Label',
                    isActive: active,
                    onPressed: () => setState(() => active = !active),
                    suffixIcon: Icon(Icons.clear, size: 16, color: color),
                  ),
                CustomChipStyle.avatar => CustomChip(
                    label: 'Label',
                    isActive: active,
                    onPressed: () => setState(() => active = !active),
                    avatar: 'https://picsum.photos/200',
                  ),
                CustomChipStyle.disabled => const CustomChip(
                    label: 'Label',
                    state: ChipState.disabled,
                  ),
                CustomChipStyle.error => const CustomChip(
                    label: 'Label',
                    state: ChipState.error,
                  ),
                CustomChipStyle.fullWidth => CustomChip(
                    label: 'Label',
                    isActive: active,
                    onPressed: () => setState(() => active = !active),
                    fullWidth: true,
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
