import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SkeletonStyle {
  rectangle,
  circle,
  avatarWithText,
  cardList,
}

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key, required this.style});

  final SkeletonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                switch (style) {
                  SkeletonStyle.rectangle =>
                    const Skeleton(width: 250, height: 100),
                  SkeletonStyle.circle => const Skeleton(
                      width: 60,
                      height: 60,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                  SkeletonStyle.avatarWithText => const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          width: 48,
                          height: 48,
                          borderRadius: BorderRadius.all(Radius.circular(48)),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Skeleton(width: double.infinity, height: 14),
                              SizedBox(height: 8),
                              Skeleton(width: 180, height: 14),
                            ],
                          ),
                        ),
                      ],
                    ),
                  SkeletonStyle.cardList => Column(
                      children: List.generate(
                        2,
                        (index) => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Skeleton(width: 80, height: 80),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Skeleton(
                                        width: double.infinity, height: 16),
                                    SizedBox(height: 8),
                                    Skeleton(width: 150, height: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
