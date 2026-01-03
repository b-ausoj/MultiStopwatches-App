import 'package:multistopwatches/models/lap_model.dart';
import 'package:uuid/uuid.dart';

class RecordingModel {
  // fields
  static const _uuid = Uuid();
  final String id;

  String name;
  DateTime startingTime;
  bool viewed;
  String fromGroup;

  Duration totalTime;
  List<LapModel> lapTimes = [];
  List<LapModel> splitTimes = [];

  RecordingModel(this.id, this.name, this.startingTime, this.viewed,
      this.fromGroup, this.totalTime);

  factory RecordingModel.create(String name, DateTime startingTime, bool viewed,
      String fromGroup, Duration totalTime) {
    return RecordingModel(
        _uuid.v7(), name, startingTime, viewed, fromGroup, totalTime);
  }

  factory RecordingModel.fromJson(Map<String, dynamic> json) {
    RecordingModel model = RecordingModel(
        json["id"],
        json["name"],
        DateTime.fromMillisecondsSinceEpoch(json["startingTime"]),
        json["viewed"],
        json["fromGroup"],
        Duration(milliseconds: json["totalTime"]));
    json["lapTimes"].forEach((key, value) {
      model.lapTimes
          .add(LapModel(int.parse(key), Duration(milliseconds: value)));
    });
    json["splitTimes"].forEach((key, value) {
      model.splitTimes
          .add(LapModel(int.parse(key), Duration(milliseconds: value)));
    });
    return model;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startingTime": startingTime.millisecondsSinceEpoch,
        "viewed": viewed,
        "fromGroup": fromGroup,
        "totalTime": totalTime.inMilliseconds,
        "lapTimes": getListJson(lapTimes),
        "splitTimes": getListJson(splitTimes)
      };

  Map<String, dynamic> getListJson(List<LapModel> list) {
    Map<String, dynamic> json = {};
    for (LapModel lap in list) {
      json["${lap.id}"] = lap.lapTime.inMilliseconds;
    }
    return json;
  }
}
