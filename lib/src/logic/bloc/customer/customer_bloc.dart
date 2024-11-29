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
        await apiProvider.saveCustomer(event.NIC, event.Cust_Name, event.Phone,
            event.Phone_Land, event.Address1);
        emit(CustomerAdded());
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });
  }
}
