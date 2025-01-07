import 'package:flutter/material.dart';

import 'active_step_item.dart';
import 'inactive_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps().length,
        (index) => Expanded(child: InactiveStepItem(text: getSteps()[index] ,index: '${index+1}',)),
      ),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
  }
}
