import 'dart:convert';

import 'package:docapp/models/patient_details.dart';
import 'package:docapp/provider/patient_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);
  static String id = 'DoctorDetails';
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

bool init = true;

class _DoctorDetailsState extends State<DoctorDetails> {
  late PatientDetails details;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    print('hello- didChangeDependencies');

    print('hello- hewe');
    var d = ModalRoute.of(context)?.settings.arguments as PatientDetails;
    // var d = await Provider.of<PatientsData>(context, listen: false)
    //     .getDetailsbyId(id);

    setState(() {
      details = d;
    });

    // init = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        //  child: Text(details.email),
        child: Stack(
          //   fit: StackFit.expand,

          children: [
            Container(
              padding: const EdgeInsets.all(40),
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 207, 199, 1),
                    Color.fromRGBO(246, 147, 131, 1),
                  ],
                ),
              ),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: details.image.isEmpty
                    ? const Image(
                        image: AssetImage(
                          'assets/images/user.png',
                        ),
                        fit: BoxFit.contain,
                      )
                    : Image(
                        image: MemoryImage(
                          base64Decode(details.image),
                        ),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Positioned(
              // width: 300,
              // height: 200,
              top: MediaQuery.of(context).size.height / 3,
              bottom: 0,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  // margin: const EdgeInsets.,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(43, 51, 61, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'About',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Fees : 300',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 248, 169, 156),
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Dr ${details.fname + ' ' + details.lname} is currently working in Dehradun as a Heart Surgon.'),
                      const SizedBox(
                        height: 20,
                      ),
                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 4),
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         child: Text('hello'),
                      //       );
                      //     }),
                    ],
                  )),
            ),
            Positioned(
              left: 80,
              right: 80,
              top: MediaQuery.of(context).size.height / 3.6,
              bottom: MediaQuery.of(context).size.height / 1.9,
              child: Container(
                padding: const EdgeInsets.all(20),
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
                child: Text(
                  ' ${details.fname + ' ' + details.lname}',
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              // width: MediaQuery.of(context).size.width - 50,
              left: 20,
              right: 20,
              // right: 20,
              bottom: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: int.parse(details.id).isEven
                      ? const Color.fromRGBO(85, 193, 206, 1)
                      : const Color.fromRGBO(226, 147, 131, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
