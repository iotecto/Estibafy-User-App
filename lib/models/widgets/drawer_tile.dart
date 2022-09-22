

import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
   Tile({Key? key, this.text, this.function, this.icon}) : super(key: key);
  dynamic text;
  dynamic function;
  dynamic icon;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [

          SizedBox(
            height: 45,
            child: ListTile(
              onTap: widget.function,
              leading: Icon(
                widget.icon,
                color: K.primaryColor,
                size: 28,
              ),
              title: Text(
                widget.text,
                style: K.textStyle2.copyWith(
                  color: K.primaryColor,
                ),
              ),
            ),
          ),
          Divider(
            color: K.sixthColor.withOpacity(0.2),
          ),
        ],
      );
    }
}
