import 'dart:convert';

import 'package:docapp/Screens/doc_details.dart';
import 'package:docapp/models/clinic_details.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.details,
    required this.index,
    required this.location,
  }) : super(key: key);
  final String location;
  final int index;
  final ClinicDetails details;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pushNamed(DoctorDetails.id, arguments: details);
      }),
      child: ListTile(
        minVerticalPadding: 15,
        //  isThreeLine: true,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: index.isEven
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                          Color.fromRGBO(150, 217, 220, 1),
                          Color.fromRGBO(85, 193, 206, 1),
                        ])
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                          Color.fromRGBO(255, 207, 199, 1),
                          Color.fromRGBO(246, 147, 131, 1),
                        ])),
          child: details.clinicName.isNotEmpty
              ? const CircleAvatar(
                  child: Icon(Icons.person),
                )
              : const Icon(Icons.person),
        ),
        title: Text(
          details.clinicName,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' ${details.street} ${details.state}',
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
            const Text(
              '10:40 AM - 03:30 PM',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  details.clinicRegistrationId.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: index.isEven
                        ? const Color.fromRGBO(85, 193, 206, 1)
                        : const Color.fromRGBO(226, 147, 131, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Book Appointment'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
