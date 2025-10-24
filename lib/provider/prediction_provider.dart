import 'package:flutter/widgets.dart';
import 'package:skrining_apps/service/api_service.dart';
import 'package:skrining_apps/state/prediction_result_state.dart';

class PredictionProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  PredictionProvider(
    this._apiServices,
  );

  PredictionResultState _resultState = PredictionNoneState();
  PredictionResultState get resultState => _resultState;

  Future<void> fetchPrediction(List<dynamic> data) async {
    try {
      _resultState = PredictionLoadingState();
      notifyListeners();

      final result = await _apiServices.postPredictionData(inputData: data);
      if (result.message != null) {
        _resultState = PredictionErrorState(result.message!);
        notifyListeners();
      } else {
        _resultState = PredictionLoadedState(result.prediction!, result.probability!);
        notifyListeners();
      }
    } on Exception catch (e) {
      String errorMessage = e.toString().replaceAll('Exception:', '').trim();
      _resultState = PredictionErrorState(errorMessage);
      notifyListeners();
    }
  }
}