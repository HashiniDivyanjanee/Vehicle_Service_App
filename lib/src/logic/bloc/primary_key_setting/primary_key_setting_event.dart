import 'package:equatable/equatable.dart';

abstract class PrimaryKeySettingEvent extends Equatable {
  List<Object> get props => [];
}

class fetchPrimaryKeySetting extends PrimaryKeySettingEvent {}

class UpdatePrimaryKeySetting extends PrimaryKeySettingEvent {
  final int latestID;

  UpdatePrimaryKeySetting(this.latestID);

  List<Object> get props => [latestID];
}
