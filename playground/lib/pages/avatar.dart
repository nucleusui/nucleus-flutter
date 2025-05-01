import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum AvatarStyle {
  basic,
  sizes,
  name,
  meta,
  content,
  stackedLabel,
  stackedCounter,
  error,
}

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key, required this.style});

  final AvatarStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (style) {
                AvatarStyle.basic => const Avatar(
                    size: AvatarSize.lg,
                    image: 'https://picsum.photos/200',
                  ),
                AvatarStyle.sizes => const Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Avatar(
                        image: 'https://picsum.photos/200',
                        size: AvatarSize.xs, // 24px
                      ),
                      Avatar(
                        image: 'https://picsum.photos/200',
                        size: AvatarSize.sm, // 32px
                      ),
                      Avatar(image: 'https://picsum.photos/200'), // 40px
                      Avatar(
                        image: 'https://picsum.photos/200',
                        size: AvatarSize.lg, // 48px
                      ),
                      Avatar(
                        image: 'https://picsum.photos/200',
                        size: AvatarSize.xl, // 64px
                      ),
                      Avatar(
                        image: 'https://picsum.photos/200',
                        size: AvatarSize.xxl, // 80px
                      ),
                    ],
                  ),
                AvatarStyle.name => Avatar.meta(
                    size: AvatarSize.lg,
                    title: 'James Ryan',
                    image: 'https://picsum.photos/200',
                  ),
                AvatarStyle.meta => Avatar.meta(
                    size: AvatarSize.lg,
                    title: 'James Ryan',
                    subtitle: 'Product Design',
                    image: 'https://picsum.photos/200',
                  ),
                AvatarStyle.content => Avatar.content(
                    size: AvatarSize.lg,
                    title: 'Diversify & Amplify Book Clubs hosted by Craig',
                    subtitle: 'Last activity 6m ago',
                    image: 'https://picsum.photos/200',
                  ),
                AvatarStyle.stackedLabel => Avatar.stacked(
                    label: 'and 72 others',
                    images: List.filled(5, 'https://picsum.photos/200'),
                  ),
                AvatarStyle.stackedCounter => Avatar.stacked(
                    limit: 3,
                    images: List.filled(10, 'https://picsum.photos/200'),
                  ),
                AvatarStyle.error => const Row(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Avatar(
                        image: 'invalid-url',
                        size: AvatarSize.lg,
                      ),
                      Avatar(
                        image: 'invalid-url',
                        size: AvatarSize.lg,
                        errorImage: Icon(Icons.circle),
                      ),
                    ],
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
