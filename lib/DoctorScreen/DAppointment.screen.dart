import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DAppointmentScreen extends StatefulWidget {
  const DAppointmentScreen({super.key});

  @override
  State<DAppointmentScreen> createState() => _DAppointmentScreenState();
}

class _DAppointmentScreenState extends State<DAppointmentScreen> {
  List<Map<String, dynamic>> hospitalList = [
    {
      "image": "assets/checkup.png",
      "reting": "4.2/5",
      "name": "Banadir General Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$15–\$40",
    },
    {
      "image": "assets/h2.png",

      "reting": "4.5/5",
      "name": "Nairobi West Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h3.png",

      "reting": "4.3/5",
      "name": "Mulago National Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h4.png",

      "reting": "4.6/5",
      "name": "Addis Ababa Medical Center",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h6.png",

      "reting": "4.1/5",
      "name": "Dakar General Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h7.png",

      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h8.png",

      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h2.png",

      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
  ];

  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    // IconButton(
                    //   style: IconButton.styleFrom(
                    //     padding: EdgeInsets.zero,
                    //     minimumSize: Size(0, 0),
                    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    // ),
                    //SizedBox(width: 10.w),
                    Text(
                      "All Appointments",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 20.h),
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
                    padding: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
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
                                  : Color(0x66067594),
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Upcoming appointment ",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
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
                                  : Color(0x66067594),
                              border: Border(
                                top: BorderSide(
                                  color: tab == 0
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Past appointment",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
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
                Expanded(
                  child: GridView.builder(
                    itemCount: 8,
                    padding: EdgeInsets.zero,
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
                            SizedBox(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
