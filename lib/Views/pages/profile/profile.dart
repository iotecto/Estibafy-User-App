import 'package:estibafy_user/Controller/Tab%20Controller/profile_controller.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../drawer.dart';

class Profile extends StatefulWidget {
  final bool isBackButton;

  const Profile({Key? key, required this.isBackButton}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = Get.put(ProfileController());
  final UserController _userController = Get.find(tag: K.userControllerTag);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? provinceChoose;
  String? countryChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: K.primaryColor,
        drawer: const SideDrawer(),
        appBar: widget.isBackButton == true
            ? getAppBar2('Profile', _scaffoldKey, context)
            : getAppBar('Profile', _scaffoldKey),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 850,
                width: MediaQuery.of(context).size.width * 1.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: K.sixthColor),
                        borderRadius: BorderRadius.circular(20),
                        color: K.secondaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: K.primaryColor.withOpacity(0.5),
                            blurRadius: 9,
                            offset: const Offset(4, 8), // Shadow position
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 40),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),

                            input5(
                                text: _userController.user.value.name,
                                controller: profileController.nameController,
                                context: context,
                                title: 'Name',
                                icon: Icons.person_outline),

                            input5(
                                text: _userController.user.value.email,
                                controller: profileController.emailController,
                                context: context,
                                title: 'Email',
                                icon: Icons.email_outlined),

                            input5(
                                text: _userController.user.value.phoneNumber,
                                controller: profileController.phoneController,
                                context: context,
                                title: 'Phone Number',
                                icon: Icons.contact_phone_outlined),
                            input5(
                                text: 'Los Olivos, Av. Leopoldo Carrera # 105',
                                controller: profileController.addressController,
                                context: context,
                                title: 'Address',
                                icon: Icons.location_on_outlined),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: input4(
                            //           text: 'Guayaquil',
                            //           controller:
                            //               profileController.cityController),
                            //     ),
                            //     Expanded(
                            //       child: Column(
                            //         children: [
                            //           SizedBox(
                            //             height: 36,
                            //             child: DropdownButton(
                            //               value: provinceChoose,
                            //               hint: Center(
                            //                 child: Padding(
                            //                   padding: const EdgeInsets.only(
                            //                       left: 30),
                            //                   child: Text('Guayas',
                            //                       style: K.textStyle3),
                            //                 ),
                            //               ),
                            //               iconSize: 30,
                            //               isExpanded: true,
                            //               underline: Container(
                            //                 height: 0,
                            //                 color: Colors.deepPurpleAccent,
                            //               ),
                            //               icon: Padding(
                            //                 padding: EdgeInsets.only(right: 10),
                            //                 child: Icon(
                            //                   Icons.expand_more,
                            //                   color: K.primaryColor,
                            //                   size: 24,
                            //                 ),
                            //               ),
                            //               onChanged: (String? newValue) {
                            //                 setState(() {
                            //                   provinceChoose = newValue!;
                            //                 });
                            //               },
                            //               items: ExampleObjects
                            //                   .provinceChooseList
                            //                   .map((valueItems) {
                            //                 return DropdownMenuItem<String>(
                            //                   value: valueItems,
                            //                   child: Center(
                            //                     child: Padding(
                            //                       padding:
                            //                           const EdgeInsets.only(
                            //                               left: 30),
                            //                       child: Text(
                            //                         valueItems,
                            //                         style: K.textStyle3,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 );
                            //               }).toList(),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 17),
                            //             child: Divider(
                            //                 color:
                            //                     K.sixthColor.withOpacity(0.8)),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Column(
                            //         children: [
                            //           SizedBox(
                            //             height: 36,
                            //             child: DropdownButton(
                            //               value: countryChoose,
                            //               hint: Center(
                            //                 child: Padding(
                            //                   padding: const EdgeInsets.only(
                            //                       left: 30),
                            //                   child: Text('Eciuador',
                            //                       style: K.textStyle3),
                            //                 ),
                            //               ),
                            //               iconSize: 30,
                            //               isExpanded: true,
                            //               underline: Container(
                            //                 height: 0,
                            //                 color: Colors.deepPurpleAccent,
                            //               ),
                            //               icon: Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     right: 10),
                            //                 child: Icon(
                            //                   Icons.expand_more,
                            //                   color: K.primaryColor,
                            //                   size: 24,
                            //                 ),
                            //               ),
                            //               onChanged: (String? newValue) {
                            //                 setState(() {
                            //                   countryChoose = newValue!;
                            //                 });
                            //               },
                            //               items: ExampleObjects
                            //                   .countryChooseList
                            //                   .map((valueItems) {
                            //                 return DropdownMenuItem<String>(
                            //                   value: valueItems,
                            //                   child: Center(
                            //                     child: Padding(
                            //                       padding:
                            //                           const EdgeInsets.only(
                            //                               left: 30),
                            //                       child: Text(
                            //                         valueItems,
                            //                         style: K.textStyle3,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 );
                            //               }).toList(),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 17),
                            //             child: Divider(
                            //                 color:
                            //                     K.sixthColor.withOpacity(0.8)),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: input4(
                            //           text: '000000',
                            //           controller:
                            //               profileController.zipCodeController),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Transform.scale(
                                    scale: 0.9,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: K.fourthColor),
                                      child: Checkbox(
                                        checkColor: K.secondaryColor,
                                        focusColor: K.primaryColor,
                                        hoverColor: K.secondaryColor,
                                        activeColor: K.primaryColor,
                                        value: profileController
                                            .isShowCompanyChecked.value,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            profileController
                                                .isShowCompanyChecked
                                                .value = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Show as company",
                                  style: K.textStyle2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Password', style: K.textStyle3),
                            const SizedBox(
                              height: 5,
                            ),

                            input6(
                              textField: TextField(
                                controller:
                                    profileController.passwordController,
                                cursorColor: K.primaryColor,
                                obscureText:
                                    profileController.isObscurePassword,
                                decoration: InputDecoration(
                                  hintText:
                                      profileController.passwordController.text,
                                  hintStyle: K.textStyle3,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.key,
                                    color: K.tenthColor,
                                    size: 16,
                                  ),
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (profileController
                                                .isObscurePassword ==
                                            true) {
                                          profileController.isObscurePassword =
                                              false;
                                        } else {
                                          profileController.isObscurePassword =
                                              true;
                                        }
                                      });
                                    },
                                    icon: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: K.tenthColor,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: K.textStyle3,
                              ),
                              context: context,
                              title: 'Password',
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(20.0),
                            //   child: SizedBox(
                            //     height: 55,
                            //     width: double.infinity,
                            //     child: ElevatedButton(
                            //       onPressed: () {},
                            //       style: ElevatedButton.styleFrom(
                            //           primary: K.primaryColor,
                            //           onPrimary: K.secondaryColor,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(5),
                            //           )),
                            //       child: Text(
                            //         'Save',
                            //         style: K.textStyle3
                            //             .copyWith(color: K.secondaryColor),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: K.secondaryColor,
                          border: Border.all(color: K.tertiaryColor),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              profileController.getImage();
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: K.tertiaryColor),
                              ),
                              child: const Icon(Icons.person_outline),
                              // child: profileController.displayImage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
