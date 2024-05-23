import 'package:contact_app/widgets/add_contact_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
          context: context,
          builder: (context) {
            return const AddContactBottomSheet();
          },
        );
      },
    );
  }
}
