import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum ToastStyle {
  subtle,
  contrast,
  accent,
  caption,
  leadingIcon,
  leadingCaption,
  actionText,
  actionIcon,
}

class ToastPage extends StatelessWidget {
  const ToastPage({super.key, required this.style});

  final ToastStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: switch (style) {
            ToastStyle.subtle => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    message: 'This is a snack bar',
                  );
                },
              ),
            ToastStyle.contrast => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    type: ToastType.contrast,
                    message: 'This is a snack bar',
                  );
                },
              ),
            ToastStyle.accent => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    type: ToastType.accent,
                    message: 'This is a snack bar',
                  );
                },
              ),
            ToastStyle.caption => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    type: ToastType.contrast,
                    message: 'This is a snack bar',
                    caption: 'Caption',
                  );
                },
              ),
            ToastStyle.leadingIcon => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    message: 'This is a snack bar',
                    leadingIcon: SvgPicture.asset('assets/circle.svg'),
                  );
                },
              ),
            ToastStyle.leadingCaption => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    message: 'This is a snack bar',
                    caption: 'Caption',
                    leadingIcon: SvgPicture.asset('assets/circle.svg'),
                  );
                },
              ),
            ToastStyle.actionText => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    message: 'This is a snack bar',
                    actionText: 'Action',
                    onActionPressed: () {},
                  );
                },
              ),
            ToastStyle.actionIcon => Button.outline(
                label: 'Show Toast',
                onPressed: () {
                  Toast.show(
                    context,
                    message: 'This is a snack bar',
                    actionIcon: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.color.accentModerate,
                    ),
                    onActionPressed: () {},
                  );
                },
              ),
          },
        ),
      ),
    );
  }
}
