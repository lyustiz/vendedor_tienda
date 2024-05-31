import 'package:flutter/material.dart';

Future<bool?> appDialog(context, String title, List<Widget> content,
    {String action = 'Ok', bool showCancel = true}) async {
  return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(title, textAlign: TextAlign.center),
            content: ListView(children: [
              Column(mainAxisSize: MainAxisSize.max, children: content)
            ]),
            actions: <Widget>[
              showCancel
                  ? ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 10)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: const BorderSide(
                                          color: Colors.white, width: 2))),
                          elevation: MaterialStateProperty.all(0)),
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancelar',
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    )
                  : Container(),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(
                                  color: Colors.white, width: 2)))),
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(action,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 13))),
            ],
          ));
}
