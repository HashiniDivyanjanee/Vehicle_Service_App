part of 'customer_bloc.dart';

abstract class CustomerEvent {}

class AddCustomer extends CustomerEvent {
  final String NIC;
  final String Cust_Name;
  final String Phone;
  final String Phone_Land;
  final String Email;
  final String Address1;
  final String Address2;
  final String Address3;
  final String Date_Of_Birth;
  final String Gender;
  final String Cus_Group_Name;
  final String Remark;
  final String Credit_Card_Type;
  final String Card_Number;
  final String Expiration_date;
  final String Credit_Card_Bank;
  final String Internal_Notes;
  final int Auto_Email_Invoice;
  final int Premium_Membership;
  final int Loyalty_Enabled;
  final double Loyalty_Point;
  final double Available_Loyalty_Credit;
  final double Earned_Loyalty;
  final double Redeemed_Loyalty;
  final int Store_Credit_Enabled;
  final double Store_Credit_Amount;
  final double Account_Balance;
  final String Last_Visit;
  final int Total_Orders;
  final double Total_Spent;
  final double Account_Limit;
  final String Ref_Emp_ID;
  final String Ref_Emp_Name;
  final String Cust_VehicleNo;
  AddCustomer({
    required this.NIC,
    required this.Cust_Name,
    required this.Phone,
    required this.Phone_Land,
    required this.Email,
    required this.Address1,
    required this.Address2,
    required this.Address3,
    required this.Date_Of_Birth,
    required this.Gender,
    required this.Cus_Group_Name,
    required this.Remark,
    required this.Credit_Card_Type,
    required this.Card_Number,
    required this.Expiration_date,
    required this.Credit_Card_Bank,
    required this.Internal_Notes,
    required this.Auto_Email_Invoice,
    required this.Premium_Membership,
    required this.Loyalty_Enabled,
    required this.Loyalty_Point,
    required this.Available_Loyalty_Credit,
    required this.Earned_Loyalty,
    required this.Redeemed_Loyalty,
    required this.Store_Credit_Enabled,
    required this.Store_Credit_Amount,
    required this.Account_Balance,
    required this.Last_Visit,
    required this.Total_Orders,
    required this.Total_Spent,
    required this.Account_Limit,
    required this.Ref_Emp_ID,
    required this.Ref_Emp_Name,
    required this.Cust_VehicleNo,
  });
  @override
  List<Object?> get props => [
        NIC,
        Cust_Name,
        Phone,
        Phone_Land,
        Email,
        Address1,
        Address2,
        Address3,
        Date_Of_Birth,
        Gender,
        Cus_Group_Name,
        Remark,
        Credit_Card_Type,
        Card_Number,
        Expiration_date,
        Credit_Card_Bank,
        Internal_Notes,
        Auto_Email_Invoice,
        Premium_Membership,
        Loyalty_Enabled,
        Loyalty_Point,
        Available_Loyalty_Credit,
        Earned_Loyalty,
        Redeemed_Loyalty,
        Store_Credit_Enabled,
        Store_Credit_Amount,
        Account_Balance,
        Last_Visit,
        Total_Orders,
        Total_Spent,
        Account_Limit,
        Ref_Emp_ID,
        Ref_Emp_Name,
        Cust_VehicleNo
      ];
}


class fetchCustomerPhones extends CustomerEvent{
  final String query;

  fetchCustomerPhones(this.query);
}
class fetchCustomerDetailsByPhone extends CustomerEvent {
  final String phone;

  fetchCustomerDetailsByPhone(this.phone);
}