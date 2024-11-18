abstract class JobCardState {}

class JobCardInitial extends JobCardState {}

class JobCardLoading extends JobCardState {}

class JobCardSaved extends JobCardState {}

class JobCardError extends JobCardState {
  final String message;
  JobCardError(this.message);
}
