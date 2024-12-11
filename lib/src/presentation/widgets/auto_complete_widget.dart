// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vehicle_service_app/src/logic/bloc/customer/customer_bloc.dart';

// class AutoCompleteWidget extends StatelessWidget {
//   const AutoCompleteWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final customerBloc = BlocProvider.of<CustomerBloc>(context);

//     return Column(
//       children: [
//         TextField(
//           onChanged: (query) {
//             customerBloc.add(fetchCustomerPhones(query));
//           },
//           decoration: const InputDecoration(
//             labelText: 'Search Phone Number',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         BlocBuilder<CustomerBloc, CustomerState>(
//           builder: (context, state) {
//             if (state is CusatomerLoading) {
//               return const CircularProgressIndicator();
//             } else if (state is CustomerLoaded) {
//               return Autocomplete<String>(
//                 optionsBuilder: (TextEditingValue textEditingValue) {
//                   if (textEditingValue.text.isEmpty) {
//                     return const Iterable<String>.empty();
//                   }
//                   return state.phones.where((phone) => phone
//                       .toLowerCase()
//                       .contains(textEditingValue.text.toLowerCase()));
//                 },
//                 onSelected: (String selection) {
//                   print('Selected phone: $selection');
//                   customerBloc.add(fetchCustomerDetailsByPhone(selection));
//                 },
//                 fieldViewBuilder:
//                     (context, controller, focusNode, onEditingComplete) {
//                   return TextField(
//                     controller: controller,
//                     focusNode: focusNode,
//                     onEditingComplete: onEditingComplete,
//                     decoration: const InputDecoration(
//                       hintText: 'Type to search...',
//                       border: OutlineInputBorder(),
//                     ),
//                   );
//                 },
//               );
//             } else if (state is CustomerError) {
//               return Text('Error: ${state.error}');
//             }
//             return const Text('Start typing to search phone numbers');
//           },
//         ),
//       ],
//     );
//   }
// }
