import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientDetailScreen extends StatefulWidget {
  const PatientDetailScreen({super.key});

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2 / 1.6,
          child: Stack(
            children: [
              Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
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
                          "All Doctors",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFF0E1329),
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 1.w),
                          right: BorderSide(color: Colors.white, width: 1.w),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              "assets/d.png",
                              width: 105.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
                                  width: 127.w,
                                  height: 136.h,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                "Routine Check-up or Fever",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                "Rajesh Kumar (42M)",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(153, 240, 243, 245),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                width: 200.w,
                                child: Divider(color: Colors.white12),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Color(0xFF7DFFB4),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "5 Aug 2025, 10:30 AM",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7DFFB4),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                        bottom: 15.h,
                        top: 15.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 31, 45),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 0.85.w),
                          right: BorderSide(color: Colors.white, width: 0.85.w),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Booking ID",
                                style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                "#APPT20250805-12",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF067594),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 40.h,
                            width: 1.w,
                            color: Colors.white30,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Consultation Fee",
                                style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              SizedBox(height: 7.h),
                              Text(
                                "\$800",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF067594),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Text(
                        "Reason for Visit",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20.w,
                        top: 10.h,
                        right: 20.w,
                      ),
                      child: Text(
                        "Routine Health Checkup (or) Chest Pain & Shortness of Breath",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB0BABF),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Text(
                        "Patient History",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 15.h,
                        bottom: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color.fromARGB(255, 5, 49, 75),
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 0.85.w),
                          right: BorderSide(color: Colors.white, width: 0.85.w),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Last Visit",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF80919E),
                                  letterSpacing: -0.2,
                                ),
                              ),
                              Text(
                                "12 June 2025",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Divider(color: Colors.white30),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Last Visit Reason",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF80919E),
                                  letterSpacing: -0.2,
                                ),
                              ),
                              Text(
                                "Fever Consultation",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Divider(color: Colors.white30),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chronic Conditions",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF80919E),
                                  letterSpacing: -0.2,
                                ),
                              ),
                              Text(
                                "Diabetes",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Text(
                        "Last Review",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 15.h,
                        bottom: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color.fromARGB(255, 5, 49, 75),
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 0.85.w),
                          right: BorderSide(color: Colors.white, width: 0.85.w),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFD8A200)),
                              Icon(Icons.star, color: Color(0xFFD8A200)),
                              Icon(Icons.star, color: Color(0xFFD8A200)),
                              Icon(Icons.star, color: Color(0xFFD8A200)),
                              Icon(Icons.star, color: Color(0xFFD8A200)),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "“Very clean facility and professional staff.”",
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0BABF),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "- Robert",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0A74DA),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Text(
                        "Past Prescription",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    prescription("Doctor's Request Letter (PDF)"),
                    prescription("Patient’s ID Proof (PDF)"),
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180.w, 49.h),
                            backgroundColor: Color(0xFF067594),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Reschedule",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180.w, 49.h),
                            backgroundColor: Color(0xFF01061D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: Color(0xFFC11307)),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC11307),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget prescription(String name) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 12.h,
        top: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFF091A34),
      ),
      child: Row(
        children: [
          Icon(Icons.description, color: Color(0xFF0084FF)),
          SizedBox(width: 10.w),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(153, 240, 243, 245),
              letterSpacing: -0.4,
            ),
          ),
          Spacer(),
          Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 18, 37, 48),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Icon(
              Icons.file_download_outlined,
              color: Color(0xFF2ECC71),
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
