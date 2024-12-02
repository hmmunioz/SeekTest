import 'package:flutter_translate/flutter_translate.dart';

enum FilterEnum { all, completed, pending }

extension FilterEnumExtension on FilterEnum {
  String get text {
    switch (this) {
      case FilterEnum.all:
        return translate('all');
      case FilterEnum.completed:
        return translate('completed');
      case FilterEnum.pending:
        return translate('pending');
      default:
        return '';
    }
  }
}
