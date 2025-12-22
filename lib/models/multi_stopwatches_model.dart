import 'package:flutter_stopwatch_app_v1/models/configuration_model.dart';

// This model serves the purpose that it contains all the configurations 
// with their stopwatches and laps so the different pages always have the same data
// => Wrapper class around all configurations
class MultiStopwatchesModel {
  // String sharedPreferencesKey = "shared_prefs_key_multi_stopwatch_v1"; This goes somewhere else
  List<ConfigurationModel> configurations = [];

  MultiStopwatchesModel();
}