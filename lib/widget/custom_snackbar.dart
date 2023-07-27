import 'package:flutter/material.dart';
import 'package:get/get.dart';



customSnackBar({
  required Color bgClr,
  Icon? icon,
  required String msg,
  Duration? duration,
}) {
  Get.rawSnackbar(
    messageText: Row(
      children: [
        Text(
          "${msg}",
          style:TextStyle(color: Colors.white, fontSize: 14),
        ),
        Spacer(),
        InkWell(
          onTap: () => Get.back(canPop: true),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    ),
    backgroundColor: bgClr,
    margin: EdgeInsets.all(12.0),
    borderRadius: 5.0,
    icon: icon,
  );
}
