import 'package:equatable/equatable.dart';

abstract class PrimaryKeySettingEvent extends Equatable {
  List<Object> get props => [];
}

class fetchPrimaryKeySetting extends PrimaryKeySettingEvent {}
