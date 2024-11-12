import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  late String selectedItem = 'Normal Service';

  final List<String> dropDownItems = [
    'Normal Service',
    'Full Service',
    'Body Wash'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: selectedItem,
        items: dropDownItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedItem = value!;
          });
        },
      ),
    );
  }
}
