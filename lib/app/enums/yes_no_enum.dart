import 'package:flutter_translate/flutter_translate.dart';

enum YesNoEnum { yes, no }

extension YesNoEnumExtension on YesNoEnum {
  String get name {
    switch (this) {
      case YesNoEnum.yes:
        return translate('yes');
      case YesNoEnum.no:
        return translate('no');
      default:
        return translate('yes');
    }
  }
}
