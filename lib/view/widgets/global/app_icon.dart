import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double height;
  const AppIcon({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Icon(
        Icons.check_rounded,
        size: height * 0.8,
      ),
    );
  }
}
