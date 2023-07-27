import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/note_model.dart';
import '../views/note_edit_screen.dart';
import 'custom_dialog.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key? key, required this.currentTask, required this.index})
      : super(key: key);

  final NoteModel currentTask;
  int index;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    String dateFormat = '${widget.currentTask.creationDate!}';
    DateTime date = DateTime.parse(dateFormat);
    String dateTime = DateFormat('hh:mm a – yyyy-MM-dd').format(date);

    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Color(0xffBDBFB2), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.currentTask.title}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          // Divider(),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${widget.currentTask.note}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          Divider(
            // height: 24,
            thickness: 1.0,
          ),
          Row(
            children: [
              Text(
                '${dateTime.toString()}',
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.to(NoteEditScreen(
                    currentTask: widget.currentTask,
                  ));
                },
                child: Icon(
                  Icons.edit,
                  color: Color(0xff7A7F7E),
                ),
              ),
              SizedBox(
                width: 22.0,
              ),
              InkWell(
                onTap: () {
                  customDialog(
                      title: 'Are You sure?',
                      content: 'Want to delete this note ',
                      leftOnTap: () {
                        Get.back();
                      },
                      rightOnTap: (() {
                        Get.back();
                        widget.currentTask.delete();
                      }));
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
