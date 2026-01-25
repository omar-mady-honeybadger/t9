import 'package:flutter/material.dart';
import 'package:t9/colors.dart';
import 'package:t9/screens/result.dart';
import 'package:t9/widgets/counter_card.dart';
import 'package:t9/widgets/gender_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isMale = false;
  int age = 24;
  int weight = 60;
  int height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          children: [
            const Icon(Icons.local_pizza_rounded, color: AppColors.whiteColor),
            SizedBox(width: 20),
            const Text(
              'Bmindex',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderCard(
                    ginderIcon: Icons.male_rounded,
                    genderText: 'male',
                    onPressed: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    isSelected: isMale,
                  ),
                  SizedBox(width: 20),
                  GenderCard(
                    ginderIcon: Icons.female_rounded,
                    genderText: 'female',
                    onPressed: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    isSelected: !isMale,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    Text(
                      '$age',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: age.toDouble(),
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          age = value.toInt();
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  CounterCard(
                    title: 'weight',
                    value: '$weight',
                    unit: 'kg',
                    onAdd: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onAddLongPress: () {
                      setState(() {
                        weight += 10;
                      });
                    },
                    onSubtract: () {
                      setState(() {
                        if (weight > 1) {
                          weight--;
                        }
                      });
                    },
                    onSubtractLongPress: () {
                      setState(() {
                        if (weight > 10) {
                          weight -= 10;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  CounterCard(
                    title: 'height',
                    value: '$height',
                    unit: 'cm',
                    onAdd: () {
                      setState(() {
                        height++;
                      });
                    },
                    onAddLongPress: () {
                      setState(() {
                        height += 10;
                      });
                    },
                    onSubtract: () {
                      setState(() {
                        if (height > 1) {
                          height--;
                        }
                      });
                    },
                    onSubtractLongPress: () {
                      setState(() {
                        if (height > 10) {
                          height -= 10;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                double bmi = (weight / (height * height) * 10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmi: bmi),
                  ),
                );
              },
              child: const Text(
                'Calculate',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
