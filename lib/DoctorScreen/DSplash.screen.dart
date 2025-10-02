import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:siha_health_doctor_side/DoctorScreen/DSignUp.screen.dart';

class DSplashScreen extends StatefulWidget {
  const DSplashScreen({super.key});

  @override
  State<DSplashScreen> createState() => _DSplashScreenState();
}

class _DSplashScreenState extends State<DSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white.withOpacity(
                      0.4,
                    ), // Optional dim overlay
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        // "assets/mp4/dna.gif",
                        "assets/d.png",
                        fit: BoxFit.cover,
                        // ya BoxFit.contain
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: InwardCurveClipper(),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            // Image.asset(
            //   "assets/vectors/Vector.png",
            //   width: MediaQuery.of(context).size.width,
            //   height: 110.h,
            //   fit: BoxFit.cover,
            // ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 80),
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
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     margin: EdgeInsets.only(bottom: 40.h),
            //     padding: EdgeInsets.all(1.w), // Border thickness
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Color.fromARGB(0, 255, 255, 255),
            //           Color.fromARGB(255, 255, 255, 255),
            //         ],
            //         begin: Alignment.topLeft,
            //         end: Alignment.topRight,
            //       ),
            //       borderRadius: BorderRadius.circular(30.r),
            //     ),
            //     child: Container(
            //       width: 400.w,
            //       height: 240.h,
            //       decoration: BoxDecoration(
            //         color: Color(0xFF0E1329),
            //         borderRadius: BorderRadius.circular(30.r),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.only(
            //           left: 25.w,
            //           right: 25.w,
            //           top: 25.h,
            //           bottom: 20.h,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text.rich(
            //               TextSpan(
            //                 children: [
            //                   TextSpan(
            //                     text: "Welcome to ",
            //                     style: GoogleFonts.poppins(
            //                       fontSize: 22.sp,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   TextSpan(
            //                     text: "Siha Health",
            //                     style: GoogleFonts.poppins(
            //                       fontSize: 22.sp,
            //                       fontWeight: FontWeight.w600,
            //                       color: Color(0xFFFFFFFF),
            //                       letterSpacing: -1,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             SizedBox(height: 10.h),
            //             Text(
            //               "Your complete health companion, designed to help you track your fitness goals, monitor your nutrition, and manage your wellness journey.",
            //               style: GoogleFonts.poppins(
            //                 fontSize: 14.sp,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.white,
            //                 letterSpacing: -0.4,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //             SizedBox(height: 20.h),
            //             ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                 minimumSize: Size(
            //                   MediaQuery.of(context).size.width * 0.8,
            //                   50.h,
            //                 ),
            //                 backgroundColor: Color(0xFF067594),
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10.r),
            //                 ),
            //               ),
            //               onPressed: () {
            //                 Navigator.push(
            //                   context,
            //                   CupertinoPageRoute(
            //                     builder: (context) => LoginPage(),
            //                   ),
            //                 );
            //               },
            //               child: Text(
            //                 "Get Started",
            //                 style: GoogleFonts.poppins(
            //                   fontSize: 14.sp,
            //                   fontWeight: FontWeight.w500,
            //                   color: Colors.white,
            //                   letterSpacing: -1,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20.h,
                ), // kam kiya taaki overflow na ho
                padding: EdgeInsets.all(1.w), // Border thickness
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.9, // screen ke 90% width
                  constraints: BoxConstraints(
                    maxHeight:
                        MediaQuery.of(context).size.height *
                        0.38, // screen ke 38% se zyada nahi
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF0E1329),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 20.h,
                    ),
                    child: SingleChildScrollView(
                      // content scrollable ho gaya
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Welcome to ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "Siha Health",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Effortlessly manage your patients from any location, at any time, ensuring that you have access to their information whenever you need it.",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                MediaQuery.of(context).size.width *
                                    0.75, // thoda chhota rakha
                                50.h,
                              ),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DSignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom left

    // Inward curve (bowl shape)
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50, // control point (go inside)
      size.width,
      size.height - 50, // end point
    );

    path.lineTo(size.width, 0); // top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
