import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final ApiProvider apiProvider;

  CustomerBloc(this.apiProvider) : super(CustomerInitial()) {
    on<AddCustomer>((event, emit) async {
      emit(CusatomerLoading());
      try {
        await apiProvider.saveCustomer(
          event.NIC,
          event.Cust_Name,
          event.Phone,
          event.Phone_Land,
          event.Email,
          event.Address1,
          event.Address2,
          event.Address3,
          event.Date_Of_Birth,
          event.Gender,
          event.Cus_Group_Name,
          event.Remark,
          event.Credit_Card_Type,
          event.Card_Number,
          event.Expiration_date,
          event.Credit_Card_Bank,
          event.Internal_Notes,
          event.Auto_Email_Invoice,
          event.Premium_Membership,
          event.Loyalty_Enabled,
          event.Loyalty_Point,
          event.Available_Loyalty_Credit,
          event.Earned_Loyalty,
          event.Redeemed_Loyalty,
          event.Store_Credit_Enabled,
          event.Store_Credit_Amount,
          event.Account_Balance,
          event.Last_Visit,
          event.Total_Orders,
          event.Total_Spent,
          event.Account_Limit,
          event.Ref_Emp_ID,
          event.Ref_Emp_Name,
          event.Cust_VehicleNo,
        );
        emit(CustomerAdded());
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });
    on<fetchCustomerByPhone>((event, emit) async {
      emit(CusatomerLoading());
      try {
        var customer = await apiProvider.getCustomerByPhone(event.phoneNumber);
        if (customer!=null) {
          // emit(CustomerLoaded(customerName: customer.name));

        } else {
          emit(CustomerError('Customer Not Found'));
        }
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });
  }
}
