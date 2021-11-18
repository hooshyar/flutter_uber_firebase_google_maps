class User {
  User({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.address,
  });
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? address;

  User.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        name = map['name'],
        email = map['email'],
        phone = map['phone'],
        address = map['address'];

  User.toMap(User user)
      : uid = user.uid,
        name = user.name,
        email = user.email,
        phone = user.phone,
        address = user.address;
}
