import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/logic/bloc/customer/customer_bloc.dart';
import 'package:vehicle_service_app/src/presentation/widgets/app_bar_widget.dart';
import 'package:vehicle_service_app/src/presentation/widgets/buttons.dart';
import 'package:vehicle_service_app/src/presentation/widgets/second_title.dart';
import 'package:vehicle_service_app/src/presentation/widgets/text_form_field.dart';
import 'package:vehicle_service_app/src/presentation/widgets/main_title_widget.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}
class _CustomerState extends State<Customer> {
  final TextEditingController Customer_NameController = TextEditingController();
  final TextEditingController Customer_PhoneController =
      TextEditingController();
  final TextEditingController Customer_LandController = TextEditingController();
  final TextEditingController Customer_NicController = TextEditingController();
  final TextEditingController Customer_AddressController =
      TextEditingController();

clear(){
  Customer_AddressController.clear();
  Customer_LandController.clear();
  Customer_NameController.clear();
  Customer_NicController.clear();
  Customer_PhoneController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarName: 'Customer',
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 15, left: 15),
        child: Column(
          children: [
            const Title_Widget(
              title: 'CUSTOMER DETAILS',
            ),
            const Secont_Title(
              second_title: 'Enter Customer Details',
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldComponent(
              lableText: 'Customer Name',
              maxLines: 1,
              controller: Customer_NameController,
              obscureText: false,
              suffixIcon: Icons.abc_outlined,
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'NIC',
              maxLines: 1,
              controller: Customer_NicController,
              obscureText: false,
              suffixIcon: Icons.abc_outlined,
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Phone Number',
              maxLines: 1,
              controller: Customer_PhoneController,
              obscureText: false,
              suffixIcon: Icons.abc_outlined,
              inputType: TextInputType.phone,
          
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Land Number',
              maxLines: 1,
              controller: Customer_LandController,
              obscureText: false,
              suffixIcon: Icons.call,
              inputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Address',
              maxLines: 1,
              controller: Customer_AddressController,
              obscureText: false,
              suffixIcon: Icons.abc_outlined,
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 5,
            ),
            ButtonComponent(
                buttonText: "SAVE",
                textColor: Colors.white,
                buttonColor: AppThemes.PrimaryColor,
                callback: () {
                  context.read<CustomerBloc>().add(AddCustomer(
                        NIC: Customer_NicController.text,
                        Cust_Name: Customer_NameController.text,
                        Phone: Customer_PhoneController.text,
                        Phone_Land: Customer_LandController.text,
                        Email: " ",
                        Address1: Customer_AddressController.text,
                        Address2: " ",
                        Address3: " ",
                        Date_Of_Birth: " ",
                        Gender: " ",
                        Cus_Group_Name: " ",
                        Remark: " ",
                        Credit_Card_Type: " ",
                        Card_Number: " ",
                        Expiration_date: " ",
                        Credit_Card_Bank: " ",
                        Internal_Notes: " ",
                        Auto_Email_Invoice: 0,
                        Premium_Membership: 0,
                        Loyalty_Enabled: 0,
                        Loyalty_Point: 0.0,
                        Available_Loyalty_Credit: 0.0,
                        Earned_Loyalty: 0.0,
                        Redeemed_Loyalty: 0.0,
                        Store_Credit_Enabled: 0,
                        Store_Credit_Amount: 0.0,
                        Account_Balance: 0.0,
                        Last_Visit: " ",
                        Total_Orders: 0,
                        Total_Spent: 0.0,
                        Account_Limit: 0.0,
                        Ref_Emp_ID: " ",
                        Ref_Emp_Name: " ",
                        Cust_VehicleNo: " ",
                      ));
                clear();
                }),               
          ],
        ),
      )),
    );
  }
}
