import 'package:flutter/material.dart';

class CommonRedOutlineButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool isLoading;
  const CommonRedOutlineButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.red.shade50, // Background color
          foregroundColor: Colors.red, // Text color
          side: const BorderSide(color: Colors.red, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Border radius
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: isLoading
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 2,
                ),
              )
            : Text(
                buttonLabel,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
      ),
    );
  }
}
