

import 'dart:convert';

import '../../tools/base_utils.dart';
import 'data.dart';

class Animal{
  static const String category = "Animal";
  // static const data = [
  //   {
  //     "question": "What is the largest land animal in the world?",
  //     "a": "Dog",
  //     "b": "Elephant",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal has a long trunk?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal has the longest lifespan?",
  //     "a": "Tortoise",
  //     "b": "Monkey",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the fastest land animal?",
  //     "a": "Horse",
  //     "b": "Cheetah",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its black and white stripes?",
  //     "a": "Zebra",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal has a long neck and eats leaves from tall trees?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is capable of producing venom?",
  //     "a": "Jellyfish",
  //     "b": "Tiger",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest species of penguin?",
  //     "a": "Emperor penguin",
  //     "b": "Gentoo penguin",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal has a hard shell and moves slowly?",
  //     "a": "Turtle",
  //     "b": "Rabbit",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the national bird of the United States?",
  //     "a": "Monkey",
  //     "b": "Eagle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its long neck?",
  //     "a": "Eagle",
  //     "b": "Elephant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the water and has a fin on its back?",
  //     "a": "Dolphin",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal can fly?",
  //     "a": "Tiger",
  //     "b": "Bat",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest species of shark?",
  //     "a": "Tiger shark",
  //     "b": " Whale shark",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to camouflage?",
  //     "a": "Chameleon",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal is known for its black and white color and waddling walk?",
  //     "a": "Penguin",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the desert and has humps on its back?",
  //     "a": "Camel",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its humps on its back?",
  //     "a": "Bear",
  //     "b": "Anteater",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal has a long neck and spots on its body?",
  //     "a": "Giraffe",
  //     "b": "Horse",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its black and white coloration and bamboo diet?",
  //     "a": "Crab",
  //     "b": "Panda",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to swim and balance a ball on its nose?",
  //     "a": "Seal",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal has a long, sticky tongue and can climb trees?",
  //     "a": "Bear",
  //     "b": "Chameleon",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal lives in the jungle and has orange fur with black stripes?",
  //     "a": "Tiger",
  //     "b": "Elephant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to hang upside down from trees?",
  //     "a": "Sloth",
  //     "b": "Rabbit",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal is known for its bright colors and ability to mimic other animals?",
  //     "a": "Parrot",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the ocean and has a hard shell on its back?",
  //     "a": "Shark",
  //     "b": "Turtle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal is known for its black and white color and eats bamboo?",
  //     "a": "Panda",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the national animal of Canada?",
  //     "a": "Beaver",
  //     "b": "Moose",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal can change its color to match its surroundings? ",
  //     "a": "Chameleon",
  //     "b": "Ostrich",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to camouflage and change colors?",
  //     "a": "Chameleon",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   }
  // ];

  static const jsonEn = "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";

  static String jsonDe =  JcBaseUtils.decrypt(jsonEn, DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }



}
