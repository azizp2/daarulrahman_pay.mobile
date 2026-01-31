import 'package:darul_rahman_app/features/member/domain/entities/member.dart';

class MemberModel extends Member {
  MemberModel({
    required int id,
    int? nis,
    required String name,
    DateTime? tglLahir,
    String? tempatLahir,
    required bool isActive,
  }) : super(id, nis, name, tglLahir, tempatLahir, isActive);

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        id: json['id'] ?? 0,
        nis: json['nis'],
        name: json['name'],
        tglLahir: json['tgl_lahir'] != null
            ? DateTime.parse(json['tgl_lahir'])
            : null,
        tempatLahir: json['tempat_lahir'],
        isActive: json['is_active'] ?? true);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nis': nis,
        'name': name,
        'tgl_lahir': tglLahir,
        'tempat_lahir': tempatLahir,
        'is_active': isActive
      };
}
