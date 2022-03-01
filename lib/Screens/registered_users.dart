import 'package:docapp/Screens/topdoctors.dart';
import 'package:flutter/material.dart';

class RegisteredUsers extends StatelessWidget {
  const RegisteredUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 51, 61, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: const [
            Text(
              'Registered Users',
              style: TextStyle(fontSize: 29),
            ),
            TopDoctors(),
          ]),
        ),
      ),
    );
  }
}
