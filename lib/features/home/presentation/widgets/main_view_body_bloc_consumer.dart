// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class MainViewBodyBlocConsumer extends StatelessWidget {
//   const MainViewBodyBlocConsumer({
//     super.key,
//     required this.currentViewIndex,
//   });
//
//   final int currentViewIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CartCubit, CartState>(
//       listener: (context, state) {
//         if (state is CartItemAdded) {
//           showErrorBar(context, 'تمت العملية بنجاح');
//         }
//         if (state is CartItemRemoved) {
//           showErrorBar(context, 'تم حذف العنصر بنجاح');
//         }
//       },
//       child: MainViewBody(currentViewIndex: currentViewIndex),
//     );
//   }
// }
