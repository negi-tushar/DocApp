//import 'package:docapp/Auth/auth_form.dart';
import 'package:docapp/Screens/animations.dart';
import 'package:docapp/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class AuthHomePage extends StatelessWidget {
  AuthHomePage({Key? key, required AnimationController controller})
      : animation = MyAnimation(controller: controller),
        super(key: key);

  final MyAnimation animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 51, 61, 1),
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (
          context,
          _,
        ) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    opacity: animation.opanimation,
                    image: const AssetImage(
                      'assets/images/docapp.png',
                    ),
                  ),
                  CustomButton(
                      animation: animation,
                      title: "Patient's Login",
                      args: 'Patient'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      animation: animation,
                      title: "Doctor's Login",
                      args: 'Doctor'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
