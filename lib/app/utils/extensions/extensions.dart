import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension SizedBoxBasedOnNum on num {
  get ph => SizedBox(
        width: toDouble(),
      );
  get pv => SizedBox(
        height: toDouble(),
      );
}
