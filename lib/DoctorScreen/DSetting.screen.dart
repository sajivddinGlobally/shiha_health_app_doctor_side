import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DEditProfile.page.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DleaveList.page.dart';
import 'package:siha_health_doctor_side/data/Controller/profileController.dart';

class DSettingScreen extends ConsumerStatefulWidget {
  const DSettingScreen({super.key});

  @override
  ConsumerState<DSettingScreen> createState() => _DSettingScreenState();
}

class _DSettingScreenState extends ConsumerState<DSettingScreen> {
  Future<void> showLogoutDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Are you sure you want to logout from your account?",
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileController);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: profileState.when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 400.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Image.asset(
                              "assets/ala.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 158.w,
                                    height: 158.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 4.w,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          // "assets/d2.png",
                                          data.profilePicture ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  width: 158.w,
                                                  height: 158.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white24,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 50.sp,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              },
                                          loadingBuilder:
                                              (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Container(
                                                  width: 158.w,
                                                  height: 158.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white24,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 1,
                                                        ),
                                                  ),
                                                );
                                              },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Center(
                                  child: Text(
                                    // "Dr. Mohan Sharma",
                                    data.fullName ?? "N/A",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFD7A800),
                                      size: 18.sp,
                                    ),
                                    Text(
                                      // "4.5 (25 reviews)",
                                      "${data.rating ?? ""} (25 reviews)",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(
                                          153,
                                          255,
                                          255,
                                          255,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Divider(
                                  color: Color(0xFF1A1F34),
                                  endIndent: 20,
                                  indent: 20,
                                ),
                                SizedBox(height: 20.h),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    left: 20.w,
                                    right: 20.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      settingBody(
                                        Icons.person_2_outlined,
                                        "Edit Profile",
                                        () {
                                          Navigator.push(
                                            context, // 👈 important
                                            CupertinoPageRoute(
                                              builder: (_) =>
                                                  const DEditProfilePage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.person_2_outlined,
                                        "My Leave",
                                        () {
                                          Navigator.push(
                                            context, // 👈 important
                                            CupertinoPageRoute(
                                              builder: (_) =>
                                                  const DLeaveListPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.description_outlined,
                                        "Professional Documents",
                                        () {},
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.credit_card,
                                        "Consultation Fee & Availability",
                                        () {},
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.notifications_none_outlined,
                                        "Notifications",
                                        () {},
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.insert_drive_file_outlined,
                                        "Privacy Settings",
                                        () {},
                                      ),
                                      SizedBox(height: 10.h),
                                      Divider(color: Color(0xFF1A1F34)),
                                      SizedBox(height: 20.h),
                                      settingBody(
                                        Icons.headphones,
                                        "Help & Support",
                                        () {},
                                      ),
                                      SizedBox(height: 30.h),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(400.w, 49.h),
                                          backgroundColor: Color(0xFF01061D),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFFC11307),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          showLogoutDialog();
                                        },
                                        child: Text(
                                          "Logout",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFC11307),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 100),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      error.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                loading: () => SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget settingBody(IconData icon, String name, VoidCallback callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: SizedBox(
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26.sp),
            SizedBox(width: 10.w),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -0.4,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 26.sp),
          ],
        ),
      ),
    );
  }
}
