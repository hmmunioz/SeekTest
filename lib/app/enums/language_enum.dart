enum LanguageEnum { es, en }

extension LanguageEnumExtension on LanguageEnum {
  String get name {
    switch (this) {
      case LanguageEnum.es:
        return 'es_ES';
      case LanguageEnum.en:
        return 'en_US';
      default:
        return 'es_ES';
    }
  }
}
