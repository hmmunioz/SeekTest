import 'package:flutter/material.dart';
import 'package:seektest/app/constants/colors.dart';
import 'package:seektest/app/utils/size_config.dart';

class SeekButtonWidget extends StatelessWidget {
  const SeekButtonWidget({
    super.key,
    this.functionToExecute,
    required this.text,
  });
  final VoidCallback? functionToExecute;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: functionToExecute,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorsTheme.jediBrown),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape:
                MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.sm)))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'YuGiOhMatrix',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
