import 'package:flutter/material.dart';

class BmiScreen1 extends StatelessWidget {
  const BmiScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Calculator',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
            ),
            SizedBox.square(
              dimension: 100,
              child: Image.asset('assets/images/bmiappicon.png'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
