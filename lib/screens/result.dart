import 'package:flutter/material.dart';
import 'package:t9/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi});

  final double bmi;

  String getClassification(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  Color getClassificationColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'You are under the normal weight. You can eat a bit more.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'You are slightly overweight. Try to exercise more.';
    } else {
      return 'You are heavily overweight. Consult a doctor.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Your Result',
              style: TextStyle(color: AppColors.whiteColor, fontSize: 40),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          getClassification(bmi),
                          style: TextStyle(
                            color: getClassificationColor(bmi),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          bmi.toStringAsFixed(2),
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          getInterpretation(bmi),
                          style: TextStyle(color: AppColors.whiteColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Recalculate',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
