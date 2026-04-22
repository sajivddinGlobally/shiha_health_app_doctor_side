import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DHome.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DSignUp.screen.dart';

class DSignInScreen extends ConsumerStatefulWidget {
  const DSignInScreen({super.key});

  @override
  ConsumerState<DSignInScreen> createState() => _DSignInScreenState();
}

class _DSignInScreenState extends ConsumerState<DSignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/si.png",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Siha",
                          style: GoogleFonts.poppins(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: -1,
                          ),
                        ),
                        TextSpan(
                          text: "Health",
                          style: GoogleFonts.poppins(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Text(
                      "ENHANCE YOUR APPROACH TO PATIENT HEALTH.",
                      style: GoogleFonts.poppins(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                        letterSpacing: -1,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      "Enter your details to get started with us",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 500.h),
              width: double.infinity,
              //height: 500.h,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/bottom.png",
                    width: MediaQuery.of(context).size.width,
                    // height: 460.h,
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h),
                        Text(
                          "Access Your Siha Doctor Dashboard",
                          style: GoogleFonts.poppins(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DSignUpScreen(),
                              ),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF717F8D),
                                    letterSpacing: -1,
                                  ),
                                ),
                                TextSpan(
                                  text: "Register",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2998FF),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Divider(color: Colors.white24, height: 1.h),
                        SizedBox(height: 20.h),
                        Text(
                          "EMAIL ADDRESS",
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white60,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          controller: emailController,
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
                          controller: passwordController,
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
                        SizedBox(height: 30.h),
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
                                builder: (context) => MyBottomNavigation(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
