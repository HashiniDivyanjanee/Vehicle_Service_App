import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCardBloc extends Bloc<JobCardEvent, JobCardState> {
  final ApiProvider apiProvider;

  JobCardBloc(this.apiProvider) : super(JobCardInitial()) {
    on<saveJobCard>((event, emit) async {
      emit(JobCardLoading());
      try {
        await apiProvider.saveJobCard(
            event.Job_Number,
            event.Cust_ID,
            event.Vehicle_Type,
            event.Brand,
            event.Model,
            event.License_Plate,
            event.Mileage,
            event.Job_Type,
            event.Date,
            event.Time,
            event.Assigned_emp_Id,
            event.Current_Status,
            event.Current_Location,
            event.job_barcode,
            event.Job_Name1,
            event.Job_Name2,
            event.CreateDate,
            event.CreateTime,
            event.Invoice_ID,
            event.Scheduled_Date,
            event.Scheduled_Time,
            event.Customer_Note,
            event.Office_Note,
            event.Additional_Remark,
            event.Additional_RefNo,
            event.Created_Emp_ID,
            event.AddKm,
            event.NewMileage,
            event.InsuranceClaim,
            event.Year,
            event.Color,
            event.Sub_Total,
            event.Extra_Tax,
            event.Extra_Tax_Percentage,
            event.Extra_Discount,
            event.Extra_Disc_Percentage,
            event.Advanced_Amount,
            event.Advanced_Method,
            event.Net_Total,
            event.Net_Total_Without_Advanced,
            event.Paid_Amount,
            event.Due_Amount,
            event.Change_Amount,
            event.Payment_Methods,
            event.Payment_Status,
            event.Cust_Name,
            event.Cust_Phone,
            event.FuelLevel,
            event.EstimateAmount,
            event.ShortName,
            event.Display_Status,
            event.Job_Priority,
            event.Job_Category_Type,
            event.Cust_VehicleNo
);
        emit(JobCardSaved());
      } catch (e) {
        emit(JobCardError(e.toString()));
      }
    });
  }
}
