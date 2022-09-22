import 'package:estibafy_user/models/Classes/Booking%20Models/booking_schedule_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/booking_schedule_widget.dart';

import 'package:flutter/material.dart';

class BookingSchedule extends StatelessWidget {
  const BookingSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Text(
              'Nov 6, 2021 @ 8:00 AM',
              style: K.textStyle2,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: BookingsScheduleList.list.length,
            itemBuilder: (BuildContext context, int index) =>
                BuildBookingScheduleCard(
              context: context,
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
