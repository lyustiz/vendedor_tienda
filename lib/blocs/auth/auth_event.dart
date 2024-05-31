part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String usuario;
  final String password;

  const AuthLogin({required String usuario, required String password})
      : this.usuario = usuario,
        this.password = password;

  @override
  List<Object> get props => [usuario, password];
}

class AuthLogout extends AuthEvent {
  final String logged;

  const AuthLogout(this.logged);

  @override
  List<Object> get props => [this.logged];
}
