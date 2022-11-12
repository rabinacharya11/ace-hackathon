import 'package:flutter/material.dart';
import 'package:waste_manage_sys/authentication/presentation/login.dart';

class ShowDialog {
  static Future<void> showMyDialog(var context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error !', style: TextStyle(color: Colors.red)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> userCreateDialog(var context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Register Success ',
              style: TextStyle(fontWeight: FontWeight.w400)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen())),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> logOut(var context) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Warning",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.yellow)),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  "Do you sure want to log out ?",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(onPressed: () {}, child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No")),
          ],
        );
      },
    );
  }

  static Future<bool> onBackButtonPressed(BuildContext context) async {
    bool? exitapp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Warning",
              style: TextStyle(color: Colors.yellow),
            ),
            content: const Text("Exiting Upload ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Yes")),
            ],
          );
        });
    return exitapp ?? false;
  }
}
