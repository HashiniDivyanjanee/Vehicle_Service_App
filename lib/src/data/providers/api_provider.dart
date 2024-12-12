import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vehicle_service_app/src/data/model/job_card.dart';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.13:5000/api'));

// -- POST API --
  Future<void> saveJobCard(
      String Job_Number,
      String Cust_ID,
      String Vehicle_Type,
      String Brand,
      String Model,
      String License_Plate,
      String Mileage,
      String Job_Type,
      String Date,
      String Time,
      String Assigned_emp_Id,
      String Current_Status,
      String Current_Location,
      String job_barcode,
      String Job_Name1,
      String Job_Name2,
      String CreateDate,
      String CreateTime,
      String Invoice_ID,
      String Scheduled_Date,
      String Scheduled_Time,
      String Customer_Note,
      String Office_Note,
      String Additional_Remark,
      String Additional_RefNo,
      String Created_Emp_ID,
      String AddKm,
      String NewMileage,
      String InsuranceClaim,
      String Year,
      String Color,
      String Sub_Total,
      String Extra_Tax,
      String Extra_Tax_Percentage,
      String Extra_Discount,
      String Extra_Disc_Percentage,
      String Advanced_Amount,
      String Advanced_Method,
      String Net_Total,
      String Net_Total_Without_Advanced,
      String Paid_Amount,
      String Due_Amount,
      String Change_Amount,
      String Payment_Methods,
      String Payment_Status,
      String Cust_Name,
      String Cust_Phone,
      String FuelLevel,
      String EstimateAmount,
      String ShortName,
      String Display_Status,
      String Job_Priority,
      String Job_Category_Type,
      String Cust_VehicleNo) async {
    try {
      final response = await dio.post('/jobcard', data: {
        'Job_Number': Job_Number,
        'Cust_ID': Cust_ID,
        'Vehicle_Type': Vehicle_Type,
        'Brand': Brand,
        'Model': Model,
        'License_Plate': License_Plate,
        'Mileage': Mileage,
        'Job_Type': Job_Type,
        'Date': Date,
        'Time': Time,
        'Assigned_emp_Id': Assigned_emp_Id,
        'Current_Status': Current_Status,
        'Current_Location': Current_Location,
        'job_barcode': job_barcode,
        'Job_Name1': Job_Name1,
        'Job_Name2': Job_Name2,
        'CreateDate': CreateDate,
        'CreateTime': CreateTime,
        'Invoice_ID': Invoice_ID,
        'Scheduled_Date': Scheduled_Date,
        'Scheduled_Time': Scheduled_Time,
        'Customer_Note': Customer_Note,
        'Office_Note': Office_Note,
        'Additional_Remark': Additional_Remark,
        'Additional_RefNo': Additional_RefNo,
        'Created_Emp_ID': Created_Emp_ID,
        'AddKm': AddKm,
        'NewMileage': NewMileage,
        'InsuranceClaim': InsuranceClaim,
        'Year': Year,
        'Color': Color,
        'Sub_Total': Sub_Total,
        'Extra_Tax': Extra_Tax,
        'Extra_Tax_Percentage': Extra_Tax_Percentage,
        'Extra_Discount': Extra_Discount,
        'Extra_Disc_Percentage': Extra_Disc_Percentage,
        'Advanced_Amount': Advanced_Amount,
        'Advanced_Method': Advanced_Method,
        'Net_Total': Net_Total,
        'Net_Total_Without_Advanced': Net_Total_Without_Advanced,
        'Paid_Amount': Paid_Amount,
        'Due_Amount': Due_Amount,
        'Change_Amount': Change_Amount,
        'Payment_Methods': Payment_Methods,
        'Payment_Status': Payment_Status,
        'Cust_Name': Cust_Name,
        'Cust_Phone': Cust_Phone,
        'FuelLevel': FuelLevel,
        'EstimateAmount': EstimateAmount,
        'ShortName': ShortName,
        'Display_Status': Display_Status,
        'Job_Priority': Job_Priority,
        'Job_Category_Type': Job_Category_Type,
        'Cust_VehicleNo': Cust_VehicleNo
      });
      print('Response from Server: ${response.data}');
    } catch (e, stackTrace) {
      print('Error Saving JobCard: $e');
      print(stackTrace);
      rethrow;
    }
  }

  Future<void> saveCustomer(
    String NIC,
    String Cust_Name,
    String Phone,
    String Phone_Land,
    String Email,
    String Address1,
    String Address2,
    String Address3,
    String Date_Of_Birth,
    String Gender,
    String Cus_Group_Name,
    String Remark,
    String Credit_Card_Type,
    String Card_Number,
    String Expiration_date,
    String Credit_Card_Bank,
    String Internal_Notes,
    int Auto_Email_Invoice,
    int Premium_Membership,
    int Loyalty_Enabled,
    double Loyalty_Point,
    double Available_Loyalty_Credit,
    double Earned_Loyalty,
    double Redeemed_Loyalty,
    int Store_Credit_Enabled,
    double Store_Credit_Amount,
    double Account_Balance,
    String Last_Visit,
    int Total_Orders,
    double Total_Spent,
    double Account_Limit,
    String Ref_Emp_ID,
    String Ref_Emp_Name,
    String Cust_VehicleNo,
  ) async {
    try {
      final response = await dio.post('/customer', data: {
        'NIC': NIC,
        'Cust_Name': Cust_Name,
        'Phone': Phone,
        'Phone_Land': Phone_Land,
        'Email': Email,
        'Address1': Address1,
        'Address2': Address2,
        'Address3': Address3,
        'Date_Of_Birth': Date_Of_Birth,
        'Gender': Gender,
        'Cus_Group_Name': Cus_Group_Name,
        'Remark': Remark,
        'Credit_Card_Type': Credit_Card_Type,
        'Card_Number': Card_Number,
        'Expiration_date': Expiration_date,
        'Credit_Card_Bank': Credit_Card_Bank,
        'Internal_Notes': Internal_Notes,
        'Auto_Email_Invoice': Auto_Email_Invoice,
        'Premium_Membership': Premium_Membership,
        'Loyalty_Enabled': Loyalty_Enabled,
        'Loyalty_Point': Loyalty_Point,
        'Available_Loyalty_Credit': Available_Loyalty_Credit,
        'Earned_Loyalty': Earned_Loyalty,
        'Redeemed_Loyalty': Redeemed_Loyalty,
        'Store_Credit_Enabled': Store_Credit_Enabled,
        'Store_Credit_Amount': Store_Credit_Amount,
        'Account_Balance': Account_Balance,
        'Last_Visit': Last_Visit,
        'Total_Orders': Total_Orders,
        'Total_Spent': Total_Spent,
        'Account_Limit': Account_Limit,
        'Ref_Emp_ID': Ref_Emp_ID,
        'Ref_Emp_Name': Ref_Emp_Name,
        'Cust_VehicleNo': Cust_VehicleNo
      });
      print('Response from Server:${response.data}');
    } catch (e, stackTrace) {
      print('Error Saving JobCard: $e');
      print(stackTrace);
      rethrow;
    }
  }

// -- GET API --
  Future<List<dynamic>> fetchPrimaryKeySetting() async {
    try {
      final response = await dio.get('/primarykeysetting');
      return response.data['data'] as List<dynamic>;
    } catch (e, stackTrace) {
      print('Error fetching primary key settings: $e');
      print(stackTrace);
      rethrow;
    }
  }

 Future<Map<String, dynamic>> fetchCustomerByPhone(String phone) async {
    try {
      final response = await dio.get('/customer', queryParameters: {'phone': phone});
      if (response.statusCode == 200) {     
        final List<dynamic> customerData = response.data['data'];
        if (customerData.isNotEmpty) {
          return customerData.first as Map<String, dynamic>;
        } else {
          throw Exception('Customer not found');
        }
      } else {
        throw Exception('Customer not found');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        throw Exception('Customer not found');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to fetch customer: ${e.toString()}');
    }
  }

  // ** JOB CARD FETCH ** 
Future<List<JobCardModel>> fetchJobCardDetails() async {
  final response = await dio.get('/jobcard');
  if (response.statusCode == 200) {
    final jsonResponse = response.data;
    if (jsonResponse is Map && jsonResponse['data'] is List) {
      final data = jsonResponse['data'] as List;
      return data.map((json) => JobCardModel.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Unexpected response format');
    }
  } else {
    throw Exception('Failed to fetch data: ${response.statusCode}');
  }
}


// -- PUT API --
  Future<void> updatePrimaryKeySetting(int latestID) async {
    try {
      await dio.put(
        '/primarykeysetting',
        data: {'LatestID': latestID},
      );
    } catch (e, stackTrace) {
      print('Error fetching primary key settings: $e');
      print(stackTrace);
      rethrow;
    }
  }
}
