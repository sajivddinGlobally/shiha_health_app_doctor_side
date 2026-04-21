import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DVerify.screen.dart';

class DSignUpScreen extends StatefulWidget {
  const DSignUpScreen({super.key});

  @override
  State<DSignUpScreen> createState() => _DSignUpScreenState();
}

class _DSignUpScreenState extends State<DSignUpScreen> {
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
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => LoginPage(),
                            //   ),
                            // );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
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
                                builder: (context) => DVerifyScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
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

// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:siha_health_doctor_side/DoctorScreen/DVerify.screen.dart';

// class DSignUpScreen extends StatefulWidget {
//   const DSignUpScreen({super.key});

//   @override
//   State<DSignUpScreen> createState() => _DSignUpScreenState();
// }

// class _DSignUpScreenState extends State<DSignUpScreen>
//     with TickerProviderStateMixin {
//   // ─── Controllers ───────────────────────────────────────────────
//   late AnimationController _bgController;
//   late AnimationController _headerController;
//   late AnimationController _formController;
//   late AnimationController _particleController;
//   late AnimationController _shimmerController;
//   late AnimationController _pulseController;

//   // ─── Animations ────────────────────────────────────────────────
//   late Animation<double> _bgFade;
//   late Animation<double> _headerFade;
//   late Animation<Offset> _headerSlide;
//   late Animation<double> _formSlide;
//   late Animation<double> _formFade;
//   late Animation<double> _shimmer;
//   late Animation<double> _pulse;

//   // ─── Form State ────────────────────────────────────────────────
//   bool _obscurePassword = true;
//   bool _buttonPressed = false;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _namController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _initControllers();
//     _initAnimations();
//     _startSequence();
//   }

//   void _initControllers() {
//     _bgController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 900),
//     );
//     _headerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 850),
//     );
//     _formController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     );
//     _particleController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     )..repeat();
//     _shimmerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     )..repeat();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2200),
//     )..repeat(reverse: true);
//   }

//   void _initAnimations() {
//     _bgFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeIn));

//     _headerFade = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
//     );
//     _headerSlide = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
//         .animate(
//           CurvedAnimation(
//             parent: _headerController,
//             curve: Curves.easeOutCubic,
//           ),
//         );

//     _formSlide = Tween<double>(begin: 80, end: 0).animate(
//       CurvedAnimation(parent: _formController, curve: Curves.easeOutCubic),
//     );
//     _formFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _formController, curve: Curves.easeIn));

//     _shimmer = Tween<double>(begin: -2, end: 3).animate(
//       CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
//     );

//     _pulse = Tween<double>(begin: 0.96, end: 1.04).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );
//   }

//   Future<void> _startSequence() async {
//     await Future.delayed(const Duration(milliseconds: 100));
//     _bgController.forward();
//     await Future.delayed(const Duration(milliseconds: 300));
//     _headerController.forward();
//     await Future.delayed(const Duration(milliseconds: 400));
//     _formController.forward();
//   }

//   @override
//   void dispose() {
//     _bgController.dispose();
//     _headerController.dispose();
//     _formController.dispose();
//     _particleController.dispose();
//     _shimmerController.dispose();
//     _pulseController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _namController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFF060D1F),
//       resizeToAvoidBottomInset: true,
//       body: Stack(
//         children: [
//           // ── 1. Background Image ──────────────────────────────────
//           FadeTransition(
//             opacity: _bgFade,
//             child: SizedBox(
//               width: size.width,
//               height: size.height * 0.52,
//               child: Image.asset("assets/si.png", fit: BoxFit.cover),
//             ),
//           ),

//           // ── 2. Top gradient overlay ──────────────────────────────
//           Container(
//             width: size.width,
//             height: size.height * 0.55,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xBB060D1F),
//                   Color(0x44060D1F),
//                   Color(0xEE060D1F),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 stops: [0.0, 0.4, 1.0],
//               ),
//             ),
//           ),

//           // ── 3. Particles ─────────────────────────────────────────
//           AnimatedBuilder(
//             animation: _particleController,
//             builder: (context, _) => CustomPaint(
//               size: Size(size.width, size.height * 0.5),
//               painter: _ParticlePainter(_particleController.value),
//             ),
//           ),

//           // ── 4. Top glow ───────────────────────────────────────────
//           Positioned(
//             top: -80,
//             left: -60,
//             right: -60,
//             child: Container(
//               height: 240,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(200),
//                   bottomRight: Radius.circular(200),
//                 ),
//                 gradient: RadialGradient(
//                   center: Alignment.topCenter,
//                   radius: 0.9,
//                   colors: [
//                     const Color(0xFF00C8E8).withOpacity(0.25),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ── 5. Scrollable content ─────────────────────────────────
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 // Header section
//                 SlideTransition(
//                   position: _headerSlide,
//                   child: FadeTransition(
//                     opacity: _headerFade,
//                     child: _buildHeader(size),
//                   ),
//                 ),

//                 // Form card
//                 AnimatedBuilder(
//                   animation: _formController,
//                   builder: (context, child) {
//                     return Transform.translate(
//                       offset: Offset(0, _formSlide.value),
//                       child: Opacity(opacity: _formFade.value, child: child),
//                     );
//                   },
//                   child: _buildFormCard(context, size),
//                 ),

//                 SizedBox(height: 30.h),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(Size size) {
//     return SizedBox(
//       width: size.width,
//       child: Padding(
//         padding: EdgeInsets.only(top: 70.h, left: 24.w, right: 24.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Back button
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 width: 40.w,
//                 height: 40.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.1),
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.2),
//                     width: 1,
//                   ),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   color: Colors.white,
//                   size: 16,
//                 ),
//               ),
//             ),

//             SizedBox(height: 28.h),

//             // Logo with shimmer
//             AnimatedBuilder(
//               animation: _shimmerController,
//               builder: (context, child) {
//                 return ShaderMask(
//                   shaderCallback: (bounds) {
//                     return LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: const [
//                         Colors.white,
//                         Color(0xFF00C8E8),
//                         Colors.white,
//                       ],
//                       stops: [
//                         (_shimmer.value - 0.6).clamp(0.0, 1.0),
//                         _shimmer.value.clamp(0.0, 1.0),
//                         (_shimmer.value + 0.6).clamp(0.0, 1.0),
//                       ],
//                     ).createShader(bounds);
//                   },
//                   blendMode: BlendMode.srcIn,
//                   child: child,
//                 );
//               },
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Siha",
//                       style: GoogleFonts.poppins(
//                         fontSize: 36.sp,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                         letterSpacing: -1.5,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Health",
//                       style: GoogleFonts.poppins(
//                         fontSize: 36.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: -1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: 14.h),

//             Text(
//               "Enhance your approach\nto patient health.",
//               style: GoogleFonts.poppins(
//                 fontSize: 26.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//                 letterSpacing: -0.8,
//                 height: 1.2,
//               ),
//             ),

//             SizedBox(height: 10.h),

//             Text(
//               "Enter your details to get started",
//               style: GoogleFonts.poppins(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white.withOpacity(0.55),
//               ),
//             ),

//             SizedBox(height: 30.h),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFormCard(BuildContext context, Size size) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32.r),
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF0E1A35).withOpacity(0.97),
//             const Color(0xFF081020).withOpacity(0.99),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         border: Border.all(
//           color: const Color(0xFF00C8E8).withOpacity(0.18),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF00C8E8).withOpacity(0.07),
//             blurRadius: 40,
//             spreadRadius: 2,
//             offset: const Offset(0, -6),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.5),
//             blurRadius: 30,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(32.r),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Pill handle
//                 Center(
//                   child: Container(
//                     width: 40.w,
//                     height: 4.h,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF00C8E8).withOpacity(0.25),
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 22.h),

//                 // Title row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Create Account",
//                           style: GoogleFonts.poppins(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                             letterSpacing: -0.5,
//                           ),
//                         ),
//                         Text(
//                           "Doctor Dashboard",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF00C8E8).withOpacity(0.7),
//                             letterSpacing: 1.5,
//                           ),
//                         ),
//                       ],
//                     ),
//                     AnimatedBuilder(
//                       animation: _pulseController,
//                       builder: (context, child) {
//                         return Transform.scale(
//                           scale: _pulse.value,
//                           child: Container(
//                             width: 46.w,
//                             height: 46.w,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: const Color(0xFF067594).withOpacity(0.15),
//                               border: Border.all(
//                                 color: const Color(
//                                   0xFF00C8E8,
//                                 ).withOpacity(0.35),
//                                 width: 1.5,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: const Color(
//                                     0xFF00C8E8,
//                                   ).withOpacity(0.2),
//                                   blurRadius: 16,
//                                   spreadRadius: 2,
//                                 ),
//                               ],
//                             ),
//                             child: Icon(
//                               Icons.medical_services_rounded,
//                               color: const Color(0xFF00C8E8),
//                               size: 20.sp,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 28.h),

//                 // ── Full Name Field ──────────────────────────────
//                 _FieldLabel(label: "FULL NAME"),
//                 SizedBox(height: 8.h),
//                 _StyledTextField(
//                   controller: _namController,
//                   hint: "Dr. John Smith",
//                   icon: Icons.person_outline_rounded,
//                 ),

//                 SizedBox(height: 20.h),

//                 // ── Email Field ──────────────────────────────────
//                 _FieldLabel(label: "EMAIL ADDRESS"),
//                 SizedBox(height: 8.h),
//                 _StyledTextField(
//                   controller: _emailController,
//                   hint: "doctor@example.com",
//                   icon: Icons.email_outlined,
//                   keyboardType: TextInputType.emailAddress,
//                 ),

//                 SizedBox(height: 20.h),

//                 // ── Password Field ───────────────────────────────
//                 _FieldLabel(label: "PASSWORD"),
//                 SizedBox(height: 8.h),
//                 _StyledTextField(
//                   controller: _passwordController,
//                   hint: "Min. 8 characters",
//                   icon: Icons.lock_outline_rounded,
//                   obscure: _obscurePassword,
//                   suffixIcon: GestureDetector(
//                     onTap: () =>
//                         setState(() => _obscurePassword = !_obscurePassword),
//                     child: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off_outlined
//                           : Icons.visibility_outlined,
//                       color: Colors.white38,
//                       size: 18,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 10.h),

//                 // Forgot password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Forgot Password?",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12.sp,
//                       color: const Color(0xFF00C8E8).withOpacity(0.7),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 28.h),

//                 // ── Sign Up Button ───────────────────────────────
//                 GestureDetector(
//                   onTapDown: (_) => setState(() => _buttonPressed = true),
//                   onTapUp: (_) {
//                     setState(() => _buttonPressed = false);
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(builder: (context) => DVerifyScreen()),
//                     );
//                   },
//                   onTapCancel: () => setState(() => _buttonPressed = false),
//                   child: AnimatedScale(
//                     scale: _buttonPressed ? 0.96 : 1.0,
//                     duration: const Duration(milliseconds: 110),
//                     child: Container(
//                       width: double.infinity,
//                       height: 54.h,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.r),
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFF067594), Color(0xFF00C8E8)],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF00C8E8).withOpacity(0.35),
//                             blurRadius: 22,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Create Account",
//                             style: GoogleFonts.poppins(
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                               letterSpacing: 0.3,
//                             ),
//                           ),
//                           SizedBox(width: 8.w),
//                           const Icon(
//                             Icons.arrow_forward_rounded,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20.h),

//                 // Divider with OR
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white.withOpacity(0.1),
//                         height: 1,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 12.w),
//                       child: Text(
//                         "OR",
//                         style: GoogleFonts.poppins(
//                           fontSize: 11.sp,
//                           color: Colors.white24,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1.5,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white.withOpacity(0.1),
//                         height: 1,
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 20.h),

//                 // Sign in with Google (UI only)
//                 Container(
//                   width: double.infinity,
//                   height: 50.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14.r),
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.12),
//                       width: 1,
//                     ),
//                     color: Colors.white.withOpacity(0.05),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.g_mobiledata_rounded,
//                         color: Colors.white54,
//                         size: 22.sp,
//                       ),
//                       SizedBox(width: 8.w),
//                       Text(
//                         "Continue with Google",
//                         style: GoogleFonts.poppins(
//                           fontSize: 13.sp,
//                           color: Colors.white54,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24.h),

//                 // Already have account
//                 Center(
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Already have an account? ",
//                           style: GoogleFonts.poppins(
//                             fontSize: 13.sp,
//                             color: Colors.white.withOpacity(0.4),
//                           ),
//                         ),
//                         WidgetSpan(
//                           child: GestureDetector(
//                             onTap: () {
//                               // Navigate to Login
//                             },
//                             child: Text(
//                               "Sign In",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFF00C8E8),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Field Label ─────────────────────────────────────────────────────────────
// class _FieldLabel extends StatelessWidget {
//   final String label;
//   const _FieldLabel({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: GoogleFonts.poppins(
//         fontSize: 11.sp,
//         fontWeight: FontWeight.w600,
//         color: Colors.white38,
//         letterSpacing: 2,
//       ),
//     );
//   }
// }

// // ─── Styled TextField ─────────────────────────────────────────────────────────
// class _StyledTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hint;
//   final IconData icon;
//   final bool obscure;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;

//   const _StyledTextField({
//     required this.controller,
//     required this.hint,
//     required this.icon,
//     this.obscure = false,
//     this.suffixIcon,
//     this.keyboardType,
//   });

//   @override
//   State<_StyledTextField> createState() => _StyledTextFieldState();
// }

// class _StyledTextFieldState extends State<_StyledTextField> {
//   bool _focused = false;

//   @override
//   Widget build(BuildContext context) {
//     return Focus(
//       onFocusChange: (f) => setState(() => _focused = f),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 220),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14.r),
//           color: Colors.white.withOpacity(0.06),
//           border: Border.all(
//             color: _focused
//                 ? const Color(0xFF00C8E8).withOpacity(0.55)
//                 : Colors.white.withOpacity(0.1),
//             width: _focused ? 1.5 : 1,
//           ),
//           boxShadow: _focused
//               ? [
//                   BoxShadow(
//                     color: const Color(0xFF00C8E8).withOpacity(0.12),
//                     blurRadius: 14,
//                     spreadRadius: 1,
//                   ),
//                 ]
//               : [],
//         ),
//         child: TextFormField(
//           controller: widget.controller,
//           obscureText: widget.obscure,
//           keyboardType: widget.keyboardType,
//           style: GoogleFonts.poppins(
//             fontSize: 14.sp,
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: 16.h,
//             ),
//             border: InputBorder.none,
//             hintText: widget.hint,
//             hintStyle: GoogleFonts.poppins(
//               fontSize: 14.sp,
//               color: Colors.white24,
//             ),
//             prefixIcon: Icon(
//               widget.icon,
//               color: _focused
//                   ? const Color(0xFF00C8E8).withOpacity(0.8)
//                   : Colors.white24,
//               size: 18,
//             ),
//             suffixIcon: widget.suffixIcon != null
//                 ? Padding(
//                     padding: EdgeInsets.only(right: 14.w),
//                     child: widget.suffixIcon,
//                   )
//                 : null,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Particle Painter ─────────────────────────────────────────────────────────
// class _ParticlePainter extends CustomPainter {
//   final double progress;
//   _ParticlePainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rng = Random(77);
//     final paint = Paint()..style = PaintingStyle.fill;

//     for (int i = 0; i < 25; i++) {
//       final baseX = rng.nextDouble() * size.width;
//       final baseY = rng.nextDouble() * size.height;
//       final dy =
//           ((baseY - progress * size.height * 0.7) % size.height + size.height) %
//           size.height;
//       final opacity = (sin((progress * 2 * pi) + i) * 0.5 + 0.5) * 0.35;
//       final radius = rng.nextDouble() * 1.8 + 0.4;
//       paint.color = const Color(0xFF00C8E8).withOpacity(opacity);
//       canvas.drawCircle(Offset(baseX, dy), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
// }
