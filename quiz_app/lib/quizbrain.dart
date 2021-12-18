import 'package:quiz_app/questions.dart';

class Quizbrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      'Question No 01',
      'Some cats are actually allergic to humans',
      true,
    ),
    Question('Question No 02',
        'You can lead a cow down stairs but not up stairs.', false),
    Question('Question No 03',
        'Approximately one quarter of human bones are in the feet.', true),
    Question('Question No 04', 'A slug\'s blood is green.', true),
    Question('Question No 05',
        'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('Question No 06', 'It is illegal to pee in the Ocean in Portugal.',
        true),
    Question(
        'Question No 07',
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'Question No 08',
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'Question No 09',
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'Question No 10',
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question(
        'Question No 11', 'Google was originally called \"Backrub\".', true),
    Question(
        'Question No 12',
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'Question No 13',
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
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
