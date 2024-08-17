class Member{
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String role;
  final String status;


  Member({required this.name, required this.email, required this.password, required this.phone, required this.address, required this.role, required this.status});

  factory Member.fromJson(Map<String, dynamic> json){
    return Member(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'address': address,
    'role': role,
    'status': status,
  };
}