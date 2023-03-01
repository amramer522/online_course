import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isPassword;
  final double marginTop;
  final double marginBottom;
  final TextEditingController? controller;

  const AppInput(
      {Key? key, this.validator,this.controller, this.isPassword = false, this.labelText, this.marginTop=0, this.marginBottom=20})
      : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: widget.marginBottom,left: 20,right: 20,top: widget.marginTop),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isHidden && widget.isPassword,
        validator: widget.validator,
        decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    child:
                        Icon(isHidden ? Icons.visibility_off : Icons.visibility))
                : null),
      ),
    );
  }
}
