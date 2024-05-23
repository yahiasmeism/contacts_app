
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hint,
    this.type = TextInputType.text,
    required this.onSaved,
  });
  final String hint;
  final TextInputType type;
  final Function(String? newValue)? onSaved;




  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved: onSaved,
      keyboardType: type,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field must not be empty';
        }
        return null;
      },
      decoration: InputDecoration(

        contentPadding: const EdgeInsets.all(20),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
