import 'dart:convert';

import '../../tools/base_utils.dart';
import 'data.dart';

class Science {
  static const String category = "Science";

  // static const data = [
  //   {
  //     "question": "What is the fundamental unit of life?",
  //     "a": "Cell",
  //     "b": "Organ",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //     "What is the smallest unit of an element that retains its chemical properties?",
  //     "a": "Atom",
  //     "b": "Electron",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Neptune",
  //     "b": "Jupiter",
  //     "answer": "b",
  //   },
  //   {
  //     "question":
  //     "Which of the following is a natural satellite of the Earth? ",
  //     "a": "Moon",
  //     "b": "Venus",
  //     "answer": "a",
  //   },
  //
  //   {
  //     "question": "What is the scientific study of heredity called?",
  //     "a": "Evolution",
  //     "b": "Genetics",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What is the SI unit of force?",
  //     "a": "Newton",
  //     "b": "Joule",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the pH of pure water?",
  //     "a": "7",
  //     "b": "14",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //     "What is the force that opposes the motion of objects through a fluid called?",
  //     "a": "Gravity",
  //     "b": "Drag",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What element is the most abundant in the Earth's crust?",
  //     "a": "Oxygen",
  //     "b": "Silicon",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "Which of the following is NOT a primary color?",
  //     "a": "Green",
  //     "b": "Yellow",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the largest organ in the human body?",
  //     "a": "Skin",
  //     "b": "Brain",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //     "What is the study of the interactions between organisms and their environment called?",
  //     "a": "Evolution",
  //     "b": "Ecology",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What is the hottest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Jupiter",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //     "What is the process by which a substance changes from a gas to a liquid called?",
  //     "a": "Condensation",
  //     "b": "Melting",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //     "What is the process by which an organism produces offspring called?",
  //     "a": "Reproduction",
  //     "b": "Development",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the unit of measurement for electric current?",
  //     "a": "Ampere",
  //     "b": "Ohm",
  //     "answer": "a",
  //   },
  // ];

  static const jsonEn =
      "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";

  static String jsonDe = JCJiamiU.decrypt(jsonEn, DaTiShuju.code);

  static dynamic dataA() {
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}
