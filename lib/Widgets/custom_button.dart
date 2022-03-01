import 'package:docapp/Auth/auth_form.dart';
import 'package:docapp/Screens/animations.dart';
import 'package:docapp/Widgets/custom_routes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.animation,
    required this.title,
    required this.args,
  }) : super(key: key);

  final MyAnimation animation;
  final String title, args;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent
      //     .withOpacity(animation.opanimation.value),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            CustomRoutes(child: const AuthForm(), args: args),
          );
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            minimumSize: Size(animation.sizeanimation.value, 0),
            //side: const BorderSide(width: 0., color: Colors.white),
            padding: const EdgeInsets.symmetric(vertical: 10),
            primary: Color.fromARGB(255, 221, 139, 84)),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
