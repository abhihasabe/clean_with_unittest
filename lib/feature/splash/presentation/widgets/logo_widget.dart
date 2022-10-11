import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Color color;

  const LogoWidget({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/icons/icon.png',
            color: color,
            width: 55,
          ),
        ),
        const SizedBox(height: 19),
        Text(
          'NEWS',
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 19,
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: color,
          ),
        ),
      ],
    );
  }
}
