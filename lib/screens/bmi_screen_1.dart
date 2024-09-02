import 'package:flutter/material.dart';

class BmiScreen1 extends StatelessWidget {
  const BmiScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Calculator',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox.square(
              dimension: 100,
              child: Image.asset('assets/images/bmimeter2.png'),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/bmiscreen2');
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
