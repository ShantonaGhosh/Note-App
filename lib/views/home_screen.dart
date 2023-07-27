import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';


import '../model/note_model.dart';
import '../widget/custom_card.dart';
import 'note_edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    var box = Hive.box<NoteModel>('notes');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff727468),
        title: Text('Note App'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     var box = Hive.box<NoteModel>('notes');
            //     NoteModel item = NoteModel(
            //       title: 'note',
            //       note: 'data ',
            //      // creationDate: '';
            //     );
            //     await box.add(item);
            //     setState(() {});
            //   },
            //   child: Text('Save'),
            // ),
            Expanded(
              child: ValueListenableBuilder<Box<NoteModel>>(
                valueListenable: Hive.box<NoteModel>('notes').listenable(),
                builder: ((context, box, _) {
                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: ((context, index) {
                      NoteModel currentTask = box.getAt(index)!;
                      return CustomCard(
                        currentTask: currentTask,
                        index: index,
                      );
                    }),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    
      floatingActionButton: AnimatedSlide(
        duration: Duration(milliseconds: 300),
        offset: isVisible ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: isVisible ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(NoteEditScreen());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            backgroundColor: Color(0xff727468),
          ),
        ),
      ),
    );
  }
}
