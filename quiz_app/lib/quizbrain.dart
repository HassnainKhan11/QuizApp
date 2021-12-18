import 'package:quiz_app/questions.dart';

class Quizbrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      'Question No 01',
      'Latitude is measured east and west of the prime meridian',
      false,
    ),
    Question('Question No 02',
        'A cape is a point of land extending into a body of water.', true),
    Question('Question No 03',
        '. The Antarctic Circle is located south of the equator.', true),
    Question('Question No 04',
        'A star on a map usually denotes a national capital', false),
    Question(
        'Question No 05',
        'Lines of longitude are measured north and south of the equator.',
        false),
    Question(
        'Question No 06',
        'When you cross the prime meridian the date becomes either one day earlier or one day later.',
        false),
    Question('Question No 07',
        'Earth\'s oceans are the Pacific, Atlantic, Indian, and Arctic.', true),
    Question('Question No 08',
        'There are 50 states in the contiguous United States.', false),
    Question(
        'Question No 09',
        ' An area of land extending into a body of water and almost surrounded by water is a peninsula.',
        true),
    Question('Question No 10',
        'The Tropic of Cancer is located in the northern hemisphere', true),
    Question(
        'Question No 11',
        'Africa, Asia, Australia, Europe, NorthAmerica, and South America form Earth\'s continental land masses.',
        false),
    Question('Question No 12',
        'A body of land completely surrounded by water is an island.', true),
    Question(
        'Question No 13',
        'The part of the map that contains information about what the symbols mean is the key.',
        true),
    Question(
        'Question No 14',
        'Longitude lines, or meridians, measure distances north and south',
        false),
    Question('Question No 15', 'The North Pole is not located on a continent.',
        true),
  ];

  String getQuestionNumber() {
    return _questionBank[_questionNumber].questionNumber;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = -1;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
