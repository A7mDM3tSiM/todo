import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final double h;
  final double w;
  final String label;
  final VoidCallback? onTap;
  const BigButton({
    super.key,
    required this.h,
    required this.w,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onTap;
      },
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: h * 0.027,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
