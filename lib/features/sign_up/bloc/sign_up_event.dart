abstract class SignUpEvent {}

class SignUpRequested extends SignUpEvent {
  final String fullname;
  final String email;
  final String password;

  SignUpRequested(this.fullname, this.email, this.password);
}
