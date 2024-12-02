import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onSelected;

  const AddButton({
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: Theme.of(context).primaryColorLight,
              size: 20.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              translate('add'),
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
