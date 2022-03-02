import 'package:docapp/Auth/auth.dart';
import 'package:docapp/Auth/auth_form.dart';
import 'package:docapp/Screens/doc_details.dart';
import 'package:docapp/Screens/homescreen.dart';
import 'package:docapp/Screens/registered_users.dart';
import 'package:docapp/Widgets/custom_search.dart';
import 'package:docapp/provider/clinic_provider.dart';
import 'package:docapp/provider/patient_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PatientsData()),
          ChangeNotifierProvider(create: (context) => ClinicData()),
        ],
        child: MaterialApp(
          title: 'DocApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'PT Serif',
            textTheme: const TextTheme(
              button: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          //home: const customSearch(),
          home: AuthHomePage(
            controller: _controller,
          ),
          routes: {
            AuthForm.id: (context) => const AuthForm(),
            HomeScreen.id: (context) => const HomeScreen(),
            DoctorDetails.id: (context) => const DoctorDetails(),
          },
        ));
  }
}
