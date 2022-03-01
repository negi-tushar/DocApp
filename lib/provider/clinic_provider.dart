import 'package:flutter/material.dart';

class ClinicData implements ChangeNotifier {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  late List<ClinicData> _clinicdetails = [];
  List<ClinicData> get clinicdetails {
    return [..._clinicdetails];
  }
}
