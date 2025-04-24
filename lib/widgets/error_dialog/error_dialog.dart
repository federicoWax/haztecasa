import 'package:flutter/material.dart';

class ErrorDialog {
  static Future<void> show(BuildContext context, String message, VoidCallback? onClose) async {
    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  if (onClose != null) {
                    onClose();
                  }
                },
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }
}
