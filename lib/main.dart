import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/contace_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_providor;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get document directory from system device
  Directory dir = await path_providor.getApplicationDocumentsDirectory();

  // initialize hive in the directory path
  Hive.init(dir.path);

  // rigester Contact adapter from Hive database
  Hive.registerAdapter(ContactAdapter());
  runApp(const ContactApp());
}

class ContactApp extends StatefulWidget {
  const ContactApp({super.key});

  @override
  State<ContactApp> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: FutureBuilder(
        future: Hive.openBox<Contact>('contacts'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const ContactPage();
            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('contacts').compact();
    Hive.close();
    super.dispose();
  }
}
