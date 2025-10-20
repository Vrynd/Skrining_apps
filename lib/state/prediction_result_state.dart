sealed class PredictionResultState {}

class PredictionNoneState extends PredictionResultState {}

class PredictionLoadingState extends PredictionResultState {}

class PredictionErrorState extends PredictionResultState {
  final String error;

  PredictionErrorState(this.error);
}

class PredictionLoadedState extends PredictionResultState {
  final String data;

  PredictionLoadedState(this.data);
}