import 'package:bmi_app/screens/bmi_screen_1.dart';
import 'package:bmi_app/screens/bmi_screen_2.dart';
import 'package:bmi_app/util/text_field_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const BmiScreen1(),
      routes: {
        '/bmiscreen1': (context) => const BmiScreen1(),
        '/bmiscreen2': (context) => const BmiScreen2()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wgtCont = TextEditingController();
  var ftCont = TextEditingController();
  var inchCont = TextEditingController();

  var result = '';
  var msg = '';
  var bgColor = const Color.fromARGB(255, 105, 105, 105);
  var elementsColor = Colors.white;

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: SizedBox(
          height: 520,
          child: Card(
            color: bgColor,
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                      color: elementsColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                      customController: wgtCont,
                      labelText: 'Enter Your Weight (in Kgs)',
                      elementsColor: elementsColor,
                      prefixIcon: const Icon(Icons.line_weight_rounded)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      customController: ftCont,
                      labelText: 'Enter Your Height (in Feet)',
                      elementsColor: elementsColor,
                      prefixIcon: const Icon(Icons.height)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      customController: inchCont,
                      labelText: 'Enter Your Heigh (in Inch)',
                      elementsColor: elementsColor,
                      prefixIcon: const Icon(Icons.height)),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wgt = wgtCont.text.toString();
                        var ft = ftCont.text.toString();
                        var inch = inchCont.text.toString();

                        if (wgt != '' && ft != '' && inch != '') {
                          //BMI Calculations
                          var iWgt = int.parse(wgt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + (iInch);

                          var tMeter = tInch * 0.0254;

                          var bmi = iWgt / (tMeter * tMeter);

                          if (bmi < 18.5) {
                            //Underweight
                            setState(() {
                              msg = 'You are Under Weight';
                              bgColor = Colors.yellow;
                              elementsColor = Colors.black;
                            });
                          } else if (bmi > 18.5 && bmi < 24.9) {
                            //Healthy
                            setState(() {
                              msg = 'You are Healthy';
                              bgColor = Colors.green;
                            });
                          } else if (bmi > 30 && bmi < 39.9) {
                            //Obese
                            setState(() {
                              msg = 'You are Over Weight';
                              bgColor = Colors.red;
                              elementsColor = Colors.black;
                            });
                          }
                          setState(() {
                            result = 'Your BMI is: ${bmi.roundToDouble()}';
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required blanks!';
                          });
                        }
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    result,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: elementsColor),
                  ),
                  Text(
                    msg,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: elementsColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
