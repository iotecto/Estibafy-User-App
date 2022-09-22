import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/widgets/booking_inprogress_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var listData;
    if (inProgress == 'in-progress') {
      listData =
          List<dynamic>.from(data.map((x) => Pending.fromMap(x)).toList());
    } else {
      listData = data.map((x) => Pending.fromMap(x)).toList();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        //   // child: Text(
        //   //   'Nov 7, 2021 @ 8:00 AM',
        //   //   style: K.textStyle2,
        //   // ),
        // ),
        Expanded(
          child: (listData.isNotEmpty)
              ? ListView.builder(
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
        ),
      ],
    );
  }
}
