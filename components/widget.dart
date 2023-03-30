import 'package:flutter/material.dart';
import '../components/form.dart';
import '../services/http.dart';

import '../services/httpdelete.dart';
import '../services/httpput.dart';

class WidgetForm extends StatefulWidget {
  const WidgetForm({super.key, required this.idedit, required this.logged});
  final int idedit;
  final bool logged;
  @override
  State<WidgetForm> createState() => _WidgetFormState();
}

class _WidgetFormState extends State<WidgetForm> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); //check vodep about global variables
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WidgetFormField(
            decoration: 'Email ',
            hint: 'example@example.com',
            hideonbush: false,
            myController: myController1,
          ),
          WidgetFormField(
            decoration: 'password',
            hint: 'Password',
            hideonbush: true,
            myController: myController2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                ((widget.logged)
                        ? await postRequest(
                            "login", myController1.text, myController2.text)
                        : await putRequest("products", widget.idedit,
                            myController1.text, myController2.text))
                    ? Navigator.pushNamed(context, '/products')
                    : myController1.text = "error";
              },
              child: (widget.logged) ? const Text('Login') : const Text('Edit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                ((widget.logged)
                        ? await postRequest(
                            "products", myController1.text, myController2.text)
                        : await deleteRequest("products", widget.idedit,
                            myController1.text, myController2.text))
                    ? Navigator.pushNamed(context, '/products')
                    : myController1.text = "error";
              },
              child: (widget.logged)
                  ? const Text('Sign Up')
                  : const Text('Delete'),
            ),
          )
        ],
      ),
    );
  }
}
