import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/custom_scaffold.dart';

class PaymentOptions extends ConsumerStatefulWidget {
  const PaymentOptions({super.key});

  @override
  ConsumerState<PaymentOptions> createState() => PaymentOptionsState();
}

class PaymentOptionsState extends ConsumerState<PaymentOptions> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: 'Payment Options',
      isScrollable: false,
      body: Column(children: []),
    );
  }
}
