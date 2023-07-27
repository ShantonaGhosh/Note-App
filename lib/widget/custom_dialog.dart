import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customDialog({
  VoidCallback? leftOnTap,
  VoidCallback? rightOnTap,
  String? title,
  String? content,
  List<Widget>? actions,
}) {
  return Get.defaultDialog(
    radius: 10.0,
    onWillPop: () async => false,
    title: title ?? '',
    content: Text("$content"),
    contentPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
    titlePadding: EdgeInsets.symmetric(vertical: 20.0),
    actions: actions ??
        <Widget>[
          InkWell(
            onTap: leftOnTap,
            child: const Card(
              color: Colors.red,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          InkWell(
            onTap: rightOnTap,
            child: const Card(
              color: Colors.green,
              child: Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
  );
}
