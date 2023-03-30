import 'city.dart';
import 'province.dart';

class Students {
  Students({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.province,
    required this.city,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    // required this.provinsi,
    // required this.kota,
  });

  String id;
  String name;
  String gender;
  DateTime birthDate;
  String province;
  String city;
  String photo;
  String createdAt;
  String updatedAt;
  // Province provinsi;
  // City kota;

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        id: json["_id"],
        name: json["name"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birthDate"]),
        province: json["province"],
        city: json["city"],
        photo: json["photo"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        // provinsi: Province.fromJson(json["provinsi"]),
        // kota: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "gender": gender,
        "birthDate": birthDate.toIso8601String(),
        "province": province,
        "city": city,
        "photo": photo,
        "created_at": createdAt,
        "updated_at": updatedAt,
        // "provinsi": provinsi.toJson(),
        // "city": kota.toJson(),
      };
}
