import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Icon(
        icon,
        size: 32.0,
      ),
    );
  }
}
