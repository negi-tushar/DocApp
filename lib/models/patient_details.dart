class PatientDetails {
  late String id;
  late String fname;
  late String lname;
  late String email;
  late String password;
  late DateTime dob;
  late String phoneNo;
  late String image;

  PatientDetails({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.dob,
    required this.phoneNo,
    required this.password,
    required this.image,
  });
}
