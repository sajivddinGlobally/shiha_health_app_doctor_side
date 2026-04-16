import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Controller/manageAvailabilityController.dart';
import 'package:siha_health_doctor_side/data/Model/updateManAvailabilityBodyModel.dart';

class DAddNewTimeSlotPage extends ConsumerStatefulWidget {
  final String id;
  const DAddNewTimeSlotPage({super.key, required this.id});

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
  List<Map<String, String>> breaks = [];

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
  Widget build(BuildContext context) {
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
                      "Add New Time Slot",
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
                        "--Select Specialization--",
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
                            if (breakStartController.text.isNotEmpty &&
                                breakEndController.text.isNotEmpty) {
                              setState(() {
                                breaks.add({
                                  "start": breakStartController.text,
                                  "end": breakEndController.text,
                                });
                                breakStartController.clear();
                                breakEndController.clear();
                              });
                            }
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
                                controller: breakStartController,
                                readOnly: true,
                                onTap: () => pickTime(breakStartController),
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
                                controller: breakEndController,
                                readOnly: true,
                                onTap: () => pickTime(breakEndController),
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
                    SizedBox(height: 15.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: breaks.map((b) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: Color.fromARGB(25, 10, 116, 218),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${b["start"]} - ${b["end"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0A74DA),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              IconButton(
                                style: IconButton.styleFrom(
                                  minimumSize: Size(20.w, 25.h),
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  setState(() {
                                    breaks.remove(b);
                                  });
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Color(0xFF0A74DA),
                                  size: 22.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400.w, 55.h),
                        backgroundColor: Color(0xFF067594),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () async {
                        String convertToApiTime(String time) {
                          final dt = DateFormat("hh:mm a").parse(time);
                          return DateFormat("HH:mm").format(dt);
                        }

                        setState(() {
                          isLoading = true;
                        });
                        final body = UpdateManAvailabilityBodyModel(
                          startTime: convertToApiTime(startTimeController.text),
                          endTime: convertToApiTime(endTimeController.text),
                          breaks: [
                            Break(
                              startTime: convertToApiTime(
                                breakStartController.text,
                              ),
                              endTime: convertToApiTime(
                                breakEndController.text,
                              ),
                            ),
                          ],
                        );

                        try {
                          final service = APIStateNetwork(callDio());
                          final response = await service.updateManAvailability(
                            widget.id,
                            body,
                          );
                          if (response != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Update Sucess"),
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
                            ref.invalidate(
                              avaibilityDetailsController(widget.id),
                            );
                            ref.invalidate(avaibilityController);
                            Navigator.pop(context);
                          }
                        } catch (e, st) {
                          setState(() {
                            isLoading = false;
                          });
                          log(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error : $e"),
                              backgroundColor: Color(0xFF067594),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 6,
                            ),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: isLoading
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
                              "Submit",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    ),
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
