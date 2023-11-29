import 'package:flutter/cupertino.dart';



@immutable
abstract class NotesState{}
class NotesInitial extends NotesState{}
class NotesLoading extends NotesState{}
class NotesSuccess extends NotesState{

}
