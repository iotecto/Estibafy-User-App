class User {
  String? imagePath;
  String name;
  String email;
  int? userId;
  String phoneNumber;
  String? address;
  String? city;
  String? state;
  String? country;
  String password;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
       
      this.imagePath,
      this.userId});

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'city': city,
        'id': userId,
        'state': state,
        'country': country,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        city = json['city'],
        state = json['state'],
        userId = json['id'],
        country = json['country'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        password = json['password'];
}
