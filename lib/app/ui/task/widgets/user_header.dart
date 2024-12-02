import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:seektest/app/common_widgets/circular_image.dart';
import 'package:seektest/app/constants/assets.dart';

class UserHeader extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const UserHeader({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskStatistic(
                count: completedTasks,
                labelKey: translate('completed'),
              ),
              const CircularImage(
                assetPath: AssetsUIValues.photo,
                size: 100.0,
              ),
              TaskStatistic(
                count: totalTasks,
                labelKey: translate('total'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            translate('nameUser'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
              height: 0.7,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            translate('flutter_developer'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskStatistic extends StatelessWidget {
  final int count;
  final String labelKey;

  const TaskStatistic({
    super.key,
    required this.count,
    required this.labelKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        Text(
          translate(labelKey),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
