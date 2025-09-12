
import 'dart:convert';

import '../../tools/base_utils.dart';
import 'data.dart';

class DailyLife{
  static const String category = "DailyLife";
  // static const data = [
  //   {
  //     "question": "How many hours are there in a day?",
  //     "a": "12",
  //     "b": "24",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of France?",
  //     "a": "London",
  //     "b": "Paris",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet closest to the Sun?",
  //     "a": "Earth",
  //     "b": "Mercury",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many colors are there in a rainbow?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest ocean in the world?",
  //     "a": "Atlantic Ocean",
  //     "b": "Pacific Ocean",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the national bird of the United States?",
  //     "a": "Eagle",
  //     "b": "Hawk",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for temperature in the Celsius scale?",
  //     "a": "Degree Fahrenheit",
  //     "b": "Degree Celsius",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Australia?",
  //     "a": "Sydney",
  //     "b": "Canberra",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many sides does a square have?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the chemical symbol for oxygen?",
  //     "a": "O",
  //     "b": "H",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the first month of the year?",
  //     "a": "February",
  //     "b": "January",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many days are there in a leap year?",
  //     "a": "364",
  //     "b": "366",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Jupiter",
  //     "b": "Saturn",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the color of a ripe banana?",
  //     "a": "Green",
  //     "b": "Yellow",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the longest river in the world?",
  //     "a": "Amazon River",
  //     "b": "Nile River",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the capital of India?",
  //     "a": "Mumbai",
  //     "b": "New Delhi",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the symbol for the element gold?",
  //     "a": "Au",
  //     "b": "Ag",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many continents are there in the world?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Germany?",
  //     "a": "Berlin",
  //     "b": "Munich",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for volume in the metric system?",
  //     "a": "Liter",
  //     "b": "Meter",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the planet known as the Red Planet?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many sides does a hexagon have?",
  //     "a": "5",
  //     "b": "6",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Japan?",
  //     "a": "Tokyo",
  //     "b": "Osaka",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest sea in the world?",
  //     "a": "Caspian Sea",
  //     "b": "Mediterranean Sea",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the first day of the week?",
  //     "a": "Sunday",
  //     "b": "Monday",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the chemical symbol for hydrogen?",
  //     "a": "H",
  //     "b": "He",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest country in the world by area?",
  //     "a": "Canada",
  //     "b": "Russia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet we live on?",
  //     "a": "Mars",
  //     "b": "Earth",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many corners does a rectangle have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Brazil?",
  //     "a": "Rio de Janeiro",
  //     "b": "Brasilia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the smallest continent?",
  //     "a": "Oceania",
  //     "b": "Australia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the unit of measurement for weight in the metric system?",
  //     "a": "Gram",
  //     "b": "Meter",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest lake in the world by area?",
  //     "a": "Lake Baikal",
  //     "b": "Caspian Sea",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of China?",
  //     "a": "Shanghai",
  //     "b": "Beijing",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet with rings?",
  //     "a": "Jupiter",
  //     "b": "Saturn",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many states are there in the United States?",
  //     "a": "48",
  //     "b": "50",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the largest moon in the solar system?",
  //     "a": "Ganymede",
  //     "b": "Titan",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of Canada?",
  //     "a": "Montreal",
  //     "b": "Ottawa",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the hottest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Mercury",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many legs does a spider have?",
  //     "a": "6",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet that is closest to the Earth in size?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the smallest planet in our solar system?",
  //     "a": "Mercury",
  //     "b": "Pluto",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of Russia?",
  //     "a": "Moscow",
  //     "b": "St. Petersburg",
  //     "answer": "a"
  //   }
  // ];

  static const jsonEn =  "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";

  static String jsonDe =  JcBaseUtils.decrypt(jsonEn,  DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}