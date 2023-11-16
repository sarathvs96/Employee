class Employee {
  Employee({
      this.createdAt, 
      this.name, 
      this.image, 
      this.designation, 
      this.department, 
      this.email, 
      this.id,});

  Employee.fromJson(dynamic json) {
    createdAt = json['createdAt'] ?? "";
    name = json['name'] ?? "";
    image = json['image'] ?? "";
    designation = json['designation'] ?? "";
    department = json['department'] ?? "";
    email = json['email'] ?? "";
    id = json['id'] ?? "";
  }
  String? createdAt;
  String? name;
  String? image;
  String? designation;
  String? department;
  String? email;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['image'] = image;
    map['designation'] = designation;
    map['department'] = department;
    map['email'] = email;
    map['id'] = id;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'name': name,
      'image': image,
      'designation': designation,
      'department': department,
      'email': email,
      'id': id
    };
  }

}