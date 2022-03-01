import 'package:flutter/material.dart';

// ignore: camel_case_types
class customSearch extends StatelessWidget {
  const customSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 0,
              borderRadius: BorderRadius.circular(20)),
          // icon: Icon((Icons.search)),
          hintText: 'Search Doctor',
          hintStyle: const TextStyle(color: Colors.white54),
          fillColor: const Color.fromRGBO(86, 101, 115, 130),
          filled: true),
    );
  }
}
