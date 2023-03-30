class City {
  City({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String createdAt;
  String updatedAt;
  int v;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
      };
}
