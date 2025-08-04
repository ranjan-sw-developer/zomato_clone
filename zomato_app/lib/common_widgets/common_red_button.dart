import 'package:flutter/material.dart';

class CommonRedButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool isLoading;
  const CommonRedButton({
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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Background color
          foregroundColor: Colors.white, // Text color
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
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(buttonLabel, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
