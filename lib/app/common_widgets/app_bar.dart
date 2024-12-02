import 'package:seektest/app/common_widgets/flag_language.dart';
import 'package:seektest/app/utils/cubits/theme_cubit.dart';
import 'package:seektest/app/utils/size_config.dart';
import 'package:seektest/app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'btn_back_widget.dart';

class AppBarSeek extends StatelessWidget {
  const AppBarSeek({
    super.key,
    required this.isBack,
  });

  final bool isBack;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      toolbarHeight: size.height * .06,
      elevation: 10,
      leading: isBack
          ? const ButtonBack()
          : Padding(
              padding: EdgeInsets.all(SizeConfig.xs),
              child: const FlagLanguage(),
            ),
      title: Text(
        translate('seek'),
        style: AppStyles.titleStyle(context: context, color: Theme.of(context).primaryColor),
      ),
      centerTitle: true,
      actions: [
        if (!isBack)
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return GestureDetector(
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.sm),
                  child: Icon(
                    themeState != ThemeState.light ? Icons.dark_mode : Icons.light_mode,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
