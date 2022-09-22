import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:estibafy_user/Views/pages/drawer.dart';
import 'package:estibafy_user/models/Classes/Booking/booking_inprogress.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final bool isBackButton;

  const Booking({Key? key, required this.isBackButton}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int cupertinoTabBarIIIValue = 0;
  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;
  bool isLoaded = false;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  getJobs() async {
    if (isLoaded) {
      setState(() {
        data = null;
        isLoaded = false;
      });
    }

    WebAPIs.getJobs().then((value) {
      setState(() {
        data = value;
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isBackButton == false
          ? getAppBar('Booking', _scaffoldKey, actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundColor: K.secondaryColor,
                  radius: 18,
                  child: IconButton(
                      onPressed: () {
                        getJobs();
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: K.darkBlue,
                        size: 20,
                      )),
                ),
              ),
            ])
          : getAppBar2('Booking', _scaffoldKey, context),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: K.sixthColor, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CupertinoTabBar.CupertinoTabBar(
                    Colors.transparent,
                    K.primaryColor,
                    [
                      Text(
                        "Pending",
                        style: K.textStyle2.copyWith(
                            color: cupertinoTabBarIIIValue == 0
                                ? K.secondaryColor
                                : K.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "In Progress",
                        style: K.textStyle2.copyWith(
                            color: cupertinoTabBarIIIValue == 1
                                ? K.secondaryColor
                                : K.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Completed",
                        style: K.textStyle2.copyWith(color: K.fifthColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Cancelled",
                        style: K.textStyle2.copyWith(color: K.thirteenColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    cupertinoTabBarIIIValueGetter,
                    (int index) {
                      setState(() {
                        cupertinoTabBarIIIValue = index;
                      });
                    },
                    useShadow: false,
                    allowExpand: true,
                    useSeparators: false,
                    innerVerticalPadding: 14,
                    innerHorizontalPadding: 15,
                    outerHorizontalPadding: 15,
                    outerVerticalPadding: 12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Job Schedule',
                style: K.textStyle3.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: !isLoaded
                    ? const Center(child: CircularProgressIndicator())
                    : data == null
                        ? const Center(child: Text('No Jobs Found'))
                        : cupertinoTabBarIIIValue == 0
                            ? BookingInProgress(
                                data: data!['data']['pending'],
                                inProgress: '',
                                status: cupertinoTabBarIIIValue,
                              )
                            : cupertinoTabBarIIIValue == 1
                                ? BookingInProgress(
                                    data: data!['data']?['inprogress'] ?? [],
                                    inProgress: 'in-progress',
                                    status: cupertinoTabBarIIIValue,
                                  )
                                : cupertinoTabBarIIIValue == 2
                                    ? BookingInProgress(
                                        data: data!['data']['complete'] ?? [],
                                        inProgress: '',
                                        status: cupertinoTabBarIIIValue,
                                      )
                                    : BookingInProgress(
                                        data: data!['data']['canceled'] ?? [],
                                        inProgress: '',
                                        status: cupertinoTabBarIIIValue,
                                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
