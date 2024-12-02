import 'package:seektest/app/utils/cubits/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seektest/app/utils/size_config.dart';

class SeekButtonWidget extends StatelessWidget {
  const SeekButtonWidget({
    super.key,
    this.functionToExecute,
    required this.text,
    required this.icon,
  });
  final VoidCallback? functionToExecute;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, themeState) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        height: 50,
        child: ElevatedButton(
          onPressed: functionToExecute,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorLight),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorLight),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.sm),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColorDark,
              ),
              SizedBox(
                width: 0.04.sw,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'YuGiOhMatrix',
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
