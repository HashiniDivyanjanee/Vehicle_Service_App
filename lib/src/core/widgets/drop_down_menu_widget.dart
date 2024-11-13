import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';

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
      margin: EdgeInsets.only(bottom: 15, left: 25, right: 25),
      decoration: BoxDecoration(
          color: AppThemes.TextField_Bg_Color,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 85,
        ),
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
      ),
    );
  }
}
