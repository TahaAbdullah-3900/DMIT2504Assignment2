// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2'),
      ),
      body: Column(
        children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Enable Buttons'),
                Switch(
                  value: enabled,
                  onChanged: (bool value) {
                    setState(() {
                      enabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here 
              // as children of the row.
              // For each button use a 
              // "Visibility Widget" and its child 
              // will be an "ElevatedButton"
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked++;
                    });
                  },
                  child: Text('Clicked $timesClicked'),
                ),
              ),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked = 0;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                   TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'first name',
                      hintText: 'Enter your first name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        firstName = textEditingController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hey There, Your name is $firstName'),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}