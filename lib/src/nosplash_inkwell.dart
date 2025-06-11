import 'package:flutter/material.dart';

class NoSplashInkWell extends StatelessWidget {
  const NoSplashInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius,
  });

  final Widget child;
  final void Function()? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: borderRadius,
      onTap: onTap,
      child: child,
    );
  }
}
