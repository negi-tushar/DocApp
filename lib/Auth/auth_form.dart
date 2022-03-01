import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:docapp/Screens/homescreen.dart';
import 'package:docapp/Widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);
  static String id = "AuthForm";

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isInit = true;
  var _mode = 'hh';
  var _isLogin = true;
  var firstName = '';
  var lastName = '';
  var email = '';
  var password = '';
  var phoneNo = '';
  var dob = DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.now());

  var userImage = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //print('called');
    if (isInit) {
      var getMode = ModalRoute.of(context)!.settings.arguments as String;
      if (getMode.isNotEmpty) {
        _mode = getMode;
        print(_mode);
      } else {
        // print(_mode);
        isInit = false;
        return;
      }
    }
  }

  void getImageString(String image) {
    userImage = image;
    print('user-image ----->${userImage.trim().length}');
    // print(DateTime.parse(dob));
  }

  @override
  Widget build(BuildContext context) {
    print('_isLogin - $_isLogin');
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 51, 61, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Welcome to\n DocApp',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              // ),\
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 70,
                    // color: Colors.red,
                    child: const Image(
                        image: AssetImage(
                      'assets/images/docapp.png',
                    ))),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              if (!_isLogin) UserImage(img: getImageString),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _isLogin ? 'Sign In' : 'Sign Up',
                        //   textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 35),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!_isLogin)
                        Row(
                          children: [
                            Expanded(
                                child: customFormField(
                              name: 'First Name',
                              icon: Icons.person,
                              message: 'Please enter valid Name',
                            )),
                            Expanded(
                              child: customFormField(
                                name: 'Last Name',
                                message: 'Please enter valid Name',
                              ),
                            ),
                          ],
                        ),
                      if (!_isLogin)
                        const SizedBox(
                          height: 10,
                        ),
                      customFormField(
                        icon: Icons.email,
                        name: 'Email',
                        keyboardtype: TextInputType.emailAddress,
                        message: 'Please enter valid Email',
                      ),
                      if (!_isLogin)
                        const SizedBox(
                          height: 10,
                        ),
                      if (!_isLogin)
                        customFormField(
                          name: 'Phone No.',
                          icon: Icons.phone,
                          message: 'Please enter valid Name',
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!_isLogin)
                        customFormField(
                          name: 'DOB',
                          icon: Icons.calendar_month,
                          keyboardtype: TextInputType.datetime,
                          message: 'Please enter valid DOB',
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      customFormField(
                        name: 'Password',
                        icon: Icons.password,
                        obsecureText: true,
                        message: 'password should be minimum 5 characters',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!_isLogin)
                        customFormField(
                          name: 'Confirm Password',
                          icon: Icons.password,
                          obsecureText: true,
                          message: 'Password should be minimum 5 characters',
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (!_isLogin) {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState!.save();
                            print('email ----->$dob');

                            var headers = {'Content-Type': 'application/json'};
                            var request = http.Request(
                                'POST',
                                Uri.parse(
                                    'http://192.168.1.8:8000/patient/registeration'));
                            // print('object');
                            request.body = json.encode({
                              "fname": firstName,
                              "lname": lastName,
                              "email": email,
                              "password": password,
                              "phoneNo": phoneNo,
                              "dob": dob,
                              "image": userImage,
                            });
                            request.headers.addAll(headers);

                            http.StreamedResponse response =
                                await request.send();

                            if (response.statusCode == 200) {
                              print(await response.stream.bytesToString());
                            } else {
                              print(response.reasonPhrase);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Successfully Registered')),
                            );
                            setState(() {
                              _isLogin = true;
                            });
                          } else {
                            _formKey.currentState!.save();
                            print('email ----->$email');
                            var req = await http.get(Uri.parse(
                                'http://192.168.1.8:8000/patient/$email'));
                            //   print('Status Code${req.body}');
                            var j = json.decode(req.body);

                            if (j == null || req.statusCode != 200) {
                              //  print(j);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Invalid UserName or password')),
                              );
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomeScreen.id, (route) => false,
                                  arguments: email);
                            }
                          }
                        },
                        child: Text(
                          !_isLogin ? 'Sign up' : 'Login',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          !_isLogin
                              ? 'Already have a Account, Sign In'
                              : "Don't have account, Sign Up Here",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customFormField(
      {required String name,
      IconData? icon,
      required String message,
      bool? obsecureText = false,
      TextInputType? keyboardtype}) {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboardtype,
        obscureText: obsecureText!,
        key: ValueKey(name),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.blue),
          // ),
          labelStyle: const TextStyle(color: Colors.white60),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(name),
        ),
        validator: (value) {
          if (value!.isEmpty && value.length < 3) {
            return message;
          }
          if (name == 'Confirm Password') {
            if (password != value) {
              // print('value-----> $value');
              // print('value-----> $changevalue');
              return 'Password not match';
            }
          }
        },
        onChanged: (v) {
          if (name == 'Email') {
            firstName = v;
          } else if (name == 'Password') {
            password = v;
          }
        },
        onSaved: (v) {
          if (name == 'First Name') {
            firstName = v!;
          } else if (name == 'Last Name') {
            lastName = v!;
          } else if (name == 'Email') {
            email = v!;
          } else if (name == 'Phone No.') {
            phoneNo = v!;
          }
          // else if (name == 'DOB') {
          //   dob = v!;
          // }
          else if (name == 'Password') {
            password = v!;
          }
        });
  }
}
