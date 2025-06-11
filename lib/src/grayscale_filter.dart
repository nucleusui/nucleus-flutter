import 'package:flutter/material.dart';

class GreyscaleFilter extends StatelessWidget {
  const GreyscaleFilter({
    super.key,
    required this.child,
    required this.isGrayscale,
  });

  final Widget child;
  final bool isGrayscale;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: isGrayscale
          ? greyscale
          : const ColorFilter.mode(Colors.transparent, BlendMode.saturation),
      child: AbsorbPointer(
        absorbing: isGrayscale,
        child: child,
      ),
    );
  }
}

ColorFilter get greyscale {
  return const ColorFilter.matrix([
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0
  ]);
}
