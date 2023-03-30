import 'package:flutter/material.dart';

class WidgetFormField extends StatefulWidget {
  const WidgetFormField(
      {super.key,
      required this.decoration,
      required this.hint,
      required this.hideonbush,
      required this.myController});
  final String decoration;
  final String hint;
  final bool hideonbush;
  final TextEditingController myController;

  @override
  State<WidgetFormField> createState() => _WidgetFormFieldState();
}

class _WidgetFormFieldState extends State<WidgetFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: widget.myController,
              obscureText: widget.hideonbush,
              decoration: InputDecoration(
                  hintText: widget.hint, labelText: widget.decoration),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
            ),
          ]),
    );
  }
}
