import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    this.width = 20,
    this.height = 20,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const CircularProgressIndicator(),
    );
  }
}
