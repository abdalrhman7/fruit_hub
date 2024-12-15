import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/cubits/products_cubit.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/best_selling_fruits/views/best_selling_view.dart';
import 'package:svg_flutter/svg.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          buildWhen: (previous, current) {
            return current is ProductsSuccess;
          },
          builder: (context, state) {
            return Text(
              '${context.read<ProductsCubit>().productsLength} نتائج ',
              textAlign: TextAlign.right,
              style: TextStyles.bold16,
            );
          },
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
           // color: Colors.white.withOpacity(0.1000000149011612),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0x66CACECE), width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imageFilter1),
        )
      ],
    );
  }
}
