import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const AppLogo({super.key,this.width ,this.height});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      'assets/bloc.png',
      height: height ?? 200,
      width: width ?? 200,
      fit: BoxFit.contain,
    );
  }
}
