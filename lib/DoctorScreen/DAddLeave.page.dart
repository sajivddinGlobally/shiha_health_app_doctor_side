import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siha_health_doctor_side/data/Controller/addLeaveController.dart';
import 'package:table_calendar/table_calendar.dart';

class DAddLeavePage extends ConsumerStatefulWidget {
  final int doctorId;
  const DAddLeavePage({super.key, required this.doctorId});

  @override
  ConsumerState<DAddLeavePage> createState() => _DAddLeavePageState();
}

class _DAddLeavePageState extends ConsumerState<DAddLeavePage> {
  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedDays = [];
  @override
  Widget build(BuildContext context) {
    final addLeaveState = ref.watch(addLeaveProvider);
    final isLoading = addLeaveState.isLoading;
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
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
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
                        "Add New Leave",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Colors.white30),
                  SizedBox(height: 15.h),
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: focusedDay,
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      weekendStyle: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      titleTextStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      weekendTextStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0E1228),
                      ),
                      outsideDaysVisible: false,
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0E1228),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF0E1228),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Color(0xFF067594),
                        shape: BoxShape.circle,
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return selectedDays.any(
                        (d) =>
                            d.year == day.year &&
                            d.month == day.month &&
                            d.day == day.day,
                      );
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (selectedDays.any(
                          (d) =>
                              d.year == selectedDay.year &&
                              d.month == selectedDay.month &&
                              d.day == selectedDay.day,
                        )) {
                          selectedDays.removeWhere(
                            (d) =>
                                d.year == selectedDay.year &&
                                d.month == selectedDay.month &&
                                d.day == selectedDay.day,
                          );
                        } else {
                          selectedDays.add(selectedDay);
                        }
                        this.focusedDay = focusedDay;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        this.focusedDay = focusedDay;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Divider(color: Colors.white24),
                  SizedBox(height: 15),
                  Text(
                    "Days Selected",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: selectedDays.length,
                      itemBuilder: (context, index) {
                        final day = selectedDays[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(12, 255, 255, 255),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat("MMM dd, yyyy").format(day),
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                  minimumSize: Size(25.w, 25.w),
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                icon: Icon(Icons.close, color: Colors.white54),
                                onPressed: () {
                                  setState(() {
                                    selectedDays.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400.w, 49.h),
                      backgroundColor: Color(0xFF01061D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Color(0xFF76BDFF)),
                      ),
                    ),
                    onPressed: () {
                      List<DateTime> convertedDates = selectedDays
                          .map((e) => DateTime.parse(e.toString()))
                          .toList();
                      ref
                          .read(addLeaveProvider.notifier)
                          .addDoctorLeave(
                            doctorId: widget.doctorId,
                            leaveDates: selectedDays,
                            reason: "reason",
                            context: context,
                          );
                    },
                    child: isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            "Mark as leave",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF76BDFF),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
