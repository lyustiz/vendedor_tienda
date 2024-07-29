part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String usuario;
  final String password;

  const AuthLogin({required this.usuario, required this.password});

  @override
  List<Object> get props => [usuario, password];
}

class AuthLogout extends AuthEvent {
  final String logged;

  const AuthLogout(this.logged);

  @override
  List<Object> get props => [logged];
}
