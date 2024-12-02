import 'package:flutter/material.dart';
import 'package:seektest/app/common_widgets/btn_widget.dart';
import 'package:seektest/app/constants/assets.dart';
import 'package:flutter_translate/flutter_translate.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    this.image,
    super.key,
    this.message,
    this.onTap,
    this.title,
  });

  final String? image;
  final String? message;
  final GestureTapCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.10,
        ),
        Image.asset(
          AssetsUIValues.noResults,
          height: 40,
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (message != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (onTap != null)
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SeekButtonWidget(
                    functionToExecute: onTap,
                    text: translate('reload'),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
