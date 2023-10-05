import 'package:flutter/material.dart';
import 'package:voco/feature/constants/other/colors.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, required this.title, required this.onPressed});

  final String title;
  final Function onPressed;

  final double _buttonWidth = 180;
  final double _buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: SizedBox(
          height: _buttonHeight,
          width: _buttonWidth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: APPColors.Main.blue,
                foregroundColor: APPColors.Main.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                textStyle: const TextStyle(fontSize: 16, fontFamily: 'Roboto', letterSpacing: 1)),
            onPressed: () {
              onPressed(context);
            },
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
