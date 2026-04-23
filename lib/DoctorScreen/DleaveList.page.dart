import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DAddLeave.page.dart';
import 'package:siha_health_doctor_side/data/Controller/leaveDeleteController.dart';
import 'package:siha_health_doctor_side/data/Controller/myLeaveController.dart';

class DLeaveListPage extends ConsumerStatefulWidget {
  const DLeaveListPage({super.key});

  @override
  ConsumerState<DLeaveListPage> createState() => _DLeaveListPageState();
}

class _DLeaveListPageState extends ConsumerState<DLeaveListPage> {
  @override
  Widget build(BuildContext context) {
    final leaveState = ref.watch(myLeaveListController);

    return Scaffold(
      body: Stack(
        children: [
          /// Background same as profile
          Image.asset(
            "assets/homebg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Leave List",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                /// List
                Expanded(
                  child: leaveState.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.data?.length,
                        itemBuilder: (context, index) {
                          final item = data.data?[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(18.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// 🔹 Top Row (Avatar + Name + Status)
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22.r,
                                      backgroundColor: Color(0xFF067594),
                                      child: Text(
                                        (item?.doctor?.fullName ?? "D")[0],
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10.w),

                                    /// Name + Specialty
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item?.doctor?.fullName ?? 'N/A',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            item?.doctor?.specialty ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// Status Badge
                                    Row(
                                      children: [
                                        /// Doctor Status
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                (item?.doctor?.status ==
                                                    "active")
                                                ? Colors.green.withOpacity(0.2)
                                                : Colors.red.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: Text(
                                            item?.doctor?.status ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  (item?.doctor?.status ==
                                                      "active")
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 6.w),

                                        /// ✅ Approval Status
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                (item?.doctor?.approvals ==
                                                    "Approved")
                                                ? Colors.blue.withOpacity(0.2)
                                                : Colors.orange.withOpacity(
                                                    0.2,
                                                  ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: Text(
                                            item?.doctor?.approvals ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  (item?.doctor?.approvals ==
                                                      "Approved")
                                                  ? Colors.blue
                                                  : Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12.h),

                                Divider(color: Colors.grey.shade300),

                                SizedBox(height: 10.h),

                                /// 🔹 Reason
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 18.sp,
                                      color: Color(0xFF067594),
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        item?.reason ?? "",
                                        style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12.h),

                                /// 🔹 Dates Label
                                Text(
                                  "Leave Dates",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),

                                SizedBox(height: 8.h),

                                /// 🔹 Dates Chips
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: (item?.leaveDates ?? [])
                                      .map<Widget>((date) {
                                        final formattedDate =
                                            DateFormat('dd MMM yyyy').format(
                                              DateTime.parse(date.toString()),
                                            );
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF067594),
                                                Color(0xFF0A8FB5),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: Text(
                                            formattedDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      })
                                      .toList(),
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) => DAddLeavePage(
                                              doctorId: item!.doctorId!.toInt(),
                                              id: item.id.toString(),
                                              existingDates:
                                                  (item.leaveDates ?? [])
                                                      .map((e) => e.toString())
                                                      .toList(),
                                              reason: item.reason,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              size: 14.sp,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "Edit",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10.w),

                                    InkWell(
                                      onTap: () {
                                        showDeleteDialog(context, item?.id);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              size: 14.sp,
                                              color: Colors.red,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "Delete",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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
                    loading: () => Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDeleteDialog(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final deleteState = ref.watch(leaveDeleteProvider);
            final isLoading = deleteState.isLoading;

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              title: Text(
                "Delete Leave",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              /// 🔥 Content
              content: isLoading
                  ? Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 10.w),
                        Text("Deleting...", style: GoogleFonts.poppins()),
                      ],
                    )
                  : Text(
                      "Are you sure you want to delete this leave?",
                      style: GoogleFonts.poppins(),
                    ),

              /// 🔥 Actions
              actions: isLoading
                  ? []
                  : [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await ref
                              .read(leaveDeleteProvider.notifier)
                              .deleteLeave(id: id.toString(), context: context);
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
            );
          },
        );
      },
    );
  }
}
