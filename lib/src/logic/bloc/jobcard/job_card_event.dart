abstract class JobCardEvent {}

class saveJobCard extends JobCardEvent {
    final String Job_Number;
  final String Cust_ID;
  final String Vehicle_Type;
  final String Brand;
  final String Model;
  final String License_Plate;
  final String Mileage;
  final String Job_Type;
  final String Date;
  final String Time;
  final String Assigned_emp_Id;
  final String Current_Status;
  final String Current_Location;
  final String job_barcode;
  final String Job_Name1;
  final String Job_Name2;
  final String CreateDate;
  final String CreateTime;
  final String Invoice_ID;
  final String Scheduled_Date;
  final String Scheduled_Time;
  final String Customer_Note;
  final String Office_Note;
  final String Additional_Remark;
  final String Additional_RefNo;
  final String Created_Emp_ID;
  final String AddKm;
  final String NewMileage;
  final String InsuranceClaim;
  final String Year;
  final String Color;
  final String Sub_Total;
  final String Extra_Tax;
  final String Extra_Tax_Percentage;
  final String Extra_Discount;
  final String Extra_Disc_Percentage;
  final String Advanced_Amount;
  final String Advanced_Method;
  final String Net_Total;
  final String Net_Total_Without_Advanced;
  final String Paid_Amount;
  final String Due_Amount;
  final String Change_Amount;
  final String Payment_Methods;
  final String Payment_Status;
  final String Cust_Name;
  final String Cust_Phone;
  final String FuelLevel;
  final String EstimateAmount;
  final String ShortName;
  final String Display_Status;
  final String Job_Priority;
  final String Job_Category_Type;
  final String Cust_VehicleNo;


  saveJobCard(
            this.Job_Number,
      this.Cust_ID,
      this.Vehicle_Type,
      this.Brand,
      this.Model,
      this.License_Plate,
      this.Mileage,
      this.Job_Type,
      this.Date,
      this.Time,
      this.Assigned_emp_Id,
      this.Current_Status,
      this.Current_Location,
      this.job_barcode,
      this.Job_Name1,
      this.Job_Name2,
      this.CreateDate,
      this.CreateTime,
      this.Invoice_ID,
      this.Scheduled_Date,
      this.Scheduled_Time,
      this.Customer_Note,
      this.Office_Note,
      this.Additional_Remark,
      this.Additional_RefNo,
      this.Created_Emp_ID,
      this.AddKm,
      this.NewMileage,
      this.InsuranceClaim,
      this.Year,
      this.Color,
      this.Sub_Total,
      this.Extra_Tax,
      this.Extra_Tax_Percentage,
      this.Extra_Discount,
      this.Extra_Disc_Percentage,
      this.Advanced_Amount,
      this.Advanced_Method,
      this.Net_Total,
      this.Net_Total_Without_Advanced,
      this.Paid_Amount,
      this.Due_Amount,
      this.Change_Amount,
      this.Payment_Methods,
      this.Payment_Status,
      this.Cust_Name,
      this.Cust_Phone,
      this.FuelLevel,
      this.EstimateAmount,
      this.ShortName,
      this.Display_Status,
      this.Job_Priority,
      this.Job_Category_Type,
      this.Cust_VehicleNo);

}
