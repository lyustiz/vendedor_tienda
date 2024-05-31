import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool validate;
  final String? validateType;

  const CustomInput(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.validate = false,
      this.validateType});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: const EdgeInsets.only(top: 5, left: 13, bottom: 5, right: 20),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextFormField(
            controller: textController,
            autocorrect: false,
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                border: InputBorder.none,
                hintText: placeholder),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (validate == true) {
                return _validate(value = '1');
              }
              return null;
            }));
  }

  String _validate(String value) {
    bool hasStr(validateType, string) {
      return string.indexOf(validateType) != -1;
    }

    if (hasStr(validateType, 'required') && value.isEmpty) {
      return 'Dato requerido';
    }

    if (hasStr(validateType, 'short') && value.length < 3) {
      return 'Dato Invalido';
    }

    return '';
  }
}
