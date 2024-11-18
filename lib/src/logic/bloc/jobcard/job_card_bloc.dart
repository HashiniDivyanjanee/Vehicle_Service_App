import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCardBloc extends Bloc<JobCardEvent,JobCardState>{
  final ApiProvider apiProvider;

  JobCardBloc(this.apiProvider):super(JobCardInitial()){
    on<saveJobCard>((event,emit)async{
      emit(JobCardLoading());
      try{
        await apiProvider.saveJobCard(event.claim, event.chassis, event.note);
        emit(JobCardSaved());
      }catch(e){
        emit(JobCardError(e.toString()));
      }
    });
  }
}