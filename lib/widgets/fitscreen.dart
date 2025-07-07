import 'package:flutter/widgets.dart';

class FitScreen extends StatelessWidget {
  final Widget child;

  const FitScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(width: size.width, height: size.height, child: child);
  }
}
