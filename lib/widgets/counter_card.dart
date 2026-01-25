import 'package:flutter/material.dart';
import 'package:t9/colors.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.onAdd,
    required this.onSubtract,
    required this.onAddLongPress,
    required this.onSubtractLongPress,
  });
  final String title;
  final String value;
  final String unit;
  final Function() onAdd;
  final Function() onSubtract;
  final Function()? onAddLongPress;
  final Function()? onSubtractLongPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: AppColors.whiteColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value.toString(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(unit, style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: onSubtract,
                  onLongPress: onSubtractLongPress,
                  icon: const Icon(Icons.remove_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    iconSize: 40,
                  ),
                ),
                SizedBox(width: 10),
                IconButton.filled(
                  onPressed: onAdd,
                  onLongPress: onAddLongPress,
                  icon: const Icon(Icons.add_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    iconSize: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
