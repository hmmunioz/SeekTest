import 'package:seektest/app/constants/assets.dart';
import 'package:seektest/app/enums/language_enum.dart';
import 'package:seektest/app/utils/localstorage.dart';
import 'package:seektest/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class FlagLanguage extends StatefulWidget {
  const FlagLanguage({
    super.key,
    this.showButton = true,
    this.flagWidth = 32.0,
  });
  final bool showButton;
  final double flagWidth;
  @override
  FLagLanguageState createState() => FLagLanguageState();
}

class FLagLanguageState extends State<FlagLanguage> {
  String? currentLocale = '';
  late SharedPreferences prefs;
  final LocalStorageService _localStorageService = GetIt.I<LocalStorageService>();
  @override
  void initState() {
    currentLocale = _localStorageService.getLanguageStorage;
    super.initState();
  }

  _onChange(LanguageEnum languageEnum) async {
    _localStorageService.setLanguageStorage = languageEnum.name;
    changeLocale(context, languageEnum.name);
    currentLocale = _localStorageService.getLanguageStorage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onChange(currentLocale == LanguageEnum.es.name || currentLocale == '' || currentLocale == null
              ? LanguageEnum.en
              : LanguageEnum.es);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: .03.sw,
              height: .03.sw,
              currentLocale == LanguageEnum.es.name || currentLocale == '' || currentLocale == null
                  ? AssetsUIValues.languageEs
                  : AssetsUIValues.languageEn,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              currentLocale == LanguageEnum.es.name ? "esp" : "en",
              style: TextStyle(fontSize: SizeConfig.mdlg, color: Theme.of(context).primaryColor),
            )
          ],
        ));
  }
}
