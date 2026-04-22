// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:siha_health_doctor_side/DoctorScreen/DSignUp.screen.dart';

// class DSplashScreen extends StatefulWidget {
//   const DSplashScreen({super.key});

//   @override
//   State<DSplashScreen> createState() => _DSplashScreenState();
// }

// class _DSplashScreenState extends State<DSplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0.h,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     color: Colors.white.withOpacity(
//                       0.4,
//                     ), // Optional dim overlay
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       child: Image.asset(
//                         // "assets/mp4/dna.gif",
//                         "assets/d.png",
//                         fit: BoxFit.cover,
//                         // ya BoxFit.contain
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ClipPath(
//               clipper: InwardCurveClipper(),
//               child: Container(
//                 height: 150.h,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.cyan, Colors.transparent],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 alignment: Alignment.center,
//               ),
//             ),
//             // Image.asset(
//             //   "assets/vectors/Vector.png",
//             //   width: MediaQuery.of(context).size.width,
//             //   height: 110.h,
//             //   fit: BoxFit.cover,
//             // ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Column(
//                 children: [
//                   SizedBox(height: 80),
//                   Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Siha",
//                           style: GoogleFonts.poppins(
//                             fontSize: 40.sp,
//                             fontWeight: FontWeight.w300,
//                             color: Color(0xFFFFFFFF),
//                             letterSpacing: -1,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "Health",
//                           style: GoogleFonts.poppins(
//                             fontSize: 40.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFFFFFFFF),
//                             letterSpacing: -1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 margin: EdgeInsets.only(
//                   bottom: 20.h,
//                 ), // kam kiya taaki overflow na ho
//                 padding: EdgeInsets.all(1.w), // Border thickness
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(0, 255, 255, 255),
//                       Color.fromARGB(255, 255, 255, 255),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.topRight,
//                   ),
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//                 child: Container(
//                   width:
//                       MediaQuery.of(context).size.width *
//                       0.9, // screen ke 90% width
//                   constraints: BoxConstraints(
//                     maxHeight:
//                         MediaQuery.of(context).size.height *
//                         0.38, // screen ke 38% se zyada nahi
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF0E1329),
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 25.w,
//                       vertical: 20.h,
//                     ),
//                     child: SingleChildScrollView(
//                       // content scrollable ho gaya
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Welcome to ",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 22.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "Siha Health",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 22.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                     letterSpacing: -1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 10.h),
//                           Text(
//                             "Effortlessly manage your patients from any location, at any time, ensuring that you have access to their information whenever you need it.",
//                             style: GoogleFonts.poppins(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                               letterSpacing: -0.4,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 20.h),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size(
//                                 MediaQuery.of(context).size.width *
//                                     0.75, // thoda chhota rakha
//                                 50.h,
//                               ),
//                               backgroundColor: Color(0xFF067594),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.r),
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 CupertinoPageRoute(
//                                   builder: (context) => DSignUpScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "Get Started",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                                 letterSpacing: -1,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InwardCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 50); // Start from bottom left

//     // Inward curve (bowl shape)
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height + 50, // control point (go inside)
//       size.width,
//       size.height - 50, // end point
//     );

//     path.lineTo(size.width, 0); // top right
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DSignIn.screen.dart';

class DSplashScreen extends StatefulWidget {
  const DSplashScreen({super.key});

  @override
  State<DSplashScreen> createState() => _DSplashScreenState();
}

class _DSplashScreenState extends State<DSplashScreen>
    with TickerProviderStateMixin {
  // ─── Controllers ───────────────────────────────────────────────
  late AnimationController _bgController;
  late AnimationController _logoController;
  late AnimationController _cardController;
  late AnimationController _pulseController;
  late AnimationController _particleController;
  late AnimationController _shimmerController;

  // ─── Animations ────────────────────────────────────────────────
  late Animation<double> _bgFade;
  late Animation<double> _logoFade;
  late Animation<Offset> _logoSlide;
  late Animation<double> _logoScale;
  late Animation<double> _cardSlide;
  late Animation<double> _cardFade;
  late Animation<double> _pulse;
  late Animation<double> _shimmer;
  late Animation<double> _buttonScale;

  bool _buttonPressed = false;

  @override
  void initState() {
    super.initState();
    _initControllers();
    _initAnimations();
    _startSequence();
  }

  void _initControllers() {
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  void _initAnimations() {
    _bgFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeIn));

    _logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));
    _logoSlide = Tween<Offset>(begin: const Offset(0, -0.4), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
        );
    _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _cardSlide = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _cardController, curve: Curves.easeOutCubic),
    );
    _cardFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeIn));

    _pulse = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _shimmer = Tween<double>(begin: -1.5, end: 2.5).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    _buttonScale = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeOut));
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _bgController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _cardController.forward();
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _cardController.dispose();
    _pulseController.dispose();
    _particleController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF060D1F),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            // ── 1. Background Image with fade-in ──────────────────
            FadeTransition(
              opacity: _bgFade,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset("assets/d.png", fit: BoxFit.cover),
              ),
            ),

            // ── 2. Dark gradient overlay ───────────────────────────
            Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xCC060D1F),
                    Color(0x88060D1F),
                    Color(0xDD060D1F),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),

            // ── 3. Floating particles ──────────────────────────────
            AnimatedBuilder(
              animation: _particleController,
              builder: (context, _) {
                return CustomPaint(
                  size: Size(size.width, size.height),
                  painter: _ParticlePainter(_particleController.value),
                );
              },
            ),

            // ── 4. Top glow arc ────────────────────────────────────
            Positioned(
              top: -60,
              left: -40,
              right: -40,
              child: FadeTransition(
                opacity: _bgFade,
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 0.9,
                      colors: [
                        const Color(0xFF00C8E8).withOpacity(0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── 5. Logo section ────────────────────────────────────
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: SlideTransition(
                  position: _logoSlide,
                  child: FadeTransition(
                    opacity: _logoFade,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Glowing Icon
                          AnimatedBuilder(
                            animation: _pulseController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulse.value,
                                child: Container(
                                  width: 72.w,
                                  height: 72.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(
                                      0xFF067594,
                                    ).withOpacity(0.15),
                                    border: Border.all(
                                      color: const Color(
                                        0xFF00C8E8,
                                      ).withOpacity(0.4),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(
                                          0xFF00C8E8,
                                        ).withOpacity(0.3),
                                        blurRadius: 24,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    color: const Color(0xFF00C8E8),
                                    size: 32.sp,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 16.h),

                          // App name with shimmer
                          AnimatedBuilder(
                            animation: _shimmerController,
                            builder: (context, child) {
                              return ShaderMask(
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Colors.white,
                                      Color(0xFF00C8E8),
                                      Colors.white,
                                    ],
                                    stops: [
                                      (_shimmer.value - 0.5).clamp(0.0, 1.0),
                                      _shimmer.value.clamp(0.0, 1.0),
                                      (_shimmer.value + 0.5).clamp(0.0, 1.0),
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcIn,
                                child: child,
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Siha",
                                    style: GoogleFonts.poppins(
                                      fontSize: 44.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      letterSpacing: -1.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Health",
                                    style: GoogleFonts.poppins(
                                      fontSize: 44.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: -1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 6.h),
                          // Tagline
                          Text(
                            "Doctor's Companion",
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF00C8E8).withOpacity(0.8),
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── 6. Bottom card ─────────────────────────────────────
            AnimatedBuilder(
              animation: _cardController,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.translate(
                    offset: Offset(0, _cardSlide.value * 300),
                    child: Opacity(opacity: _cardFade.value, child: child),
                  ),
                );
              },
              child: _buildBottomCard(context, size),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCard(BuildContext context, Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0E1A35).withOpacity(0.95),
            const Color(0xFF081020).withOpacity(0.98),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: const Color(0xFF00C8E8).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00C8E8).withOpacity(0.08),
            blurRadius: 40,
            spreadRadius: 2,
            offset: const Offset(0, -8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top divider pill
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C8E8).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 20.h),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome to ",
                        style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Siha Health",
                        style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF00C8E8),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 12.h),

                Text(
                  "Effortlessly manage your patients from any location, at any time — ensuring you have access to their information whenever you need it.",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: -0.3,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                  
                ),

                SizedBox(height: 24.h),

                // Get Started Button
                GestureDetector(
                  onTapDown: (_) => setState(() => _buttonPressed = true),
                  onTapUp: (_) {
                    setState(() => _buttonPressed = false);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => DSignInScreen()),
                    );
                  },
                  onTapCancel: () => setState(() => _buttonPressed = false),
                  child: AnimatedScale(
                    scale: _buttonPressed ? 0.95 : 1.0,
                    duration: const Duration(milliseconds: 120),
                    child: Container(
                      width: double.infinity,
                      height: 54.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF067594), Color(0xFF00C8E8)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00C8E8).withOpacity(0.35),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Feature Pill Widget ────────────────────────────────────────────────────
class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeaturePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xFF00C8E8).withOpacity(0.08),
        border: Border.all(
          color: const Color(0xFF00C8E8).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF00C8E8), size: 13),
          SizedBox(width: 5.w),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Particle Painter ───────────────────────────────────────────────────────
class _ParticlePainter extends CustomPainter {
  final double progress;

  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rng = Random(42);
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 30; i++) {
      final baseX = rng.nextDouble() * size.width;
      final baseY = rng.nextDouble() * size.height;

      // Particles float upward and wrap around
      final dy =
          ((baseY - progress * size.height * 0.6) % size.height + size.height) %
          size.height;

      final opacity = (sin((progress * 2 * pi) + i) * 0.5 + 0.5) * 0.4;
      final radius = rng.nextDouble() * 2 + 0.5;

      paint.color = const Color(0xFF00C8E8).withOpacity(opacity);
      canvas.drawCircle(Offset(baseX, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
}
