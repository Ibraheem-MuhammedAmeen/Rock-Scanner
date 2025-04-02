import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(width: 30),
          Text(
            text,
            style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),
          ),
          Spacer(),
          Icon(
            CupertinoIcons.arrow_right,
            size: 25,
          ),
        ],
      ),
    );
  }
}
