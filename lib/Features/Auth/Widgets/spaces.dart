import 'package:flutter/cupertino.dart';

class Spaces extends StatelessWidget {
  final double size;

  const Spaces._(this.size, {super.key});

  // Define factory constructors for different space sizes
  factory Spaces.small({Key? key}) => Spaces._(10.0, key: key);

  factory Spaces.medium({Key? key}) => Spaces._(25.0, key: key);

  factory Spaces.large({Key? key}) => Spaces._(40.0, key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
