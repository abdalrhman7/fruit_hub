import 'package:flutter/material.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/step_item.dart';
import 'inactive_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex, required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps().length,
        (index) {
          return Expanded(
              child: GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: StepItem(
              isActive: index <= currentPageIndex,
              text: getSteps()[index],
              index: '${index + 1}',
            ),
          ));
        },
      ),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
