import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DAppointment.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DManage.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DSetting.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/PatientDetail.screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DHomeScreen extends StatefulWidget {
  const DHomeScreen({super.key});

  @override
  State<DHomeScreen> createState() => _DHomeScreenState();
}

class _DHomeScreenState extends State<DHomeScreen> {
  final PageController controller = PageController();
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/homebg.png",
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/d2.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Dr. Sharma!",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "Check your appointments!",
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(178, 255, 255, 255),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            right: BorderSide(color: Colors.white, width: 1.w),
                            top: BorderSide(color: Colors.white, width: 1.w),
                          ),
                        ),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            right: BorderSide(color: Colors.white, width: 1.w),
                            top: BorderSide(color: Colors.white, width: 1.w),
                          ),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today’s Appointment",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "You have 4 new appointment today!",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0BABF),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      _activeChip(),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 185.h,
                    //color: Colors.amber,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w, right: 20.w),
                              padding: EdgeInsets.only(
                                left: 15.w,
                                top: 15.h,
                                right: 15.h,
                                //bottom: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color(0xFF01061D),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 80.w,
                                        height: 80.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          child: Image.asset(
                                            "assets/checkup.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                  left: 6.w,
                                                  right: 8.w,
                                                  top: 5.h,
                                                  bottom: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                  color: Color(0xFF163538),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time_filled,
                                                      color: Color(0xFF7DFFB4),
                                                      size: 20.sp,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      "28 June 2025",
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                              0xFF7DFFB4,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 8.w,
                                                ),
                                                padding: EdgeInsets.only(
                                                  left: 6.w,
                                                  right: 8.w,
                                                  top: 5.h,
                                                  bottom: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                  color: Color(0xFF182A4A),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/Appointments.png",
                                                      width: 20.w,
                                                      height: 20.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      "04:00 PM",
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                              0xFF76BDFF,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            "Routine Check-up (or) Chest Pain",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              letterSpacing: -0.4,
                                            ),
                                          ),
                                          Text(
                                            "Rajesh Kumar   |   42",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF999BA5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          minimumSize: Size(175.w, 36.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFF76BDFF),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "View Details",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF76BDFF),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          minimumSize: Size(175.w, 36.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFFC11307),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Cancel Appointment",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
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
                          ],
                        );
                      },
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: ExpandingDotsEffect(
                        dotHeight: 6,
                        dotWidth: 6,
                        expansionFactor: 3,
                        spacing: 8,
                        dotColor: Color(0xFF1D627C),
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w),
                    child: Text(
                      "Quick Actions",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DManageScreen(),
                            ),
                          );
                        },
                        child: nameBuild(
                          "assets/ava.png",
                          "Manage Availability",
                        ),
                      ),
                      Spacer(),
                      nameBuild("assets/review.png", "Your Appointments"),
                      Spacer(),
                      nameBuild("assets/Appointments.png", "Your Appointments"),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 30.w),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    width: 400.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border(
                        top: BorderSide(color: Colors.white, width: 1.w),
                        right: BorderSide(color: Colors.white, width: 1.w),
                      ),
                      color: Color(0xFF0A4D80),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab = 0;
                              });
                            },
                            child: Container(
                              width: 195.w,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: tab == 0
                                    ? Color(0xFF067594)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Upcoming appointment",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab = 1;
                              });
                            },
                            child: Container(
                              width: 195.w,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: tab == 1
                                    ? Color(0xFF067594)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Past appointment",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GridView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 190 / 191,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => PatientDetailScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 190.w,
                                height: 120.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/g1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.h),
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 8.w,
                                top: 5.h,
                                bottom: 5.h,
                              ),
                              width: 150.w,
                              // height: 18.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: Color(0xFF163538),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Color(0xFF7DFFB4),
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "5 Aug 2025, 10:30 AM",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7DFFB4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "Routine Check-up or Fever",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.4,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "Rajesh Kumar (42M)",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(153, 240, 243, 245),
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.r),
        color: Color.fromARGB(25, 255, 255, 255),
        border: Border(
          top: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 4, backgroundColor: Color(0xFF00E426)),
          SizedBox(width: 5.w),
          Text(
            "Active",
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18.sp),
        ],
      ),
    );
  }

  Widget nameBuild(String image, String name) {
    return Container(
      width: 127.w,
      height: 97.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFF0E1329),
        border: Border(
          top: BorderSide(color: Colors.white, width: 1.w),
          right: BorderSide(color: Colors.white, width: 1.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 6.h),
          Text(
            textAlign: TextAlign.center,
            name,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////
class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int selectedIndex = 0;

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.calendar_today_outlined,
    Icons.person_outline_rounded, // You can replace this with a drop icon
    Icons.settings,
  ];

  List<String> labels = ['Home', 'Appointments', 'Manage Health', 'Setting'];

  final List<Widget> pages = [
    DHomeScreen(), // index 0
    DAppointmentScreen(), // index 1
    DManageScreen(), // index 2
    DSettingScreen(),
  ];

  Future<bool> _onWillPop() async {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFF0E1329), // Dark background
        body: pages[selectedIndex], // Show different page here
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: Color(0xFF01061D),
            borderRadius: BorderRadius.circular(40.r),
            border: Border(
              top: BorderSide(color: Colors.white38),
              right: BorderSide(color: Colors.white38),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: isSelected ? 12.w : 0,
                  //   vertical: 8.h,
                  // ),
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF067594) : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        color: isSelected ? Colors.white : Color(0xFFB0BABF),
                        size: 24.sp,
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 8.w),
                        Text(
                          labels[index],
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 3.w),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
