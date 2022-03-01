class PatientDetails {
  PatientDetails({
    required this.id,
    required this.clinicName,
    required this.clinicRegistrationId,
    required this.phoneNo,
    required this.street,
    required this.city,
    required this.state,
  });

  late String id,
      clinicName,
      clinicRegistrationId,
      phoneNo,
      street,
      city,
      state;
}



// "id": 1,
// "clinicName": "kailash hospital",
// "clinicRegistrationId": "123456",
// "phoneNo": "+916398565353",
// "street": "Nakronda ,Dehradun",
// "city": "Nakronda ,Dehradun",
// "state": "Uttarakhand"