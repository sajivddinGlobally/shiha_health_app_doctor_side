import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DAddNewTimeSlot.page.dart';
import 'package:siha_health_doctor_side/data/Controller/manageAvailabilityController.dart';

class DManageDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const DManageDetailScreen({super.key, required this.id});

  @override
  ConsumerState<DManageDetailScreen> createState() =>
      _DManageDetailScreenState();
}

class _DManageDetailScreenState extends ConsumerState<DManageDetailScreen> {
  String formatTime(String time) {
    try {
      if (time.contains(":") && time.length == 5) {
        // for break time like 13:00
        final parsed = DateFormat("HH:mm").parse(time);
        return DateFormat("hh:mm a").format(parsed);
      } else {
        final parsed = DateFormat("HH:mm:ss").parse(time);
        return DateFormat("hh:mm a").format(parsed);
      }
    } catch (e) {
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(avaibilityDetailsController(widget.id));

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: provider.when(
              data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),

                    /// 🔙 Back + Title
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Availability Details",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    /// 🔷 Main Card
                    Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFF0E1329),
                        border: Border(
                          top: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 👨‍⚕️ Doctor Name
                          Text(
                            data.doctor!.fullName ?? "",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          /// 📅 Day
                          Text(
                            data.dayOfWeek ?? "",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white70,
                            ),
                          ),

                          SizedBox(height: 15.h),

                          /// ⏰ Working Time
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Color(0xFF7DFFB4)),
                              SizedBox(width: 8.w),
                              Text(
                                "${formatTime(data.startTime ?? "")} - ${formatTime(data.endTime ?? "")}",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// 🔶 Break Section Title
                    Text(
                      "Breaks",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    /// 🔻 Break List
                    data.breaks!.isEmpty
                        ? Text(
                            "No Breaks",
                            style: GoogleFonts.poppins(color: Colors.white54),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: data.breaks!.length,
                              itemBuilder: (context, index) {
                                final br = data.breaks![index];

                                return Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Color(0xFF143737),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.free_breakfast,
                                        color: Color(0xFF7DFFB4),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${formatTime(br.startTime ?? "")} - ${formatTime(br.endTime ?? "")}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                    SizedBox(height: 20.h),

                    /// ✏️ Edit Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.h),
                        backgroundColor: Color(0xFF067594),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                DAddNewTimeSlotPage(id: data.id.toString()),
                          ),
                        );
                      },
                      child: Text(
                        "Edit Slot",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                );
              },
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () =>
                  Center(child: CircularProgressIndicator(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
