import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:table_calendar/table_calendar.dart';

/// A customizable calendar date picker component with flexible styling and date range options.
///
/// The DatePicker widget provides a clean and consistent calendar interface for
/// date selection across the application. It supports various calendar formats,
/// custom styling options, date range restrictions, and handles different states
/// including weekends, holidays, and disabled dates with appropriate visual feedback.
class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    this.onDaySelected,
    this.headerVisible = true,
    this.calendarFormat = CalendarFormat.month,
    this.textStyle,
    this.weekendTextStyle,
    this.holidayTextStyle,
    this.disabledColor,
    this.headerStyle,
    this.daysOfWeekStyle,
    this.calendarStyle,
    this.firstDay,
    this.lastDay,
    this.focusedDay,
    this.currentDay,
    this.daysOfWeekHeight = 56,
  });

  /// Callback function triggered when a date is selected on the calendar.
  final void Function(DateTime, DateTime)? onDaySelected;

  /// Controls whether the calendar header (month/year navigation) is visible.
  final bool headerVisible;

  /// The format of the calendar display (month, week, or 2-week view).
  final CalendarFormat calendarFormat;

  /// Default text style applied to calendar dates.
  final TextStyle? textStyle;

  /// Text style specifically for weekend dates (Saturday and Sunday).
  final TextStyle? weekendTextStyle;

  /// Text style specifically for holiday dates.
  final TextStyle? holidayTextStyle;

  /// Color used for disabled dates that cannot be selected.
  final Color? disabledColor;

  /// Custom styling for the calendar header section.
  final HeaderStyle? headerStyle;

  /// Custom styling for the days of the week row (Mon, Tue, Wed, etc.).
  final DaysOfWeekStyle? daysOfWeekStyle;

  /// Comprehensive styling options for the calendar body and date cells.
  final CalendarStyle? calendarStyle;

  /// The earliest date that can be selected on the calendar.
  final DateTime? firstDay;

  /// The latest date that can be selected on the calendar.
  final DateTime? lastDay;

  /// The currently focused date, determining which month/year is displayed.
  final DateTime? focusedDay;

  /// The current date, typically highlighted with special styling.
  final DateTime? currentDay;

  /// Height of the days of the week header row in pixels.
  final double daysOfWeekHeight;

  @override
  Widget build(BuildContext context) {
    final calendarFonts = textStyle ?? AppFonts.semiBold14;
    return TableCalendar<dynamic>(
      focusedDay: currentDay ?? focusedDay ?? DateTime.now(),
      firstDay: firstDay ?? DateTime.now(),
      lastDay: lastDay ?? DateTime(2100),
      currentDay: currentDay ?? firstDay ?? DateTime.now(),
      calendarFormat: calendarFormat,
      headerVisible: headerVisible,
      headerStyle: headerStyle ??
          HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: AppFonts.bold16,
          ),
      daysOfWeekStyle: daysOfWeekStyle ??
          DaysOfWeekStyle(
            weekendStyle: AppFonts.bold14,
            weekdayStyle: AppFonts.bold14,
            dowTextFormatter: (date, locale) {
              return DateFormat('E').format(date).split('').first;
            },
          ),
      daysOfWeekHeight: daysOfWeekHeight,
      calendarStyle: calendarStyle ??
          CalendarStyle(
            defaultTextStyle:
                calendarFonts.copyWith(color: context.color.brand70),
            withinRangeTextStyle:
                calendarFonts.copyWith(color: context.color.brand70),
            weekendTextStyle: weekendTextStyle ??
                calendarFonts.copyWith(color: context.color.brand70),
            holidayTextStyle: holidayTextStyle ??
                calendarFonts.copyWith(color: context.color.brand70),
            disabledTextStyle: calendarFonts.copyWith(
                color: disabledColor ?? context.color.grey40),
            rangeHighlightColor: context.color.brand20,
            todayDecoration: BoxDecoration(
              color: context.color.brand60,
              shape: BoxShape.circle,
            ),
            rangeStartDecoration: BoxDecoration(
              color: context.color.brand60,
              shape: BoxShape.circle,
            ),
            rangeEndDecoration: BoxDecoration(
              color: context.color.brand60,
              shape: BoxShape.circle,
            ),
          ),
      enabledDayPredicate: (date) =>
          date.difference(firstDay ?? DateTime.now()).inDays >= 0,
      onDaySelected: onDaySelected,
    );
  }
}
