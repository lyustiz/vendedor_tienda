import 'package:flutter/material.dart';

Future<bool?> appFullLoading(context, {int seconds = 0}) async {
  Future.delayed(Duration(seconds: (seconds == 0) ? 4 : seconds), () {
    Navigator.pop(context, true);
  });

  return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: const CircularProgressIndicator()));
}
