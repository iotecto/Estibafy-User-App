import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/Views/pages/bookings/booking.dart';
import 'package:estibafy_user/Views/pages/profile/profile.dart';
import 'package:estibafy_user/Views/pages/settings/settings_screen.dart';
import 'package:estibafy_user/Views/pages/tracking.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'helpers/helpers.dart';
import 'invoices/invoices.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find(tag: K.userControllerTag);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
            child: Container(
              color: K.secondaryColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, bottom: 5, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(const Profile(
                                          isBackButton: true,
                                        ));
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: K.primaryColor,
                                        child: Icon(Icons.person_outline),
                                        radius: 32,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Icon(
                                    //       Icons.star,
                                    //       color: K.ninthColor,
                                    //       size: 16,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 1.5,
                                    //     ),
                                    //     Text(
                                    //       '4.8',
                                    //       style: K.textStyle2,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 8,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(_userController.user.value.name,
                                        style: K.textStyle2.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: K.primaryColor)),
                                    Text(
                                      _userController.user.value.email,
                                      style: K.textStyle2
                                          .copyWith(color: K.primaryColor),
                                    ),
                                    Text(
                                      'Comandato',
                                      style: K.textStyle2
                                          .copyWith(color: K.primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   'Balance: \$500.00',
                                //   style: K.textStyle2
                                //       .copyWith(color: K.primaryColor),
                                // ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //         width: 35,
                                //         child: IconButton(
                                //             onPressed: () {},
                                //             icon: Icon(
                                //               Icons.add,
                                //               color: K.primaryColor,
                                //             ))),
                                //     Text(
                                //       'Add Balance',
                                //       style: K.textStyle2
                                //           .copyWith(color: K.primaryColor),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color: K.sixthColor.withOpacity(0.2),
                          ),
                          Tile(
                              text: 'Settings',
                              function: () {
                                Get.to(const SettingsScreen());
                              },
                              icon: Icons.settings),
                          // Tile(
                          //     text: 'Payment Method',
                          //     function: () {
                          //       Get.to(PaymentMethods());
                          //     },
                          //     icon: Icons.credit_card),
                          Tile(
                              text: 'Booking',
                              function: () {
                                Get.to(const Booking(isBackButton: true));
                              },
                              icon: FontAwesomeIcons.bookOpen),
                          // Tile(
                          //     text: 'History',
                          //     function: () {
                          //       Get.to(History());
                          //     },
                          //     icon: Icons.history),
                          Tile(
                              text: 'Invoices',
                              function: () {
                                Get.to(Invoices(
                                  isBackButton: true,
                                ));
                              },
                              icon: FontAwesomeIcons.fileInvoice),
                          Tile(
                              text: 'Helpers',
                              function: () {
                                Get.to(const HelpersTabBar());
                              },
                              icon: FontAwesomeIcons.solidHandshake),
                          // Tile(
                          //     text: 'Payments',
                          //     function: () {},
                          //     icon: Icons.list_alt_outlined),
                          Tile(
                              text: 'Favorites',
                              function: () {
                                Get.to(const HelpersTabBar());
                              },
                              icon: Icons.favorite),
                          Tile(
                              text: 'Map',
                              function: () {
                                Get.to(Tracking());
                              },
                              icon: Icons.map),
                          // Tile(
                          //     text: 'Address',
                          //     function: () {},
                          //     icon: Icons.location_on),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 120,
                        child: TextButton(
                          onPressed: () {
                            _userController.signOut();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                child: Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: K.eighthColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Log Out',
                                  style: K.textStyle2
                                      .copyWith(color: K.eighthColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
