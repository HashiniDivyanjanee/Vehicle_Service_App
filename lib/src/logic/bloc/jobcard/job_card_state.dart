import 'package:vehicle_service_app/src/data/model/job_card.dart';
import 'package:equatable/equatable.dart';
abstract class JobCardState extends Equatable {
   @override
  List<Object> get props => [];
}

class JobCardInitial extends JobCardState {}

class JobCardLoading extends JobCardState {}

class JobCardLoaded extends JobCardState{
  final List<JobCardModel> data;
  JobCardLoaded(this.data);
   @override
  List<Object> get props => [data];
}

class JobCardSaved extends JobCardState {}

class JobCardError extends JobCardState {
  final String message;
  JobCardError(this.message);
}
