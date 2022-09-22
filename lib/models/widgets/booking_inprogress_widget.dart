import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Views/pages/bookings/booking_details.dart';

class BuildBookingInProgressCard extends StatefulWidget {
  final BuildContext context;
  final Pending job;
  final int status;

  const BuildBookingInProgressCard({
    Key? key,
    required this.context,
    required this.job,
    required this.status,
  }) : super(key: key);

  @override
  _BuildBookingInProgressCardState createState() =>
      _BuildBookingInProgressCardState();
}

class _BuildBookingInProgressCardState
    extends State<BuildBookingInProgressCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return buildBookingInProgress(widget.context, widget.job);
  }

  buildBookingInProgress(BuildContext context, Pending job) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFC2C2C2)),
          borderRadius: BorderRadius.circular(10),
          color: K.secondaryColor),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(6.0),
        iconColor: K.fourthColor,
        collapsedIconColor: K.fourthColor,
        maintainState: isExpanded,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        title: Column(
          children: [
            Text(
              'Order # ${job.id}',
              style: K.textStyle5
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10.0,
            ),
            isExpanded
                ? Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: K.textStyle2,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: K.secondaryColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    (CupertinoIcons.location_solid),
                                    color: K.primaryColor,
                                  ),
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        '${job.job!.address}',
                                        textAlign: TextAlign.center,
                                        //job.job!.address.toString(),
                                        style: K.textStyle2
                                            .copyWith(color: K.fourthColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Helpers',
                            style: K.textStyle2,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: K.secondaryColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    (FontAwesomeIcons.solidHandshake),
                                    color: K.primaryColor,
                                    size: 20,
                                  ),
                                  Container(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${job.totalHelpers}',
                                      style: K.textStyle1.copyWith(
                                          color: K.fourthColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.fileInvoice,
                          color: K.fourthColor,
                          size: 26,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            '${job.job!.address}',
                            textAlign: TextAlign.center,
                            //job.job!.address.toString(),
                            style: K.textStyle2.copyWith(color: K.fourthColor),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          thickness: 0.5,
                          width: 20,
                        ),
                        Text(
                          '\$ ${((double.parse(job.baseFare!) * job.totalHelpers!) + double.parse(job.taxRate!)).toStringAsFixed(2)}',
                          style: K.textStyle2.copyWith(
                              color: K.fourthColor,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Job Type',
                      style: K.textStyle2,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: K.secondaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              (FontAwesomeIcons.boxesStacked),
                              color: K.primaryColor,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${job.job!.container!.name} (${job.job!.container!.size})',
                                    textAlign: TextAlign.center,
                                    //job.job!.address.toString(),
                                    style: K.textStyle2.copyWith(
                                      color: K.fourthColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    '40 feet Container (0)',
                                    textAlign: TextAlign.center,
                                    //job.job!.address.toString(),
                                    style: K.textStyle2.copyWith(
                                        color: K.fourthColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Package Type',
                    style: K.textStyle2,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: K.secondaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            (CupertinoIcons.cube_box),
                            color: K.primaryColor,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Expanded(
                            child: Text(
                              '${job.job!.packageType}',
                              textAlign: TextAlign.center,
                              //job.job!.address.toString(),
                              style:
                                  K.textStyle2.copyWith(color: K.fourthColor),
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
          const SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule',
                    style: K.textStyle2,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: K.secondaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            (CupertinoIcons.calendar),
                            color: K.primaryColor,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Start:   ' +
                                      DateFormat('dd-MM-yyyy @' 'kk:mm a')
                                          .format(job.job!.endTime!),
                                  style: K.textStyle2.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'End:   ' +
                                      DateFormat('dd-MM-yyyy  @' 'kk:mm a')
                                          .format(job.job!.startTime!),
                                  style: K.textStyle2.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  'TOTAL',
                  style: K.textStyle2,
                ),
                Spacer(),
                Text(
                  '\$ ${((double.parse(job.baseFare!) * job.totalHelpers!) + double.parse(job.taxRate!)).toStringAsFixed(2)}',
                  style: K.textStyle2.copyWith(
                      color: K.fourthColor, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: '/bookingDetails'),
                  screen: BookingDetails(job: job, status: widget.status),
                  withNavBar: true,
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: K.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Track Helpers',
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: K.secondaryColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
