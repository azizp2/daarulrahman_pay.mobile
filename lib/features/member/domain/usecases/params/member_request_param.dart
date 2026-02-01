import 'package:darul_rahman_app/core/helpers/date_time_helper.dart';

class MemberRequestParam {
  final String? nis;
  final String? name;
  final String? tempatLahir;
  final DateTime? tglLahir;
  final bool isActive;

  MemberRequestParam(
      {required this.nis,
      required this.name,
      required this.tempatLahir,
      required this.tglLahir,
      required this.isActive});

  Map<String, dynamic> toJson() => {
        'nis': nis,
        'name': name,
        'tempat_lahir': tempatLahir,
        'tgl_lahir': DateTimeHelper.format(tglLahir, pattern: "yyyy-MM-dd"),
        'is_active': isActive
      };
}
