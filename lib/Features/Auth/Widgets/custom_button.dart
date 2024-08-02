import 'package:flutter/material.dart';

import '../../../Core/Constants/fonts.dart';
import '../../../Core/Theme/app_colors.dart';

enum ButtonSize { small, medium, large }

class CustomButton extends StatefulWidget {
  final ButtonSize size;
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.size,
    required this.onPressed,
    required this.text,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    double height;
    double width;

    switch (widget.size) {
      case ButtonSize.small:
        height = 30;
        width = 200;
        break;
      case ButtonSize.medium:
        height = 35;
        width = 250;
        break;
      case ButtonSize.large:
        height = 40;
        width = 300;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed,
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          child: Ink(
            decoration: BoxDecoration(
              color: _isPressed
                  ? AppColors.secondary.withOpacity(0.8)
                  : AppColors.secondary,
              borderRadius: BorderRadius.circular(0),
              boxShadow: _isPressed
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontFamily: AppFonts.golden,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
