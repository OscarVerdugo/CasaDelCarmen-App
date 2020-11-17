class Profile {
  Profile({
    this.id,
    this.name,
    this.modules,
  });

  int id;
  String name;
  List<Module> modules;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        modules: List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
      };
}

class Module {
  Module({
    this.id,
    this.name,
    this.route,
  });

  int id;
  String name;
  String route;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        name: json["name"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "route": route,
      };
}
