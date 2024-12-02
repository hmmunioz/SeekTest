import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        size: 26.w,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
