import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/data/repositories/primary_key_setting_Repo.dart';
import 'package:vehicle_service_app/src/logic/bloc/customer/customer_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_state.dart';
import 'package:vehicle_service_app/src/presentation/widgets/buttons.dart';
import 'package:vehicle_service_app/src/presentation/widgets/drop_down_list.dart';
import 'package:vehicle_service_app/src/presentation/widgets/second_title.dart';
import 'package:vehicle_service_app/src/presentation/widgets/select_date_field.dart';
import 'package:vehicle_service_app/src/presentation/widgets/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_state.dart';
import 'package:vehicle_service_app/src/presentation/widgets/main_title_widget.dart';
import 'package:vehicle_service_app/src/utils/datetime_utils.dart';

class ServiceType extends StatefulWidget {
  ServiceType({super.key});

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  final TextEditingController License_PlateController = TextEditingController();
  final TextEditingController MileageController = TextEditingController();
  final TextEditingController BrandController = TextEditingController();
  final TextEditingController ModelController = TextEditingController();
  final TextEditingController YearController = TextEditingController();
  final TextEditingController ColorController = TextEditingController();
  final TextEditingController InsuranceClaimController =
      TextEditingController();
  final TextEditingController Customer_NoteController = TextEditingController();
  final TextEditingController Office_NoteController = TextEditingController();
  final TextEditingController CustomerNameController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();

  String combinedValue = '';
  DateTime? ScheduledDate;
  String? selectedValue;

  final List<String> dropdownItems = [
    'RUNNING REPAIR',
    'NORMAL SERVICE',
    'BODY WASH',
    'ACCIDENT REPAIR',
    'FULL SERVICE'
  ];

  clear() {
    License_PlateController.clear();
    MileageController.clear();
    BrandController.clear();
    ModelController.clear();
    YearController.clear();
    ColorController.clear();
    InsuranceClaimController.clear();
    Customer_NoteController.clear();
    Office_NoteController.clear();
    CustomerNameController.clear();
    PhoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobCardBloc(ApiProvider()),
        ),
        BlocProvider(
          create: (context) =>
              PrimaryKeySettingBloc(PrimaryKeySettingRepo(ApiProvider()))
                ..add(fetchPrimaryKeySetting()),
        ),
        BlocProvider(
          create: (context) => CustomerBloc(ApiProvider()),
        ),
      ],
      child: Scaffold(
        body: BlocConsumer<JobCardBloc, JobCardState>(
          listener: (context, state) {
            if (state is JobCardSaved) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Job Card Saved Successfully')),
              );
            } else if (state is JobCardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Title_Widget(
                            title: 'CUSTOMER DETAILS',
                          ),
                          const Secont_Title(
                            second_title: 'Enter Customer Details',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // AutoCompleteWidget(),
                          TextFormFieldComponent(
                            controller: CustomerNameController,
                            lableText: "Customer Name",
                            suffixIcon: Icons.person,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: PhoneController,
                            lableText: "Phone Number",
                            suffixIcon: Icons.phone,
                            inputType: TextInputType.phone,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                            onChanged: () {},
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Title_Widget(
                            title: 'VEHICLE INFORMATION',
                          ),
                          const Secont_Title(
                            second_title: 'Enter Vehicle Details',
                          ),
                          BlocBuilder<PrimaryKeySettingBloc,
                              PrimaryKeySettingState>(
                            builder: (context, state) {
                              if (state is PrimaryKeySettingLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is PrimaryKeySettingLoaded) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.primarykeysetting.length,
                                  itemBuilder: (context, index) {
                                    final setting =
                                        state.primarykeysetting[index];

                                    combinedValue =
                                        '${setting['Prefix'] ?? ''}${((int.tryParse(setting['LatestID']?.toString() ?? '0') ?? 0) + 1)}';
                                  },
                                );
                              } else if (state is PrimaryKeySettingError) {
                                return Text("Error: ${state.message}");
                              }
                              return const Text("No Data Available");
                            },
                          ),
                          DropDownList<String>(
                            items: dropdownItems,
                            value: selectedValue,
                            hint: 'Select Job Type',
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          SelectDateField(
                            onDateSelected: (date) {
                              setState(() {
                                ScheduledDate = date;
                              });
                            },
                          ),
                          TextFormFieldComponent(
                            controller: License_PlateController,
                            lableText: "Vehicle Number",
                            suffixIcon: Icons.numbers,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: MileageController,
                            lableText: "Current Mileage",
                            suffixIcon: Icons.height,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: BrandController,
                            lableText: "Brand",
                            suffixIcon: Icons.badge_rounded,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: ModelController,
                            lableText: "Model",
                            suffixIcon: Icons.model_training,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: YearController,
                            lableText: "Year",
                            suffixIcon: Icons.date_range,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: ColorController,
                            lableText: "Color",
                            suffixIcon: Icons.color_lens,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Title_Widget(
                            title: 'BUSINESS DETAILS',
                          ),
                          const Secont_Title(
                            second_title:
                                'Enter Basic Details for new work order',
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormFieldComponent(
                            controller: InsuranceClaimController,
                            lableText: "Claim Availble",
                            suffixIcon: Icons.event_available,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: Customer_NoteController,
                            lableText: "Chassis Number",
                            suffixIcon: Icons.numbers,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldComponent(
                            controller: Office_NoteController,
                            lableText: "Note",
                            suffixIcon: Icons.mode,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            maxLines: 5,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: state is JobCardLoading
                                ? CircularProgressIndicator()
                                : ButtonComponent(
                                    buttonText: "SAVE",
                                    textColor: Colors.white,
                                    buttonColor: AppThemes.PrimaryColor,
                                    callback: () {
                                      final int currentID = int.tryParse(
                                              combinedValue.replaceAll(
                                                  RegExp(r'\D'), '')) ??
                                          0;
                                      final int latestID = currentID;
                                      combinedValue =
                                          '${combinedValue.replaceAll(RegExp(r'\d+'), '')}$latestID';
                                      context.read<PrimaryKeySettingBloc>().add(
                                          UpdatePrimaryKeySetting(latestID));

                                      final Job_Number = combinedValue;
                                      final Cust_ID = " ";
                                      final Vehicle_Type = BrandController.text;
                                      final Brand = BrandController.text;
                                      final Model = ModelController.text;
                                      final License_Plate =
                                          License_PlateController.text;
                                      final Mileage = MileageController.text;
                                      final Job_Type = selectedValue;
                                      final Date = " ";
                                      final Time = " ";
                                      final Assigned_emp_Id = " ";
                                      final Current_Status = "JOB IN";
                                      final Current_Location = " ";
                                      final job_barcode = combinedValue;
                                      final Job_Name1 = " ";
                                      final Job_Name2 = " ";
                                      final CreateDate = Current_Date;
                                      final CreateTime = Current_Time;
                                      final Invoice_ID = " ";
                                      final Scheduled_Date = ScheduledDate;
                                      final Scheduled_Time = Current_Time;
                                      final Customer_Note =
                                          Customer_NoteController.text;
                                      final Office_Note =
                                          Office_NoteController.text;
                                      final Additional_Remark = " ";
                                      final Additional_RefNo = " ";
                                      final Created_Emp_ID = " ";
                                      final AddKm = " ";
                                      final NewMileage = " ";
                                      final InsuranceClaim =
                                          InsuranceClaimController.text;
                                      final Year = YearController.text;
                                      final Color = ColorController.text;
                                      final Sub_Total = 0.0;
                                      final Extra_Tax = 0.0;
                                      final Extra_Tax_Percentage = 0.0;
                                      final Extra_Discount = 0.0;
                                      final Extra_Disc_Percentage = 0.0;
                                      final Advanced_Amount = 0.0;
                                      final Advanced_Method = " ";
                                      final Net_Total = 0.0;
                                      final Net_Total_Without_Advanced = 0.0;
                                      final Paid_Amount = 0.0;
                                      final Due_Amount = 0.0;
                                      final Change_Amount = 0.0;
                                      final Payment_Methods = " ";
                                      final Payment_Status = "Unpaid";
                                      final Cust_Name =
                                          CustomerNameController.text;
                                      final Cust_Phone = PhoneController.text;
                                      final FuelLevel = " ";
                                      final EstimateAmount = 0.0;
                                      final ShortName = " ";
                                      final Display_Status = " ";
                                      final Job_Priority = " ";
                                      final Job_Category_Type = " ";
                                      final Cust_VehicleNo = " ";

                                      BlocProvider.of<JobCardBloc>(context).add(
                                          saveJobCard(
                                              Job_Number,
                                              Cust_ID,
                                              Vehicle_Type,
                                              Brand,
                                              Model,
                                              License_Plate,
                                              Mileage,
                                              Job_Type.toString(),
                                              Date,
                                              Time,
                                              Assigned_emp_Id,
                                              Current_Status,
                                              Current_Location,
                                              job_barcode,
                                              Job_Name1,
                                              Job_Name2,
                                              CreateDate,
                                              CreateTime,
                                              Invoice_ID,
                                              Scheduled_Date.toString(),
                                              Scheduled_Time,
                                              Customer_Note,
                                              Office_Note,
                                              Additional_Remark,
                                              Additional_RefNo,
                                              Created_Emp_ID,
                                              AddKm,
                                              NewMileage,
                                              InsuranceClaim,
                                              Year,
                                              Color,
                                              Sub_Total.toString(),
                                              Extra_Tax.toString(),
                                              Extra_Tax_Percentage.toString(),
                                              Extra_Discount.toString(),
                                              Extra_Disc_Percentage.toString(),
                                              Advanced_Amount.toString(),
                                              Advanced_Method,
                                              Net_Total.toString(),
                                              Net_Total_Without_Advanced
                                                  .toString(),
                                              Paid_Amount.toString(),
                                              Due_Amount.toString(),
                                              Change_Amount.toString(),
                                              Payment_Methods,
                                              Payment_Status,
                                              Cust_Name.toString(),
                                              Cust_Phone.toString(),
                                              FuelLevel,
                                              EstimateAmount.toString(),
                                              ShortName,
                                              Display_Status,
                                              Job_Priority,
                                              Job_Category_Type,
                                              Cust_VehicleNo));

                                      clear();
                                    }),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
