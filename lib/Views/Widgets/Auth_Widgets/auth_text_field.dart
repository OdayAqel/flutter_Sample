import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  final String labelText;
  final IconData? icon;
  final TextStyle? style;
  final Color? fillColor; // Added fillColor parameter

  const AuthTextField({
    Key? key,
    required this.labelText,
    this.textInputType = TextInputType.text,
    required this.controller,
    this.obscure = false,
    this.icon,
    this.style,
    this.fillColor, // Added fillColor parameter
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool showPassword = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: showPassword,
        keyboardType: widget.textInputType,
        style: widget.style,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.obscure
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          fillColor: widget.fillColor, // Apply the provided fillColor
        ),
      ),
    );
  }
}
