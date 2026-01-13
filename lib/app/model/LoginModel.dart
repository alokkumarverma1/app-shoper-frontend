class LoginModel {
  final String mail;
  final String password;

  LoginModel({ required this.mail, required this.password});

  Map<String,dynamic> getJson(){
    return {
      "mail" :mail,
      "password" : password,
    };
  }



}