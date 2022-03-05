import 'dart:convert';

import 'package:docapp/global.dart';
import 'package:docapp/models/doctors_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorsData implements ChangeNotifier {
  late List<DoctorDetails> _docDetails = [];
  List<DoctorDetails> get docDetails {
    return [..._docDetails];
  }

  Future<List<DoctorDetails>> getDoctorsData() async {
    try {
      // print('started');
      var req = await http.get(Uri.parse('http://$IpAdress:8001/doctors'));
      //   print('Status Code${req.body}');
      var fetchedData = (await json.decode(req.body) as List)
          .map((e) => e as Map<String, dynamic>);
      List<DoctorDetails> d = [];
      for (var i in fetchedData) {
        d.add(DoctorDetails(
          doc_id: i['doc_id'].toString(),
          doc_name: i['doc_name'],
          doc_registration_id: i['doc_registration_id'],
          doc_specialization: i['doc_specialization'],
          doc_fees: i['doc_fees'],
        ));
      }
      _docDetails = d;

      print('details ---->${_docDetails.last}');
    } catch (e) {
      debugPrint('error---->${e.toString()}');
    }
    return _docDetails;
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
