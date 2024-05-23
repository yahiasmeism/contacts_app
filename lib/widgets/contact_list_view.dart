import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/widgets/confirm_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Contact>('contacts').listenable(),
      builder: (context, contactBox, child) {
        if (contactBox.isNotEmpty) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: contactBox.length,
            itemBuilder: (context, index) {
              final currentContact = contactBox.getAt(index);
              return ListTile(
                leading: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    )),
                title: Text(currentContact!.name),
                subtitle: Text(currentContact.phone.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await contactBox.putAt(
                          index,
                          Contact(
                              name: '${currentContact.name}*',
                              phone: currentContact.phone),
                        );
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmDeleteDialog(
                                onClickedButton: (isConfirmed) {
                                  if (isConfirmed) {
                                    contactBox.deleteAt(index);
                                  }
                                },
                              );
                            });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'No Contacts',
              style: TextStyle(fontSize: 22),
            ),
          );
        }
      },
    );
  }
}
