import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CommonHelper {
  CommonHelper();
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void flushMessage(
    BuildContext context, [
    String? message,
    String? title,
  ]) {
    Flushbar(
      title: title ?? 'Notification',
      message: message,
      backgroundColor: Colors.white,
      titleColor: Colors.black,
      messageColor: Colors.black87,
      maxWidth: 320,
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(12),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 4),
      animationDuration: const Duration(milliseconds: 600),
      boxShadows: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      icon: const Icon(
        Icons.notifications_active_rounded,
        size: 28,
        color: Colors.black,
      ),
      // optional: add a progress bar at the bottom
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blue.shade100,
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
        Colors.blueAccent,
      ),
    ).show(context);
  }

  static void alertDialog(
    BuildContext context, [
    String? message,
    String? title,
  ]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Notification'),
          content: Text(message ?? 'No message provided.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
