import 'dart:ui';

class L10n {
  static final supportedLanguages = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('ar'),
  ];
}

class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(2, "🇺🇸", "English", "en"),
      Language(3, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
      Language(4, "🇮🇳", "हिंदी", "hi")
    ];
  }
}
