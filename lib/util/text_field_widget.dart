import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.customController,
      required this.labelText,
      required this.elementsColor,
      required this.prefixIcon});
  final TextEditingController customController;
  final String labelText;
  final Color elementsColor;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: customController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: elementsColor),
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(color: elementsColor),
        prefixIcon: prefixIcon,
        prefixIconColor: elementsColor,
      ),
    );
  }
}


// TextField(
//                     controller: inchCont,
//                     keyboardType: TextInputType.number,
//                     style: TextStyle(color: elementsColor),
//                     decoration: InputDecoration(
//                       label: const Text('Enter Your Heigh (in Inch)'),
//                       labelStyle: TextStyle(color: elementsColor),
//                       prefixIcon: const Icon(Icons.height),
//                       prefixIconColor: elementsColor,
//                     ),
//                   ),