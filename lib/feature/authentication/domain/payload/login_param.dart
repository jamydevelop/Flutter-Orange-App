class LoginParam {

  final String email;
  final String password;

  LoginParam({
    required this.email,
    required this.password
  });

  toJson() => {
    'txtEmail': email,
    'txtPassword': password,
    'login': '',
    'hiddentype': 'student-cd73502828457d15655bbd7a63fb0bc8',
    'csrf_test_name': '2b300dd86c5b16c7ecac5939637e207c'
  };
}