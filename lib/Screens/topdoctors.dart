import 'package:docapp/Widgets/custom_list_tile.dart';
import 'package:docapp/models/clinic_details.dart';
import 'package:docapp/models/doctors_details.dart';
import 'package:docapp/models/patient_details.dart';
import 'package:docapp/provider/clinic_provider.dart';
import 'package:docapp/provider/doctors_data_provider.dart';
import 'package:docapp/provider/patient_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopDoctors extends StatelessWidget {
  const TopDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ClinicData>(context, listen: false)
            .getAllClinicDetails(),
        builder: (context, AsyncSnapshot<List<ClinicDetails>> snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snap.data!.length,
              itemBuilder: ((context, index) {
                var data = snap.data![index];
                print(data.street);
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(86, 101, 115, 130),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomListTile(
                    details: data,
                    index: index,
                    location: 'Dehradun, India',
                  ),
                );
              }),
            );
          }
        });
  }
}
