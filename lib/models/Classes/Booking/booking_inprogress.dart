import 'package:estibafy_user/models/booking_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/booking_inprogress_widget.dart';

class BookingInProgress extends StatelessWidget {
  const BookingInProgress(
      {Key? key,
      required this.data,
      required this.status,
      required this.inProgress})
      : super(key: key);

  final List data;
  final String inProgress;
  final int status;

  Widget build(BuildContext context) {
    var listData;
    if (inProgress == 'in-progress') {
      listData = List<dynamic>.from(
          data.reversed.map((x) => Pending.fromMap(x)).toList());
    } else {
      listData = data.reversed.map((x) => Pending.fromMap(x)).toList();
    }
    return Scaffold(
      body: (listData.isNotEmpty)
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              physics: const BouncingScrollPhysics(),
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                if (listData[index] != null) {
                  return BuildBookingInProgressCard(
                    context: context,
                    job: listData[index],
                    status: status,
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          : const Center(
              child: Text("No booking available"),
            ),
    );
  }
}
