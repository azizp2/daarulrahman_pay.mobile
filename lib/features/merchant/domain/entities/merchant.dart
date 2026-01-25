class Merchant {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? logo;
  final bool? isActive;

  Merchant(
      {this.email,
      this.phone,
      this.address,
      this.logo,
      this.id,
      this.name,
      this.isActive});
}
