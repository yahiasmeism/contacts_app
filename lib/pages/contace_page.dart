import 'package:contact_app/widgets/add_contact_button.dart';
import 'package:contact_app/widgets/contact_list_view.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddContactButton(),
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: const Column(
        children: [
          Expanded(child: ContactListView()),
          // InputFromContact(),
        ],
      ),
    );
  }
}
