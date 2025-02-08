import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Widget leading;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.leading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        color: buttonColor,
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            const SizedBox(width: 2),
            leading,
            Spacer(),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
