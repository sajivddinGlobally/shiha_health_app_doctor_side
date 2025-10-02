import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DAddLeave.page.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DAddNewTimeSlot.page.dart';
import 'package:siha_health_doctor_side/data/Controller/manageAvailabilityController.dart';

class DManageScreen extends ConsumerStatefulWidget {
  const DManageScreen({super.key});

  @override
  ConsumerState<DManageScreen> createState() => _DManageScreenState();
}

class _DManageScreenState extends ConsumerState<DManageScreen> {
  @override
  Widget build(BuildContext context) {
    final availabilityProvider = ref.watch(avaibilityController);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          availabilityProvider.when(
            data: (availability) {
              return Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        "Manage Availability",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {},
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     _dayCard(
                      //       "Mon- Wed",
                      //       "09:00 AM - 06:00 PM",
                      //       "2 Breaks",
                      //     ),
                      //     _dayCard("Sat- Sun", "On Leave", "No Breaks"),
                      //   ],
                      // ),
                      // SizedBox(height: 20.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     _dayCard("Friday", "02:00 PM - 06:00 PM", "1 Breaks"),
                      //     _dayCard(
                      //       "Thursday",
                      //       "02:00 PM - 04:00 PM",
                      //       "1 Breaks",
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(195.w, 49.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DAddNewTimeSlotPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Add New Slot",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(195.w, 49.h),
                              backgroundColor: Color(0xFF01061D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Color(0xFFC11307)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DAddLeavePage(),
                                ),
                              );
                            },
                            child: Text(
                              "Add Leave",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFC11307),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () =>
                Center(child: CircularProgressIndicator(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _dayCard(String day, String time, String br) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
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
          Image.asset(
            "assets/day.png",
            width: 170.w,
            height: 92.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15.h),
          Container(
            margin: EdgeInsets.only(left: 5.w),
            width: 90.w,
            height: 25.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: br.toLowerCase().contains("no breaks")
                  ? Color(0xFF33182A)
                  : Color(0xFF143737),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_filled,
                  color: br.toLowerCase().contains("no breaks")
                      ? Color(0xFFCC2E2E)
                      : Color(0xFF7DFFB4),
                  size: 18.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  br,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: br.toLowerCase().contains("no breaks")
                        ? Color(0xFFCC2E2E)
                        : Color(0xFF7DFFB4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              day,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -0.4,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(153, 255, 255, 255),
                letterSpacing: -0.4,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: Size(160.w, 36.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: Color(0xFF76BDFF)),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Edit Slot",
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF76BDFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
