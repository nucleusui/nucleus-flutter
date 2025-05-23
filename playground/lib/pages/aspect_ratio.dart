import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum RatioBoxStyle {
  square,
  landscape3by2,
  landscape4by3,
  landscape5by4,
  landscape16by9,
  portrait2by3,
  portrait3by4,
  portrait4by5,
  portrait9by16,
  withRoundedCorners,
}

class RatioBoxPage extends StatelessWidget {
  const RatioBoxPage({super.key, required this.style});

  final RatioBoxStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (style) {
                RatioBoxStyle.square => RatioBox(
                    ratio: 1,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '1:1',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.landscape3by2 => RatioBox(
                    ratio: 3 / 2,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '3:2',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.landscape4by3 => RatioBox(
                    ratio: 4 / 3,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '4:3',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.landscape5by4 => RatioBox(
                    ratio: 5 / 4,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '5:4',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.landscape16by9 => RatioBox(
                    ratio: 16 / 9,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '16:9',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.portrait2by3 => RatioBox(
                    ratio: 2 / 3,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '2:3',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.portrait3by4 => RatioBox(
                    ratio: 3 / 4,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '3:4',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.portrait4by5 => RatioBox(
                    ratio: 4 / 5,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '4:5',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.portrait9by16 => RatioBox(
                    ratio: 9 / 16,
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '9:16',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
                RatioBoxStyle.withRoundedCorners => RatioBox(
                    ratio: 16 / 9,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      alignment: Alignment.center,
                      color: context.color.accentModerate,
                      child: Text(
                        '16:9 rounded',
                        style: AppFonts.regular14.copyWith(
                          color: context.color.accentOnAccent,
                        ),
                      ),
                    ),
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
