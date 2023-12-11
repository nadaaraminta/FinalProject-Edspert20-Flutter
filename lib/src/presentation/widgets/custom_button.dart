import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.iconPath,
    required this.buttonColor,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });

  final String buttonTitle;
  final String iconPath;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 45,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: SizedBox(
          width: 190,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath),
              const SizedBox(
                width: 8,
              ),
              Text(
                buttonTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}