import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum WidgetRatioStyle {
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

class WidgetRatioPage extends StatelessWidget {
  const WidgetRatioPage({super.key, required this.style});

  final WidgetRatioStyle style;

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
                WidgetRatioStyle.square => WidgetRatio(
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
                WidgetRatioStyle.landscape3by2 => WidgetRatio(
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
                WidgetRatioStyle.landscape4by3 => WidgetRatio(
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
                WidgetRatioStyle.landscape5by4 => WidgetRatio(
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
                WidgetRatioStyle.landscape16by9 => WidgetRatio(
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
                WidgetRatioStyle.portrait2by3 => WidgetRatio(
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
                WidgetRatioStyle.portrait3by4 => WidgetRatio(
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
                WidgetRatioStyle.portrait4by5 => WidgetRatio(
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
                WidgetRatioStyle.portrait9by16 => WidgetRatio(
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
                WidgetRatioStyle.withRoundedCorners => WidgetRatio(
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
