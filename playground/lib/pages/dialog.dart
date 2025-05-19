import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum DialogStyle {
  confirm,
  error,
  errorWithButton,
  input,
  avatar,
  fullImage,
}

class DialogPage extends StatelessWidget {
  const DialogPage({super.key, required this.style});

  final DialogStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: switch (style) {
            DialogStyle.confirm => Button.primary(
                label: 'Confirm Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    title: 'Remove item?',
                    subtitle:
                        'Are you sure want to remove this item from your cart?',
                    primaryLabel: 'Remove',
                    secondaryLabel: 'Cancel',
                    onPrimary: () => Navigator.pop(context),
                    onSecondary: () => Navigator.pop(context),
                  );
                },
              ),
            DialogStyle.error => Button.primary(
                label: 'Error Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    title: 'Opps!\nSomething went wrong',
                    subtitle: 'Please try again later.',
                  );
                },
              ),
            DialogStyle.errorWithButton => Button.primary(
                label: 'Error Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    title: 'Opps!\nSomething went wrong',
                    subtitle: 'Please try again later.',
                    primaryLabel: 'OK',
                    onPrimary: () => Navigator.pop(context),
                  );
                },
              ),
            DialogStyle.input => Button.primary(
                label: 'Input Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    title: "What's your team name",
                    subtitle: 'The team name will be shown for all members.',
                    content: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InputField(
                        hintText: 'Placeholder text',
                        border: Border.all(color: context.color.borderDisabled),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    primaryLabel: 'Create',
                    onPrimary: () => Navigator.pop(context),
                    secondaryLabel: 'Cancel',
                    onSecondary: () => Navigator.pop(context),
                  );
                },
              ),
            DialogStyle.avatar => Button.primary(
                label: 'Avatar Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    heroImage: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    title: 'Remove item?',
                    subtitle:
                        'Are you sure want to remove this item from your cart?',
                    primaryLabel: 'Remove',
                    secondaryLabel: 'Cancel',
                    onPrimary: () => Navigator.pop(context),
                    onSecondary: () => Navigator.pop(context),
                  );
                },
              ),
            DialogStyle.fullImage => Button.primary(
                label: 'Full Image Dialog',
                onPressed: () {
                  showKitDialog<void>(
                    context,
                    isFull: true,
                    heroImage: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        'https://picsum.photos/1000',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: 'Introducing Virtual Reality',
                    subtitle: 'Please check out all-new feature ',
                    primaryLabel: 'Remove',
                    onPrimary: () => Navigator.pop(context),
                  );
                },
              ),
          },
        ),
      ),
    );
  }
}
