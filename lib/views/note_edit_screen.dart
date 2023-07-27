import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_app/widget/custom_snackbar.dart';

import '../model/note_model.dart';
import 'home_screen.dart';

class NoteEditScreen extends StatefulWidget {
  NoteEditScreen({super.key, this.currentTask});
  NoteModel? currentTask;

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  TextEditingController _titleController = TextEditingController(
  // text: widget.currentTask == null ? null : widget.currentTask!.title!

  //  if (responseData["status"]  != null && responseData["status"]==true ) {

      // if (text:widget.currentTask == null ){
      // text: null,
      // } else {
      //      text: widget.currentTask.title

      // }


  );

  

  TextEditingController _noteController = TextEditingController(
      //text: widget.currentTask == null ? null : widget.currentTask!.title!
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          backgroundColor: Color(0xff727468),
          leading: GestureDetector(
            onTap: () {
              Get.to(HomeScreen());
            },
            child: Chip(
              backgroundColor: Colors.white,
              label: Text('Cancel'),
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                Box<NoteModel> noteBox = Hive.box<NoteModel>('notes');

                var newNote = NoteModel(
                  title: _titleController.text,
                  note: _noteController.text,
                  creationDate: DateTime.now(),
                );
                if (_formKey.currentState!.validate()) {
                  customSnackBar(
                      bgClr: Color(0xff727468), msg: 'Note save successfully');
                  if (widget.currentTask != null) {
                    widget.currentTask!.title = newNote.toString();
                    widget.currentTask!.note = newNote.toString();
                    widget.currentTask!.save();
                    Get.to(HomeScreen());
                  } else {
                    await noteBox.add(newNote);
                    Get.to(HomeScreen());
                  }
                } else {
                  customSnackBar(
                    bgClr: Colors.red,
                    msg: "please enter some text",
                    duration: Duration(milliseconds: 700),
                  );
                }
              },
              child: Chip(
                backgroundColor: Colors.white,
                label: Text(widget.currentTask == null ? 'Save' : ' Update'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.check),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  validator: ((value) {
                    if (value == null && value!.isEmpty) {
                      customSnackBar(
                          bgClr: Color(0xff727468),
                          msg: 'Please enter some text');
                    }
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Start Note...',
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  validator: ((value) {
                    if (value == null && value!.isEmpty) {
                      customSnackBar(
                          bgClr: Color(0xff727468),
                          msg: 'Please enter some text');
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
