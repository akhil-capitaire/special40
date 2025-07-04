import 'package:flutter/widgets.dart';

class FitScreen extends StatelessWidget {
  final Widget child;

  const FitScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(width: size.width, height: size.height, child: child);
  }
}
