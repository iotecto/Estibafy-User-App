import 'dart:developer';

import 'package:estibafy_user/Controller/map_controller.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../google maps/google_maps/map_location_picker.dart';
import '../../google maps/google_maps/src/map_location_picker.dart';
import '../drawer.dart';
import 'book_helpers_data_collection.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find(tag: K.userControllerTag);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBar('Book Helpers', _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 50.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              width: double.infinity,
              color: K.secondaryColor,
              child: Text('Good Morning ${_userController.user.value.name}'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.718,
              child: googleMapLocationPicker(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget googleMapLocationPicker(BuildContext context) {
  return MapLocationPicker(
    showMoreOptions: false,
    desiredAccuracy: LocationAccuracy.best,
    minMaxZoomPreference: const MinMaxZoomPreference(8, 30),
    bottomCardColor: K.primaryColor,
    bottomCardIcon: Icon(
      Icons.navigate_next_outlined,
      color: K.secondaryColor,
    ),
    searchHintText: 'Search or Pick Location',
    apiKey: K.googleMapApiKey,
    showBackButton: false,
    compassEnabled: true,
    canPopOnNextButtonTaped: true,
    onNext: (LatLng? result, GeocodingResult? address) {
      log(result!.latitude.toString());
      log(result.longitude.toString());
      MpController mpController = Get.put(MpController());
      mpController.setMapLocation(result.latitude, result.longitude,
          address!.formattedAddress.toString(), true);
      pushNewScreen(
        context,
        screen: const BookHelpersDataCollection(),
        withNavBar: true,
      );
    },
    onSuggestionSelected: (PlacesDetailsResponse? result) {
      if (result != null) {}
    },
  );
}
