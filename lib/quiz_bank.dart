import 'question.dart';

class QuizBank {

  int _questionNumber = 0;

  List<Question> _questions = [
    Question('Brasília is the capital city of Brazil', true),
    Question('The Indian Ocean is the third largest ocean in the world', true),
    Question('The city of Utrecht is in Holland', false),
    Question('There are more countries in Africa than Asia', true),
    Question('Seattle is more northerly than New York City', true),
    Question('Rhode Island has a greater population than Mongolia', false),
    Question('The island of Borneo is occupied by three countries', true),
    Question('Mount Kilimanjaro is higher than Denali', false),
    Question('Memphis is the state capital of Tennessee', false),
    Question('The Maldives has the lowest high point of any country', true),
    Question('Japan has the world\'s highest life expectancy', false),
    Question('The world\'s tallest waterfall is in Venezuela', true),
    Question('The currency of Switzerland is the Euro', false),
    Question('China borders the same number of countries as Russia', true),
    Question('Shanghai has a greater population than Beijing', true)
  ];


  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }


  String getQuestionText() {
    return _questions[_questionNumber].questionString;
  }

  bool getAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

}