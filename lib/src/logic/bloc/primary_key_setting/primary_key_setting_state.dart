import 'package:equatable/equatable.dart';

abstract class PrimaryKeySettingState extends Equatable {
  @override
  List<Object> get props => [];
}

class PrimaryKeySettingInitial extends PrimaryKeySettingState {}

class PrimaryKeySettingLoading extends PrimaryKeySettingState {}

class PrimaryKeySettingLoaded extends PrimaryKeySettingState {
  final List<dynamic> primarykeysetting;
  PrimaryKeySettingLoaded(this.primarykeysetting);

  @override
  List<Object> get props => [primarykeysetting];
}

class PrimaryKeySettingError extends PrimaryKeySettingState {
  final String message;
  PrimaryKeySettingError(this.message);

  List<Object> get props => [message];
}
