class Member {
  final int id;
  final int? nis;
  final String name;
  final DateTime? tglLahir;
  final String? tempatLahir;
  final bool isActive;

  Member(this.id, this.nis, this.name, this.tglLahir, this.tempatLahir,
      this.isActive);
}
