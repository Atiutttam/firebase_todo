class UserModel{
  String ? name;
  String ? email;
  String ? mobNumber;
  String ? gender;
  String? age;

  UserModel({
    required this.name,
    required this.email,
    required this.mobNumber,
    required this.gender,
    required this.age
});

  factory UserModel.fromDoc(Map<String,dynamic>doc){
    return UserModel(
        name: doc['name'],
        email: doc['email'],
        mobNumber: doc['mobNumber'] ,
        gender: doc['gender'],
        age: doc['age']);
  }

  Map<String, dynamic> toDoc(){
    return {
      "name" : name,
      "email" : email,
      "mobNumber" : mobNumber,
      "gender" : gender,
      "age" : age,
    };
  }

}