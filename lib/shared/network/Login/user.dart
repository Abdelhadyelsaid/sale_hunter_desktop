
class User{
  String fullname;
  String email;
  String password;
  String confirm_password;
  String image;

  User({this.fullname,this.email,this.password,this.confirm_password,this.image});

  factory User.fromJson(Map<String,dynamic> responseData){
    return User(
      fullname: responseData['fullname'],
      email : responseData['email'],
      password: responseData['password'],
      confirm_password: responseData['passwordConfirm'],
      image: responseData['profile-img']
    );
  }
}