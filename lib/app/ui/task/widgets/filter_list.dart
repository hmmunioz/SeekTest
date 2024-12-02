import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seektest/app/blocs/init/init_bloc.dart';
import 'package:seektest/app/blocs/task/task_state.dart';
import 'package:seektest/app/constants/constants.dart';
import 'package:seektest/app/enums/filter_enum.dart';
import 'package:seektest/app/ui/task/pages/task_interactor.dart';
import 'package:seektest/app/utils/size_config.dart';
import 'package:seektest/app/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterList extends StatelessWidget {
  final TaskInteractor taskInteractor;
  final TaskState taskState;

  const FilterList({
    required this.taskInteractor,
    required this.taskState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.sm),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.sm),
      height: 0.06.sh,
      child: Row(
        children: ConstantsValues.filterList.map((filter) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.sm * 0.5),
              child: FilterChipsCustom(
                text: filter.text,
                onSelected: () {
                  taskInteractor.changeFilter(context, filter);
                },
                isSelected: filter.name == taskState.currentFilter.name,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FilterChipsCustom extends StatelessWidget {
  final String text;
  final VoidCallback onSelected;
  final bool isSelected;

  const FilterChipsCustom({
    required this.text,
    required this.onSelected,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: FilterChip(
        selectedColor: isSelected ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColor,
        checkmarkColor: isSelected ? Colors.grey : Theme.of(context).primaryColorLight,
        side: BorderSide(
          color: Theme.of(context).primaryColorDark,
        ),
        selected: isSelected,
        labelStyle: AppStyles.bubbleSubTitleStyle(
          context: context,
        ),
        label: Text(
          text,
          style: AppStyles.bubbleSubTitleStyle(
            context: context,
            fontSize: SizeConfig.md,
            color: Colors.grey,
          ),
        ),
        onSelected: (bool selected) {
          onSelected();
        },
      ),
    );
  }
}
