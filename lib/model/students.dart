import 'city.dart';

class Student {
  Student({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.province,
    required this.city,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String gender;
  DateTime birthDate;
  City province;
  City city;
  String photo;
  String createdAt;
  String updatedAt;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        name: json["name"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birthDate"]),
        province: City.fromJson(json["province"]),
        city: City.fromJson(json["city"]),
        photo: json["photo"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "gender": gender,
        "birthDate": birthDate.toIso8601String(),
        "photo": photo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
