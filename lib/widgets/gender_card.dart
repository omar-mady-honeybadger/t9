import 'package:flutter/material.dart';
import 'package:t9/colors.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.ginderIcon,
    required this.genderText,
    required this.onPressed,
    this.isSelected = false,
  });
  final IconData ginderIcon;
  final String genderText;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ginderIcon, size: 100, color: AppColors.whiteColor),
              Text(genderText, style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
      ),
    );
  }
}
