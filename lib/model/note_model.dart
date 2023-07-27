import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? note;

  @HiveField(2)
  DateTime? creationDate;


  NoteModel({
    this.title,
    this.note,
    this.creationDate,
  });
}
