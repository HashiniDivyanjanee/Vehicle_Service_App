class JobCardModel {
  final String Job_Number;
  final String Job_Type;
  final String Scheduled_Date;
  final String Cust_Name;
  final String Sub_Total;

  JobCardModel(
      {required this.Job_Number,
      required this.Job_Type,
      required this.Scheduled_Date,
      required this.Cust_Name,
      required this.Sub_Total});

  factory JobCardModel.fromJson(Map<String, dynamic> json) {
    return JobCardModel(
        Job_Number: json['Job_Number'],
        Job_Type: json['Job_Type'],
        Scheduled_Date: json['Scheduled_Date'],
        Cust_Name: json['Cust_Name'],
        Sub_Total: json['Sub_Total']);
  }
}
