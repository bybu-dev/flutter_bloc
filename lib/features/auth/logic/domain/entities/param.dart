class SignInParam {
  String? email;
  String? password;

  SignInParam({this.email, this.password});
}

class SignUpParam {
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;

  SignUpParam({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.password,
  });
}