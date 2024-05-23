import 'package:contact_app/widgets/add_contact_from.dart';
import 'package:flutter/material.dart';

class AddContactBottomSheet extends StatelessWidget {
  const AddContactBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const AddContactForm(),
    );
  }
}
