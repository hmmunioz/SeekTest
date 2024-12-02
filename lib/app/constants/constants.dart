import 'dart:ui';

import 'package:seektest/app/enums/filter_enum.dart';

class ConstantsValues {
  ConstantsValues._();
  static String language = 'en-En';
  static const designSize = Size(430, 932);
  static List<String> yesNoList = ['Si', 'No'];
  static List<FilterEnum> filterList = [
    FilterEnum.all,
    FilterEnum.pending,
    FilterEnum.completed,
  ];
}
