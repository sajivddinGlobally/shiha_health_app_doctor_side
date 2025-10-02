import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/Dotp.screen.dart';

class DVerifyScreen extends StatefulWidget {
  const DVerifyScreen({super.key});

  @override
  State<DVerifyScreen> createState() => _DVerifyScreenState();
}

class _DVerifyScreenState extends State<DVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.h),
                      Text(
                        "Create Your Doctor Account",
                        style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          letterSpacing: -1,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Start by providing your basic details to get started with Siha Doctor.",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Divider(color: Colors.white24, height: 1.h),
                      SizedBox(height: 60.h),
                      Text(
                        "Full NAME",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
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
                          hintText: "eg.Joe Biden",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "YOUR EMAIL",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
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
                          hintText: "eg.Joe@example.com",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "YOUR NUMBER",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
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
                          hintText: "eg.+1 (212) 456 7899",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "PASSWORD",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
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
                          hintText: "xxxxxxxx",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "CONFIRM PASSWORD",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
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
                          hintText: "xxxxxxxx",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DOtpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Verify",
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
            ],
          ),
        ),
      ),
    );
  }
}
