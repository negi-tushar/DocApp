import 'dart:convert';

import 'package:docapp/global.dart';
import 'package:docapp/models/clinic_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClinicData implements ChangeNotifier {
  late List<ClinicDetails> _clinicdetails = [];
  List<ClinicDetails> get clinicdetails {
    return [..._clinicdetails];
  }

  Future<List<ClinicDetails>> getClinicDetails(String query) async {
    print('started $query');
    var req = await http.get(Uri.parse('http://$IpAdress:8001/clinics'));
    final List data = json.decode(req.body);
    // print(data);
    //  if (req.statusCode == 200) {
    List<ClinicDetails> d = [];
    data.forEach((element) {
      d.add(ClinicDetails(
        id: element['id'].toString(),
        clinicName: element['clinicName'],
        clinicRegistrationId: element['clinicRegistrationId'],
        phoneNo: element['phoneNo'],
        street: element['street'],
        city: element['city'],
        state: element['state'],
      ));
    });
    _clinicdetails = d;
    d = d
        .where((element) =>
            element.clinicName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(d.first.clinicName);

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
