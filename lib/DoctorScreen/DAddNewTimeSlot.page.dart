import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Controller/addManAvailabilityController.dart';
import 'package:siha_health_doctor_side/data/Controller/manageAvailabilityController.dart';
import 'package:siha_health_doctor_side/data/Model/updateManAvailabilityBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailabilityBodyModel.dart'
    as addBodyModel;

class DAddNewTimeSlotPage extends ConsumerStatefulWidget {
  final int doctorId;
  final String id;
  final bool isEdit;
  const DAddNewTimeSlotPage({
    super.key,
    required this.doctorId,
    required this.id,
    required this.isEdit,
  });

  @override
  ConsumerState<DAddNewTimeSlotPage> createState() =>
      _DAddNewTimeSlotPageState();
}

class _DAddNewTimeSlotPageState extends ConsumerState<DAddNewTimeSlotPage> {
  String? selectDay;

  final List<String> dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  String formatDayForApi(String? day) {
    switch (day) {
      case "Monday":
        return "Mon";
      case "Tuesday":
        return "Tue";
      case "Wednesday":
        return "Wed";
      case "Thursday":
        return "Thu";
      case "Friday":
        return "Fri";
      case "Saturday":
        return "Sat";
      case "Sunday":
        return "Sun";
      default:
        return "";
    }
  }

  // List<Map<String, String>> breaks = [];
  List<Map<String, TextEditingController>> breakControllers = [];

  // Controllers for break input
  TextEditingController breakStartController = TextEditingController();
  TextEditingController breakEndController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  Future<void> pickTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      // 👉 Format: 09:00 AM
      final formatted = DateFormat("hh:mm a").format(dt);

      controller.text = formatted;
    }
  }

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // 👇 default 1 break field
    breakControllers.add({
      "start": TextEditingController(),
      "end": TextEditingController(),
    });

    if (widget.isEdit) {
      loadEditData();
    }
  }

  String formatTimeForUI(String time) {
    try {
      DateTime parsed;

      if (time.split(":").length == 2) {
        // 👉 09:45
        parsed = DateFormat("HH:mm").parse(time);
      } else {
        // 👉 09:00:00
        parsed = DateFormat("HH:mm:ss").parse(time);
      }

      return DateFormat("hh:mm a").format(parsed);
    } catch (e) {
      print("Time parse error: $time");
      return "";
    }
  }

  void loadEditData() async {
    final data = await ref.read(avaibilityDetailsController(widget.id).future);

    print("BREAKS DATA: ${data.breaks}");

    setState(() {
      selectDay = dayList.firstWhere(
        (day) => formatDayForApi(day) == data.dayOfWeek,
        orElse: () => "Monday",
      );

      startTimeController.text = formatTimeForUI(data.startTime ?? "");
      endTimeController.text = formatTimeForUI(data.endTime ?? "");

      breakControllers.clear();

      if (data.breaks != null && data.breaks!.isNotEmpty) {
        for (var br in data.breaks!) {
          breakControllers.add({
            "start": TextEditingController(
              text: formatTimeForUI(br.startTime ?? ""),
            ),
            "end": TextEditingController(
              text: formatTimeForUI(br.endTime ?? ""),
            ),
          });
        }
      } else {
        breakControllers.add({
          "start": TextEditingController(),
          "end": TextEditingController(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final addManAvailabilityState = ref.watch(addMAnAvailabilityProvider);
    final isLoadingState = addManAvailabilityState is AsyncLoading;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Back",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      // "Add New Time Slot",
                      widget.isEdit ? "Edit Time Slot" : "Add New Time Slot",
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Enter details of new time slot ",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9CA3AC),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.white38),
                    SizedBox(height: 24.h),
                    Text(
                      "SELECT DAY(S)",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DropdownButtonFormField<String>(
                      hint: Text(
                        "Select Days",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262933),
                        ),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 18.w,
                          right: 18.w,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      value: selectDay,
                      items: dayList.map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(
                            day,
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectDay = value;
                        });
                      },
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "START TIME",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60,
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextFormField(
                                controller: startTimeController,
                                readOnly: true,
                                onTap: () => pickTime(startTimeController),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 18.w,
                                    right: 18.w,
                                    top: 15.h,
                                    bottom: 15.h,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                  hintText: "Start Time",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "END TIME",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60,
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextFormField(
                                controller: endTimeController,
                                readOnly: true,
                                onTap: () => pickTime(endTimeController),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 18.w,
                                    right: 18.w,
                                    top: 15.h,
                                    bottom: 15.h,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                  hintText: "END Time",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Divider(color: Colors.white30),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add Breaks",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            minimumSize: Size(80.w, 30.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: Color(0xFF76BDFF)),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              breakControllers.add({
                                "start": TextEditingController(),
                                "end": TextEditingController(),
                              });
                            });
                          },
                          child: Text(
                            "Add New",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF76BDFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: breakControllers.asMap().entries.map((entry) {
                        int index = entry.key;
                        var controllers = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "START TIME",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white60,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextFormField(
                                      controller: controllers["start"],
                                      readOnly: true,
                                      onTap: () =>
                                          pickTime(controllers["start"]!),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 18.w,
                                          right: 18.w,
                                          top: 15.h,
                                          bottom: 15.h,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFFFFFFF),
                                        hintText: "Start Time",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "END TIME",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white60,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextFormField(
                                      controller: controllers["end"],
                                      readOnly: true,
                                      onTap: () =>
                                          pickTime(controllers["end"]!),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 18.w,
                                          right: 18.w,
                                          top: 15.h,
                                          bottom: 15.h,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFFFFFFF),
                                        hintText: "End Time",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (breakControllers.length > 1)
                                Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  // color: Colors.amber,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        breakControllers.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400.w, 55.h),
                        backgroundColor: Color(0xFF067594),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      // onPressed: () async {
                      //   // String? convertToApiTime(String? time) {
                      //   //   if (time == null || time.isEmpty) return null;
                      //   //   try {
                      //   //     final dt = DateFormat("hh:mm a").parse(time);
                      //   //     return DateFormat("HH:mm").format(dt);
                      //   //   } catch (e) {
                      //   //     return null;
                      //   //   }
                      //   // }
                      //   // final breaksList = breakControllers.map((controllers) {
                      //   //   final startText = controllers["start"]!.text;
                      //   //   final endText = controllers["end"]!.text;
                      //   //   log("DEBUG → $startText - $endText");
                      //   //   final start = convertToApiTime(startText);
                      //   //   final end = convertToApiTime(endText);
                      //   //   return Break(
                      //   //     startTime: start ?? "",
                      //   //     endTime: end ?? "",
                      //   //   );
                      //   // }).toList();
                      //   // if (startTimeController.text.isEmpty ||
                      //   //     endTimeController.text.isEmpty) {
                      //   //   ScaffoldMessenger.of(context).showSnackBar(
                      //   //     SnackBar(
                      //   //       content: Text("Please select start & end time"),
                      //   //       backgroundColor: Color(0xFF067594),
                      //   //       behavior: SnackBarBehavior.floating,
                      //   //       margin: EdgeInsets.symmetric(
                      //   //         horizontal: 20,
                      //   //         vertical: 20,
                      //   //       ),
                      //   //       shape: RoundedRectangleBorder(
                      //   //         borderRadius: BorderRadius.circular(15),
                      //   //       ),
                      //   //       elevation: 6,
                      //   //     ),
                      //   //   );
                      //   //   return;
                      //   // }
                      //   // setState(() {
                      //   //   isLoading = true;
                      //   // });
                      // final body = UpdateManAvailabilityBodyModel(
                      //   startTime:
                      //       convertToApiTime(startTimeController.text) ?? "",
                      //   endTime:
                      //       convertToApiTime(endTimeController.text) ?? "",
                      //   breaks: breaksList,
                      // );
                      // try {
                      //   final service = APIStateNetwork(callDio());
                      //   final response = await service.updateManAvailability(
                      //     widget.id,
                      //     body,
                      //   );
                      //   if (response != null) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(
                      //         content: Text("Update Sucess"),
                      //         backgroundColor: Color(0xFF067594),
                      //         behavior: SnackBarBehavior.floating,
                      //         margin: EdgeInsets.symmetric(
                      //           horizontal: 20,
                      //           vertical: 20,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         elevation: 6,
                      //       ),
                      //     );
                      //     ref.invalidate(
                      //       avaibilityDetailsController(widget.id),
                      //     );
                      //     ref.invalidate(avaibilityController);
                      //     Navigator.pop(context);
                      //   }
                      // } catch (e, st) {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      //   log(e.toString());
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("Error : $e"),
                      //       backgroundColor: Color(0xFF067594),
                      //       behavior: SnackBarBehavior.floating,
                      //       margin: EdgeInsets.symmetric(
                      //         horizontal: 20,
                      //         vertical: 10,
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //       elevation: 6,
                      //     ),
                      //   );
                      // } finally {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      // }

                      //   String? convertToApiTime(String? time) {
                      //     if (time == null || time.isEmpty) return null;
                      //     try {
                      //       final dt = DateFormat("hh:mm a").parse(time);
                      //       return DateFormat("HH:mm").format(dt);
                      //     } catch (e) {
                      //       return null;
                      //     }
                      //   }

                      //   final breaksList = breakControllers.map((controllers) {
                      //     final startText = controllers["start"]!.text;
                      //     final endText = controllers["end"]!.text;
                      //     final start = convertToApiTime(startText);
                      //     final end = convertToApiTime(endText);
                      //     return addBodyModel.Break(
                      //       startTime: start ?? "",
                      //       endTime: end ?? "",
                      //     );
                      //   }).toList();
                      //   ref
                      //       .read(addMAnAvailabilityProvider.notifier)
                      //       .addManAvailablity(
                      //         doctorId: widget.doctorId,
                      //         dayOfWeek: formatDayForApi(selectDay),
                      //         startTime:
                      //             convertToApiTime(startTimeController.text) ??
                      //             "",
                      //         endTime:
                      //             convertToApiTime(endTimeController.text) ??
                      //             "",
                      //         breaks: breaksList,
                      //         context: context,
                      //       );
                      // },

                      /////////////////////////////
                      onPressed: () async {
                        // String? convertToApiTime(String? time) {
                        //   if (time == null || time.isEmpty) return null;
                        //   try {
                        //     final dt = DateFormat("hh:mm a").parse(time);
                        //     return DateFormat("HH:mm").format(dt);
                        //   } catch (e) {
                        //     return null;
                        //   }
                        // }

                        String? convertToApiTime(String? time) {
                          if (time == null || time.isEmpty) return null;
                          try {
                            final dt = DateFormat("hh:mm a").parse(time);
                            return DateFormat("HH:mm").format(dt);
                          } catch (e) {
                            return null;
                          }
                        }

                        final breaksList = breakControllers.map((controllers) {
                          final startText = controllers["start"]!.text;
                          final endText = controllers["end"]!.text;
                          log("DEBUG → $startText - $endText");
                          final start = convertToApiTime(startText);
                          final end = convertToApiTime(endText);
                          return Break(
                            startTime: start ?? "",
                            endTime: end ?? "",
                          );
                        }).toList();
                        if (startTimeController.text.isEmpty ||
                            endTimeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please select start & end time"),
                              backgroundColor: Color(0xFF067594),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 6,
                            ),
                          );
                          return;
                        }
                        if (widget.isEdit) {
                          setState(() {
                            isLoading = true;
                          });
                          // ✅ UPDATE API
                          final body = UpdateManAvailabilityBodyModel(
                            startTime:
                                convertToApiTime(startTimeController.text) ??
                                "",
                            endTime:
                                convertToApiTime(endTimeController.text) ?? "",
                            breaks: breaksList,
                          );

                          try {
                            final service = APIStateNetwork(callDio());
                            final response = await service
                                .updateManAvailability(widget.id, body);

                            if (response != null) {
                              ref.invalidate(avaibilityController);
                              ref.invalidate(
                                avaibilityDetailsController(widget.id),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Update Success"),
                                  backgroundColor: Color(0xFF067594),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 6,
                                ),
                              );

                              Navigator.pop(context);
                            }
                          } catch (e) {
                            log(e.toString());
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } else {
                          // ✅ ADD API
                          String? convertToApiTime(String? time) {
                            if (time == null || time.isEmpty) return null;
                            try {
                              final dt = DateFormat("hh:mm a").parse(time);
                              return DateFormat("HH:mm").format(dt);
                            } catch (e) {
                              return null;
                            }
                          }

                          final breaksList = breakControllers.map((
                            controllers,
                          ) {
                            final startText = controllers["start"]!.text;
                            final endText = controllers["end"]!.text;
                            final start = convertToApiTime(startText);
                            final end = convertToApiTime(endText);
                            return addBodyModel.Break(
                              startTime: start ?? "",
                              endTime: end ?? "",
                            );
                          }).toList();
                          ref
                              .read(addMAnAvailabilityProvider.notifier)
                              .addManAvailablity(
                                doctorId: widget.doctorId,
                                dayOfWeek: formatDayForApi(selectDay),
                                startTime:
                                    convertToApiTime(
                                      startTimeController.text,
                                    ) ??
                                    "",
                                endTime:
                                    convertToApiTime(endTimeController.text) ??
                                    "",
                                breaks: breaksList,
                                context: context,
                              );
                        }
                      },
                      child: isLoading || isLoadingState
                          ? Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ),
                            )
                          : Text(
                              widget.isEdit
                                  ? "Edit Time Slot"
                                  : "Add New Time Slot",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
