import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade100,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: MemoryImage(base64Decode(data.first.image)),
                  radius: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(data.first.fname + ' ' + data.first.lname),
                Text(data.first.email),
              ],
            ),
          ),
          ListTile(
            leading: Text('hello'),
            onTap: () {},
          ),
          ListTile(
            leading: Text('hello'),
            onTap: () {},
          ),
          ListTile(
            leading: Text('hello'),
            onTap: () {},
          ),
          ListTile(
            leading: Text('hello'),
            onTap: () {},
          ),
          ListTile(
            leading: Text('hello'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
