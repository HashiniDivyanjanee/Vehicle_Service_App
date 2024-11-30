part of 'customer_bloc.dart';

abstract class CustomerEvent {}

class AddCustomer extends CustomerEvent {
  final String NIC;
  final String Cust_Name;
  final String Phone;
  final String Phone_Land;
  final String Address1;

  AddCustomer(
      {required this.NIC,
      required this.Cust_Name,
      required this.Phone,
      required this.Phone_Land,
      required this.Address1});
  @override
  List<Object?> get props => [NIC, Cust_Name, Phone, Phone_Land, Address1];
}
