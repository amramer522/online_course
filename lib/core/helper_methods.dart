import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo({required page, withHistory = true}) {
  return Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => withHistory);
}

enum MessageType { warning, success, failed }

void showToast(String msg, {MessageType type = MessageType.failed}) {
  ScaffoldMessenger.of(
    navigatorKey.currentContext!,
  ).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: type == MessageType.failed
          ? Colors.red
          : type == MessageType.success
              ? Colors.green
              : Colors.yellow,
    ),
  );
}
