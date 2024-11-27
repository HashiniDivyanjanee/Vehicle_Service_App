import 'package:intl/intl.dart';

  DateTime now = DateTime.now();

  String Current_Time = DateFormat('HH:mm:ss').format(now);
  String Current_Date = DateFormat('yyyy-mm-dd').format(now);

