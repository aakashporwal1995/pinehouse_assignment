class Staff {
  final String name;
  final int age;
  final String phoneNumber;
  final String profilePicture;
  final String department;

  const Staff(
    this.name,
    this.age,
    this.phoneNumber,
    this.profilePicture,
    this.department,
  );

  Staff.fromMap(Map<String, dynamic> map)
      : this(
          map['name'],
          map['age'],
          map['phone'],
          map['profile'],
          map['dept'],
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'phone': phoneNumber,
      'profile': profilePicture,
      'dept': department
    };
  }
}
