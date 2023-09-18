import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final double h;
  final double w;
  final TextEditingController controller;
  final String label;
  final IconData icon;
  const AuthTextField({
    super.key,
    required this.h,
    required this.w,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      padding: EdgeInsets.symmetric(
        horizontal: w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: label,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
