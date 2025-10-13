import 'package:flutter/widgets.dart';
import 'package:skrining_apps/models/question.dart';
import 'package:skrining_apps/service/question_service.dart';
import 'package:skrining_apps/state/question_state.dart';

class QuestionProvider extends ChangeNotifier {
  final QuestionService _service;
  QuestionState _state = QuestionInitial();
  QuestionState get state => _state;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List<dynamic> allAnswer = [];

  QuestionProvider(this._service) {
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    _state = QuestionLoading();
    notifyListeners();

    try {
      final questions = await _service.fetchQuestions();
      _state = QuestionLoaded(questions);
      debugPrint("Berapa banyak pertanyaan = ${questions.length}");
      allAnswer = List.filled(questions.length, null);
    } catch (e) {
      _state = QuestionError(e.toString());
    }
    notifyListeners();
  }

  List<Question> get questions => 
      (_state is QuestionLoaded) ? (_state as QuestionLoaded).questions : [];
  
  Question? get currentQuestion => 
      questions.isNotEmpty ? questions[_currentIndex] : null;

  double get progress => 
      questions.isEmpty ? 0.0 : (_currentIndex + 1) / questions.length;

  dynamic get currentAnswerValue => allAnswer[currentIndex];

  void saveAnswer(dynamic value) {
    if (currentQuestion != null) {
      allAnswer[currentIndex] = value;
      notifyListeners();
    }
  }

  bool nextQuestion() {
    if (currentQuestion == null || questions.isEmpty) return false;

    if (currentQuestion!.required && currentAnswerValue == null) {
      debugPrint("Peringatan: Pertanyaan ini wajib dijawab!");
      return false; 
    }

    if (_currentIndex < questions.length - 1) {
      _currentIndex++;
      notifyListeners();
      return true;
    } else {
      // Code disini u/ submitnya
      return false;
    }
  }

  bool previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
      return true;
    } else {
      // Code disini u/ back ke Home
      return false;
    }
  }

  List<dynamic> collectResults(){
    return allAnswer;
  }
}