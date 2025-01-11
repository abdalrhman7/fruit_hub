import 'package:flutter/material.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:provider/provider.dart';

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
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }else{
                showBar(context, 'يجب عليك تحديد طريقة الدفع');
              }
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
