
import 'dart:convert';

import '../../tools/base_utils.dart';
import 'data.dart';

class Math{
  static const String category = "Math";
  // static const data =[
  //   {
  //     "question": "What is the result of 2 + 2?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the shape of a circle?",
  //     "a": "Square",
  //     "b": "Round",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes after 5?",
  //     "a": "6",
  //     "b": "4",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many sides does a triangle have?",
  //     "a": "2",
  //     "b": "3",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the square root of 64?",
  //     "a": "5",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 5 × 3?",
  //     "a": "5",
  //     "b": "15",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many legs does a dog have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 3 squared?",
  //     "a": "6",
  //     "b": "9",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes before 8?",
  //     "a": "7",
  //     "b": "9",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many corners does a rectangle have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 12 ÷ 3?",
  //     "a": "4",
  //     "b": "6",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of a triangle?",
  //     "a": "Circle",
  //     "b": "Triangle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many days are there in a week?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 4 + 3?",
  //     "a": "6",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes after 9?",
  //     "a": "10",
  //     "b": "8",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the result of 7 - 3?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 15 - 8?",
  //     "a": "7",
  //     "b": "23",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of a rectangle?",
  //     "a": "Square",
  //     "b": "Rectangle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many legs does a spider have?",
  //     "a": "2",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 5 x 3?",
  //     "a": "8",
  //     "b": "15",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes before 4?",
  //     "a": "3",
  //     "b": "5",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is 9 ÷ 3?",
  //     "a": "3",
  //     "b": "6",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of an oval?",
  //     "a": "Square",
  //     "b": "Oval",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 2 to the power of 4?",
  //     "a": "4",
  //     "b": "16",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 7 + 7?",
  //     "a": "10",
  //     "b": "14",
  //     "answer":"b"
  //   },
  //   {
  //     "question": "What is 7 + 3?",
  //     "a": "10",
  //     "b": "14",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the number that comes after 12?",
  //     "a": "11",
  //     "b": "13",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many corners does a hexagon have?",
  //     "a": "4",
  //     "b": "6",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 8 - 3?",
  //     "a": "3",
  //     "b": "5",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 6 × 2?",
  //     "a": "16",
  //     "b": "12",
  //     "answer": "b"
  //   }
  // ];


  static const jsonEn =  "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";

  static String jsonDe =  JCJiamiU.decrypt(jsonEn,  DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}
