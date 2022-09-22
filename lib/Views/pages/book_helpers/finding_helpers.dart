import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controller/Tab Controller/book_helper_data_controller.dart';
import '../drawer.dart';
import '../navigationbar.dart';

class FindingHelpers extends StatefulWidget {
  const FindingHelpers({Key? key, required this.orderID}) : super(key: key);

  final int orderID;

  @override
  State<FindingHelpers> createState() => _FindingHelpersState();
}

class _FindingHelpersState extends State<FindingHelpers> {
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.put(BookHelperDataCollectionController(),
          tag: K.bookHelperControllerTag);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Finding Helpers', _scaffoldKey, context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: K.primaryColor,
              ),
              margin: const EdgeInsets.only(top: 60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Icon(
                      FontAwesomeIcons.checkCircle,
                      color: K.fifthColor,
                      size: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your confirmation number is:',
                      style: K.textStyle4,
                    ),
                    Text(
                      'Order #${widget.orderID}',
                      style: K.textStyle4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'You will see your helpers on the next',
                      style: K.textStyle4,
                    ),
                    Text(
                      'screen or anytime from the menu.',
                      style: K.textStyle4,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                        onPressed: () {
                          bookHelperCollectionController.jobNameController
                              .clear();
                          bookHelperCollectionController.containerId = 0;
                          bookHelperCollectionController.checkedValuesList
                              .clear();
                          bookHelperCollectionController.startDateController
                              .clear();
                          bookHelperCollectionController.startTimeController
                              .clear();
                          bookHelperCollectionController.endDateController
                              .clear();
                          bookHelperCollectionController.endTimeController
                              .clear();

                          Get.offAll(const NavBar());
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          side: BorderSide(color: K.secondaryColor),
                        )),
                        child: Text(
                          'Done',
                          style: K.textStyle3.copyWith(
                              color: K.secondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
