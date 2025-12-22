// This is a simple model containing id and name for the list on the start page 
// to not directly load all configurations from the shared preferences
class SharedPreferencesModel {
  String id;
  String name;
  SharedPreferencesModel(this.id, this.name);

  factory SharedPreferencesModel.fromJson(Map<String, dynamic> json) {
    return SharedPreferencesModel(json["id"], json["name"]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}