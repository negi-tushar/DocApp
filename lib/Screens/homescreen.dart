import 'dart:convert';
import 'package:docapp/Screens/topdoctors.dart';
import 'package:docapp/Widgets/custom_search.dart';
import 'package:docapp/models/patient_details.dart';
import 'package:docapp/provider/patient_data_provider.dart';
import 'package:http/http.dart' as http;

import 'package:docapp/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool isInit = true;
var image = '';

//final _imageUrls = [
//   'https://picsum.photos/200/300',
//   'https://picsum.photos/200/300',
//   'https://picsum.photos/200/300',
//   'https://picsum.photos/200/300',
//   'https://picsum.photos/200/300',
//   'https://picsum.photos/200/300',
// ];

class _HomeScreenState extends State<HomeScreen> {
  List<PatientDetails> details = [];
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // print('hello- didChangeDependencies');

    //print('hello- hewe');
    if (isInit) {
      var id = ModalRoute.of(context)?.settings.arguments as String;
      var d = await Provider.of<PatientsData>(context, listen: false)
          .getDetailsbyId(id);
      print('called successfully');
      setState(() {
        details = d;
      });
    }
    isInit = false;
  }

  @override
  void initState() {
    //  setDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(details.first.email);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 51, 61, 1),
      drawer: MyDrawer(data: details),
      body: details.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 33,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: details.first.image.isEmpty
                                ? null
                                : MemoryImage(
                                    base64Decode(details.first.image)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hello ${details.first.fname}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Find Your Doctor',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const customSearch(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(150, 217, 220, 1),
                                    Color.fromRGBO(85, 193, 206, 1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.headphones,
                                    size: 80,
                                  ),
                                  Text('data'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(255, 207, 199, 1),
                                    Color.fromRGBO(246, 147, 131, 1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.headphones,
                                    size: 80,
                                  ),
                                  Text('data'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(249, 243, 207, 1),
                                    Color.fromRGBO(244, 208, 63, 1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.headphones,
                                    size: 80,
                                  ),
                                  Text('data'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Top Clinics',
                        style: TextStyle(fontSize: 30),
                      ),
                      const TopDoctors(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
