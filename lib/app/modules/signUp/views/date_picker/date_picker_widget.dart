import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import 'date_picker.dart';

abstract class StringsI18n {
  const StringsI18n();

  /// Get the done widget text
  String getDoneText();

  /// Get the cancel widget text
  String getCancelText();

  /// Get the name of month
  List<String> getMonths();

  /// Get the full name of week
  List<String> getWeeksFull();

  /// Get the short name of week
  List<String>? getWeeksShort();
}

enum DateTimePickerLocale {
  /// English (EN) United States
  en_us,

  /// Chinese (ZH) Simplified
  zh_cn,

  /// Portuguese (PT) Brazil
  pt_br,

  /// Spanish (ES)
  es,

  /// Romanian (RO)
  ro,

  /// Bengali (BN)
  bn,

  /// Arabic (AR)
  ar,

  /// Japanese (JP)
  jp,

  /// Russian (RU)
  ru,

  /// German (DE)
  de,

  /// Korea (KO)
  ko,

  /// Italian (IT)
  it,

  /// Hungarian (HU)
  hu,

  /// Hebrew (HE)
  he,

  /// Indonesian (ID)
  id,

  /// Turkish (TR)
  tr,

  /// Norwegian Bokmål (NO)
  no_nb,

  /// Norwegian Nynorsk (NO)
  no_nn,

  /// French (FR)
  fr,

  /// Thai (TH)
  th,

  /// Lithuaniana (LT)
  lt,

  /// Dutch (NL)
  nl,

  /// Haitian Creole (HT)
  ht,

  /// Swedish (SV)
  sv,

  /// Czech (CZ)
  cz,

  /// Polish (PL)
  pl,
}

/// English (EN) United States
class _StringsEnUs extends StringsI18n {
  const _StringsEnUs();

  @override
  String getCancelText() {
    return 'Cancel';
  }

  @override
  String getDoneText() {
    return 'Done';
  }

  @override
  List<String> getMonths() {
    return [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Mon",
      "Tue",
      "Wed",
      "Thur",
      "Fri",
      "Sat",
      "Sun",
    ];
  }
}

/// Default value of date locale
const DateTimePickerLocale DATETIME_PICKER_LOCALE_DEFAULT =
    DateTimePickerLocale.en_us;

const Map<DateTimePickerLocale, StringsI18n> datePickerI18n = {
  DateTimePickerLocale.en_us: const _StringsEnUs(),
};

class DatePickerI18n {
  /// Get locale month array
  static List<String> getLocaleMonths(DateTimePickerLocale? locale) {
    StringsI18n i18n = datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!;
    List<String> months = i18n.getMonths();
    if (months.isNotEmpty) {
      return months;
    }
    return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getMonths();
  }

  /// Get locale week array
  static List<String>? getLocaleWeeks(DateTimePickerLocale? locale,
      [bool isFull = true]) {
    StringsI18n? i18n = datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT];
    if (isFull) {
      List<String> weeks = i18n!.getWeeksFull();
      if (weeks.isNotEmpty) {
        return weeks;
      }
      return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getWeeksFull();
    }

    List<String>? weeks = i18n!.getWeeksShort();
    if (weeks != null && weeks.isNotEmpty) {
      return weeks;
    }

    List<String> fullWeeks = i18n.getWeeksFull();
    if (fullWeeks.isNotEmpty) {
      return fullWeeks
          .map((item) => item.substring(0, min(3, item.length)))
          .toList();
    }
    return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getWeeksShort();
  }
}

const String DATE_FORMAT_SEPARATOR = r'[|,-\/._: ]+';

class DateTimeFormatter {
  /// Get default value of date format.
  static String generateDateFormat(
      String dateFormat, DateTimePickerMode pickerMode) {
    if (dateFormat.length > 0) {
      return dateFormat;
    }
    switch (pickerMode) {
      case DateTimePickerMode.date:
        return DATETIME_PICKER_DATE_FORMAT;
      case DateTimePickerMode.datetime:
        return DATETIME_PICKER_DATETIME_FORMAT;
    }
  }

  /// Check if the date format is for day(contain y、M、d、E) or not.
  static bool isDayFormat(String format) {
    return format.contains(RegExp(r'[yMdE]'));
  }

  /// Check if the date format is for time(contain H、m、s) or not.
  static bool isTimeFormat(String format) {
    return format.contains(RegExp(r'[Hms]'));
  }

  /// Split date format to array.
  static List<String> splitDateFormat(String? dateFormat,
      {DateTimePickerMode? mode}) {
    if (dateFormat == null || dateFormat.length == 0) {
      return [];
    }
    List<String> result = dateFormat.split(RegExp(DATE_FORMAT_SEPARATOR));
    if (mode == DateTimePickerMode.datetime) {
      // datetime mode need join day format
      List<String> temp = [];
      StringBuffer dayFormat = StringBuffer();
      for (int i = 0; i < result.length; i++) {
        String format = result[i];
        if (isDayFormat(format)) {
          // find format pre-separator
          int end = dateFormat.indexOf(format);
          if (end > 0) {
            int start = 0;
            if (i > 0) {
              start = dateFormat.indexOf(result[i - 1]) + result[i - 1].length;
            }
            dayFormat.write(dateFormat.substring(start, end));
          }
          dayFormat.write(format);
        } else if (isTimeFormat(format)) {
          temp.add(format);
        }
      }
      if (dayFormat.length > 0) {
        temp.insert(0, dayFormat.toString());
      } else {
        // add default date format
        temp.insert(0, DATETIME_PICKER_DATE_FORMAT);
      }
      result = temp;
    }
    return result;
  }

  /// Format datetime string
  static String formatDateTime(int value, String format, weekday) {
    if (format.length == 0) {
      return value.toString();
    }

    String result = format;
    // format year text
    if (format.contains('y')) {
      result = _formatYear(value, result);
    }
    // format month text
    if (format.contains('M')) {
      result = _formatMonth(value, result);
    }
    // format day text
    if (format.contains('d')) {
      result = _formatDay(value, result);
    }
    if (format.contains('E')) {
      result = _formatWeek(weekday, result);
    }
    // format hour text
    if (format.contains('H')) {
      result = _formatHour(value, result);
    }
    // format minute text
    if (format.contains('m')) {
      result = _formatMinute(value, result);
    }
    // format second text
    if (format.contains('s')) {
      result = _formatSecond(value, result);
    }
    if (result == format) {
      return value.toString();
    }
    return result;
  }

//  /// Format day display
//  static String formatDate(
//      DateTime dateTime, String format, DateTimePickerLocale locale) {
//    if (format == null || format.length == 0) {
//      return dateTime.toString();
//    }
//
//    String result = format;
//    // format year text
//    if (format.contains('y')) {
//      result = _formatYear(dateTime.year, result, locale);
//    }
//    // format month text
//    if (format.contains('M')) {
//      result = _formatMonth(dateTime.month, result, locale);
//    }
//    // format day text
//    if (format.contains('d')) {
//      result = _formatDay(dateTime.day, result, locale);
//    }
//    if (format.contains('E')) {
//      result = _formatWeek(dateTime.weekday, result, locale);
//    }
//    if (result == format) {
//      return dateTime.toString();
//    }
//    return result;
//  }

  /// format year text
  static String _formatYear(
    int value,
    String format,
  ) {
    if (format.contains('yyyy')) {
      // yyyy: the digit count of year is 4, e.g. 2019
      return format.replaceAll('yyyy', value.toString());
    } else if (format.contains('yy')) {
      // yy: the digit count of year is 2, e.g. 19
      return format.replaceAll('yy',
          value.toString().substring(max(0, value.toString().length - 2)));
    }
    return value.toString();
  }

  /// format month text
  static String _formatMonth(
    int value,
    String format,
  ) {
    List<String> months =
        DatePickerI18n.getLocaleMonths(DateTimePickerLocale.en_us);
    if (format.contains('MMMM')) {
      // MMMM: the full name of month, e.g. January
      return format.replaceAll('MMMM', months[value - 1]);
    } else if (format.contains('MMM')) {
      // MMM: the short name of month, e.g. Jan
      String month = months[value - 1];
      return format.replaceAll('MMM', month.substring(0, min(3, month.length)));
    }
    return _formatNumber(value, format, 'M');
  }

  /// format day text
  static String _formatDay(int value, String format) {
    return _formatNumber(value, format, 'd');
  }

  /// format week text
  static String _formatWeek(
    int value,
    String format,
  ) {
    // EEE: the short name of week, e.g. Mon
    List<String> weeks =
        DatePickerI18n.getLocaleWeeks(DateTimePickerLocale.en_us)!;
    return format.replaceAll(RegExp(r'E+'), weeks[value - 1]);
  }

  /// format hour text
  static String _formatHour(
    int value,
    String format,
  ) {
    return _formatNumber(value, format, 'H');
  }

  /// format minute text
  static String _formatMinute(
    int value,
    String format,
  ) {
    return _formatNumber(value, format, 'm');
  }

  /// format second text
  static String _formatSecond(int value, String format) {
    return _formatNumber(value, format, 's');
  }

  /// format number, if the digit count is 2, will pad zero on the left
  static String _formatNumber(int value, String format, String unit) {
    if (format.contains('$unit$unit')) {
      return format.replaceAll('$unit$unit', value.toString().padLeft(2, '0'));
    } else if (format.contains('$unit')) {
      return format.replaceAll('$unit', value.toString());
    }
    return value.toString();
  }
}

/// Selected value of DatePicker.
typedef DateValueCallback(DateTime dateTime, List<int> selectedIndex);

/// Pressed cancel callback.
typedef DateVoidCallback();

/// Default value of minimum datetime.
const String DATE_PICKER_MIN_DATETIME = "1900-01-01 00:00:00";

/// Default value of maximum datetime.
const String DATE_PICKER_MAX_DATETIME = "2100-12-31 23:59:59";

/// Default value of date format
const String DATETIME_PICKER_DATE_FORMAT = 'yyyy-MMM-dd';

/// Default value of time format
const String DATETIME_PICKER_TIME_FORMAT = 'HH:mm:ss';

/// Default value of datetime format
const String DATETIME_PICKER_DATETIME_FORMAT = 'yyyyMMdd HH:mm:ss';

/// Default value of DatePicker's background color.
const DATETIME_PICKER_BACKGROUND_COLOR = ColorUtilities.offButtonColor;

/// Default value of whether show title widget or not.
const DATETIME_PICKER_SHOW_TITLE_DEFAULT = true;

/// Default value of DatePicker's height.
const double DATETIME_PICKER_HEIGHT = 160.0;

/// Default value of DatePicker's title height.
const double DATETIME_PICKER_TITLE_HEIGHT = 36.0;

/// Default value of DatePicker's column height.
const double DATETIME_PICKER_ITEM_HEIGHT = 36.0;

const TextStyle DATETIME_PICKER_ITEM_TEXT_STYLE =
    const TextStyle(color: Colors.black, fontSize: 16.0);

const Color DATETIME_PICKER_ITEM_TEXT_COLOR = Colors.black;
const double DATETIME_PICKER_ITEM_TEXT_SIZE_SMALL = 15;
const double DATETIME_PICKER_ITEM_TEXT_SIZE_BIG = 17;

/// To support both stable and beta channels until
/// 'DiagnosticableMixin' is officially deprecated.
class DateTimePickerTheme {
  final cancelDefault = const Text('OK');

  /// DateTimePicker theme.
  ///
  /// [backgroundColor] DatePicker's background color.

  /// [cancel] Custom cancel widget.
  /// [confirm] Custom confirm widget.
  /// [title] Custom title widget. If specify a title widget, the cancel and confirm widgets will not display. Must set [titleHeight] value for custom title widget.
  /// [showTitle] Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  /// [pickerHeight] The value of DatePicker's height.
  /// [titleHeight] The value of DatePicker's title height.
  /// [itemHeight] The value of DatePicker's column height.

  const DateTimePickerTheme({
    this.backgroundColor = ColorUtilities.offButtonColor,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.cancel,
    this.confirm,
    this.title,
    this.showTitle = DATETIME_PICKER_SHOW_TITLE_DEFAULT,
    this.pickerHeight = DATETIME_PICKER_HEIGHT,
    this.titleHeight = DATETIME_PICKER_TITLE_HEIGHT,
    this.itemHeight = DATETIME_PICKER_ITEM_HEIGHT,
    this.itemTextStyle = DATETIME_PICKER_ITEM_TEXT_STYLE,
    this.dividerColor,
  });

  static const DateTimePickerTheme Default = const DateTimePickerTheme();

  /// DatePicker's background color.
  final Color backgroundColor;

  final TextStyle? cancelTextStyle;

  final TextStyle? confirmTextStyle;

  /// Custom cancel [Widget].
  final Widget? cancel;

  /// Custom confirm [Widget].
  final Widget? confirm;

  /// Custom title [Widget]. If specify a title widget, the cancel and confirm widgets will not display.
  final Widget? title;

  /// Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  final bool showTitle;

  /// The value of DatePicker's height.
  final double pickerHeight;

  /// The value of DatePicker's title height.
  final double titleHeight;

  /// The value of DatePicker's column height.
  final double itemHeight;

  final TextStyle itemTextStyle;

  final Color? dividerColor;
}

enum DateTimePickerMode {
  /// Display DatePicker
  date,

  /// Display DateTimePicker
  datetime,
}

class DatePicker {
  /// Gets the right [DateTimePickerLocale] by a language string
  ///
  /// languageCode: [languageCode] Locale's String language code

  /// Display date picker in bottom sheet.
  ///
  /// context: [BuildContext]
  /// firstDate: [DateTime] minimum date time
  /// lastDate: [DateTime] maximum date time
  /// initialDateTime: [DateTime] initial date time for selected
  /// dateFormat: [String] date format pattern
  /// locale: [DateTimePickerLocale] internationalization
  /// backgroundColor: [Color] background color of the dialog

  /// titleText: [String] text of the dialog's title
  /// confirmText: [String] text of the dialog's confirm button
  /// cancelText: [String] text of the dialog's  cancel button
  static Future<DateTime?> showSimpleDatePicker(
    BuildContext context, {
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate,
    String? dateFormat,
    DateTimePickerMode pickerMode = DateTimePickerMode.date,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? itemTextStyle,
    String? titleText,
    String? confirmText,
    String? cancelText,
    bool looping = false,
    bool reverse = false,
  }) {
    DateTime? _selectedDate = initialDate;

    // handle the range of datetime
    if (firstDate == null) {
      firstDate = DateTime.parse(DATE_PICKER_MIN_DATETIME);
    }
    if (lastDate == null) {
      lastDate = DateTime.parse(DATE_PICKER_MAX_DATETIME);
    }

    // handle initial DateTime
    if (initialDate == null) {
      initialDate = DateTime.now();
    }

    if (backgroundColor == null)
      backgroundColor = DateTimePickerTheme.Default.backgroundColor;

    if (textColor == null)
      textColor = DateTimePickerTheme.Default.itemTextStyle.color;

    var datePickerDialog = Dialog(
      backgroundColor: ColorUtilities.offButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        height: 350,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorUtilities.offButtonColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Select date of birth",
                  textAlign: TextAlign.center,
                  style: FontUtilities.h18(
                    color: ColorUtilities.white,
                  ),
                ),
              ),
              Text(
                "DD-MM-YYYY",
                textAlign: TextAlign.center,
                style: FontUtilities.h16(color: ColorUtilities.offWhite),
              ),
              Container(
                width: 200,
                height: 200,
                child: DatePickerWidget(
                  firstDate: firstDate,
                  lastDate: lastDate,
                  initialDate: initialDate,
                  dateFormat: dateFormat,
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: ColorUtilities.offButtonColor,
                    itemTextStyle: FontUtilities.h18(
                      color: ColorUtilities.white,
                    ),
                  ),
                  onChange: ((DateTime date, list) {
                    print(date);
                    _selectedDate = date;
                  }),
                  looping: looping,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: ColorUtilities.offWhite,
                        ),
                        child: Text(
                          "Discard",
                          style: FontUtilities.h16(
                            fontFamily: FontFamily.mediumInter,
                            color: ColorUtilities.offWhite,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: ColorUtilities.offButtonColor),
                        child: Text(
                          "Confirm",
                          style: FontUtilities.h16(
                              color: ColorUtilities.goldenColor,
                              fontFamily: FontFamily.mediumInter,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.pop(context, _selectedDate);
                        },
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
    return showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) => datePickerDialog);
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.minDateTime,
    this.maxDateTime,
    this.initialDateTime,
    this.dateFormat,
    this.pickerMode,
    this.pickerTheme,
    this.onCancel,
    this.onChange,
    this.onConfirm,
    this.theme,
    this.barrierLabel,
    RouteSettings? settings,
  }) : super(settings: settings);

  final DateTime? minDateTime, maxDateTime, initialDateTime;
  final String? dateFormat;

  final DateTimePickerMode? pickerMode;
  final DateTimePickerTheme? pickerTheme;
  final VoidCallback? onCancel;
  final DateValueCallback? onChange;
  final DateValueCallback? onConfirm;

  final ThemeData? theme;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    double height = pickerTheme!.pickerHeight;
    if (pickerTheme!.title != null || pickerTheme!.showTitle) {
      height += pickerTheme!.titleHeight;
    }

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(route: this, pickerHeight: height),
    );

    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }
    return bottomSheet;
  }
}

class _DatePickerComponent extends StatelessWidget {
  final _DatePickerRoute route;
  final double _pickerHeight;

  _DatePickerComponent({required this.route, required pickerHeight})
      : this._pickerHeight = pickerHeight;

  @override
  Widget build(BuildContext context) {
    Widget pickerWidget = DatePickerWidget(
      firstDate: route.minDateTime,
      lastDate: route.maxDateTime,
      initialDate: route.initialDateTime,
      dateFormat: route.dateFormat,
      pickerTheme: route.pickerTheme,
      onCancel: route.onCancel,
      onChange: route.onChange,
      onConfirm: route.onConfirm,
    );
    return GestureDetector(
      child: AnimatedBuilder(
        animation: route.animation!,
        builder: (BuildContext context, Widget? child) {
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _BottomPickerLayout(route.animation!.value,
                  contentHeight: _pickerHeight),
              child: pickerWidget,
            ),
          );
        },
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, {this.contentHeight});

  final double progress;
  final double? contentHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: contentHeight!,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
