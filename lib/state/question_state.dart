import 'package:skrining_apps/models/question.dart';

sealed class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;
  QuestionLoaded(this.questions);
}

class QuestionError extends QuestionState {
  final String message;
  QuestionError(this.message);
}