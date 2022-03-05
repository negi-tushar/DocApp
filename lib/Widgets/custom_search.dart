import 'package:docapp/Screens/clinic_details.dart';
import 'package:docapp/models/clinic_details.dart';
import 'package:docapp/provider/clinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class customSearch extends StatelessWidget {
  const customSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clinicData = Provider.of<ClinicData>(context, listen: false);
    return TypeAheadField<ClinicDetails?>(
        minCharsForSuggestions: 4,
        debounceDuration: const Duration(milliseconds: 100),
        textFieldConfiguration: TextFieldConfiguration(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(20)),
              hintStyle: const TextStyle(color: Colors.white54),
              fillColor: const Color.fromARGB(125, 103, 122, 139),
              filled: true,
              hintText: 'Search Clinic',
            )),
        suggestionsCallback: ((pattern) =>
            clinicData.getClinicDetails(pattern)),
        itemBuilder: (context, ClinicDetails? suggestion) {
          final details = suggestion!;
          return ListTile(
            leading: const Icon(Icons.medical_services),
            title: Text(details.clinicName),
            subtitle: Text(details.street),
          );
        },
        onSuggestionSelected: (ClinicDetails? suggestion) {
          final details = suggestion!;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(details.id)));
          Navigator.of(context)
              .pushNamed(ClinicDetailsScreen.id, arguments: details);
        },
        hideOnLoading: true,
        errorBuilder: (context, error) {
          return const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'No Clinic Found',
                  style: TextStyle(color: Colors.black),
                ),
              ));
        });
  }
}
