import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:flutter/material.dart';

import '../../../models/widgets/appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Settings', _scaffoldKey, context),
      body: Center(
        child: MaterialButton(
          color: Colors.redAccent,
          onPressed: () {
            showAlertDialog(context);
          },
          child: const Text(
            'Delete Account',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        UserController controller = UserController();
        controller.deleteAccount();
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation"),
      content: const Text("Are you sure to delete your account?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
