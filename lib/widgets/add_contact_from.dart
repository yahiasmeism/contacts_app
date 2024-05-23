import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddContactForm extends StatelessWidget {
  const AddContactForm({
    super.key,
  });
  void addContact(Contact contact) {
    final contactBox = Hive.box<Contact>('contacts');
    contactBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? name;
    String? number;
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFromField(
              onSaved: (newValue) {
                name = newValue;
              },
              hint: 'Name',
            ),
            const SizedBox(
              height: 22,
            ),
            CustomTextFromField(
              onSaved: (newValue) {
                number = newValue;
              },
              hint: 'Phone',
              type: TextInputType.phone,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Contact contact = Contact(name: name!, phone: number!);
                  addContact(contact);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
