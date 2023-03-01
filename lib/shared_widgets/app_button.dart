import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;

  const AppButton({Key? key, this.text, this.onPressed, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(onPressed: onPressed, child: Text(text ?? ""));
  }
}
