
import 'dart:convert';

import '../../tools/base_utils.dart';
import 'data.dart';

class Nature{
  static const String category = "Nature";
  // static const data = [
  //   {
  //     "question": "What is the chemical symbol for gold?",
  //     "a": "Ag",
  //     "b": "Au",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the highest mountain on Earth?",
  //     "a": "Mount Fuji",
  //     "b": "Mount Everest",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is a fish?",
  //     "a": "carrot",
  //     "b": "goldfish",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest mammal on land？",
  //     "a": "Cell",
  //     "b": "Elephant",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the process by which water is turned into ice",
  //     "a": "Melting",
  //     "b": "Freezing",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the main gas that makes up the Earth's atmosphere?",
  //     "a": "Nitrogen",
  //     "b": "Oxygen",
  //     "answer": "a"
  //
  //   },
  //   {
  //     "question": "What is the process by which water changes from a liquid to a gas called?",
  //     "a": "Sublimation",
  //     "b": "Evaporation",
  //     "answer": "b"
  //   },
  //   // {
  //   //   "question": "What is the process by which water changes from a liquid to a gas called?",
  //   //   "a": "Condensation",
  //   //   "b": "Evaporation",
  //   //   "answer": "b"
  //   // },
  //   {
  //     "question": "What is the name for a group of whales?",
  //     "a": "Pod",
  //     "b": "Flock",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest organ in the human body?",
  //     "a": "Brain",
  //     "b": "Skin",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is an amphibian?",
  //     "a": "frog",
  //     "b": "butterfly",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the primary gas responsible for climate change?",
  //     "a": "Carbon dioxide",
  //     "b": "Methane",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which one is a marine mammal?",
  //     "a": "elephant",
  //     "b": "dolphin",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the process of a liquid turning into a gas called?",
  //     "a": "Evaporation",
  //     "b": "Precipitation",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which is the planet that is closest to the Sun?",
  //     "a": "Mercury",
  //     "b": "Venus",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which one is a source of honey?",
  //     "a": "spider",
  //     "b": "bee",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is a migratory bird?",
  //     "a": "pigeon",
  //     "b": "swan",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which planet is known as the \"Red Planet\"?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What does the sun provide us with?",
  //     "a": "Food",
  //     "b": "Light and heat",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal lives in water and on land?",
  //     "a": "Fish",
  //     "b": "Frog",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name for a group of bees?",
  //     "a": "Herd",
  //     "b": "Swarm",
  //     "answer": "b"
  //   },
  //
  //   {
  //     "question": "What animal lives in trees and builds nests?",
  //     "a": "Mouse",
  //     "b": "Squirrel",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What gas do we breathe in?",
  //     "a": "Oxygen",
  //     "b": "Carbon dioxide",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for electrical resistance?",
  //     "a": "Volt",
  //     "b": "Ohm",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How do plants make food?",
  //     "a": "Rainwater",
  //     "b": "Photosynthesis",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal has a long neck?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal grows new antlers every year?",
  //     "a": "Lion",
  //     "b": "Deer",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal uses feathers to fly?",
  //     "a": "Mosquito",
  //     "b": "Bird",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Jupiter",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which plant can be used to make paper?",
  //     "a": "Rose",
  //     "b": "Trees",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the outermost layer of the Earth's atmosphere called?",
  //     "a": "Thermosphere",
  //     "b": "Stratosphere",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal swims in water using its tail?",
  //     "a": "Fish",
  //     "b": "Cat",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest moon in our solar system?",
  //     "a": "Titan",
  //     "b": "Ganymede",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name for a group of fish?",
  //     "a": "Flock",
  //     "b": "School",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is covered in scales?",
  //     "a": "Snake",
  //     "b": "Dog",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal sprays water through a blowhole?",
  //     "a": "Whale",
  //     "b": "Dolphin",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal lives in trees and builds beehives?",
  //     "a": "Bee",
  //     "b": "Ant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for sound intensity?",
  //     "a": "Watt",
  //     "b": "Decibel",
  //     "answer": "b"
  //   }
  // ];

  static const jsonEn =  "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";

  static String jsonDe =  JcBaseUtils.decrypt(jsonEn,  DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}
