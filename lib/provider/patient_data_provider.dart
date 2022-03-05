import 'dart:convert';

import 'package:docapp/global.dart';
import 'package:docapp/models/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientsData implements ChangeNotifier {
  late List<PatientDetails> _details = [];
  List<PatientDetails> get allDetails {
    return [..._details];
  }

  Future<List<PatientDetails>> getpatientsData() async {
    try {
      // print('started');
      var req = await http.get(Uri.parse('http://$IpAdress:8000/patients'));
      //   print('Status Code${req.body}');
      var fetchedData = (await json.decode(req.body) as List)
          .map((e) => e as Map<String, dynamic>);
      List<PatientDetails> d = [];
      for (var i in fetchedData) {
        d.add(
          PatientDetails(
            id: i['id'].toString(),
            fname: i['fname'],
            lname: i['lname'],
            email: i['email'],
            dob: DateTime.now(),
            phoneNo: i['phoneNo'],
            password: i['password'],
            image: i['image'],
          ),
        );
      }
      _details = d;

      _details = d;
      print('details ---->${_details.last.email}');
    } catch (e) {
      debugPrint('error---->${e.toString()}');
    }
    return _details;
  }

  Future<List<PatientDetails>> getDetailsbyId(String id) async {
    print(id);
    var req = await http.get(Uri.parse('http://$IpAdress:8000/patient/$id'));

    var j = json.decode(req.body) as Map<String, dynamic>;
    List<PatientDetails> d = [];
    d.add(
      PatientDetails(
        id: 'key.toString()',
        fname: j['fname'],
        lname: j['lname'],
        email: j['email'],
        dob: DateTime.now(),
        phoneNo: j['phoneNo'],
        password: j['password'],
        image: j['image'],
      ),
    );
    print('email mapppppppppp->>>${d.first.email}');
    return d;
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
