import 'package:flutter/material.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({super.key, required this.onClickedButton});
  final Function(bool isConfirmed) onClickedButton;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              color: Colors.red,
              size: 50,
              Icons.warning_amber_rounded,
            ),
            const SizedBox(height: 16),
            const Text(
              'Are you sure to delete?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onClickedButton(false);
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ElevatedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      onClickedButton(true);
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
