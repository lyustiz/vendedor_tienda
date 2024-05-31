import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/recover/recover_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isObscureText = true;

  void _toggle() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return FormBuilder(
            key: _formKey,
            enabled: state is! AuthLoading,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: FormBuilderTextField(
                        name: 'inputUser',
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Colors.amber),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Usuario',
                          labelStyle: const TextStyle(color: Colors.amber),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          isDense: true,
                          prefixIcon: const Icon(Icons.account_circle),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'El usuario es requerido'),
                          FormBuilderValidators.min(3),
                          FormBuilderValidators.maxLength(70),
                        ]),
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primaryContainer
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.perm_identity,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(children: [
                    Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: FormBuilderTextField(
                          name: 'inputPasword',
                          style: const TextStyle(color: Colors.amber),
                          keyboardType: TextInputType.text,
                          obscureText: _isObscureText,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Contraseña',
                              filled: true,
                              isDense: true,
                              labelStyle: const TextStyle(color: Colors.amber),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(_isObscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'La contraseña es requerida'),
                            FormBuilderValidators.minLength(5,
                                errorText:
                                    'La contraseña debe tener al menos 5 caracteres'),
                          ]),
                        )),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primaryContainer
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.lock,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      height: 7,
                      child: _loginLoadind(context, state)),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      height: 40,
                      child: _loginStateText(context, state)),
                  Container(
                      width: 300,
                      height: 45,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primaryContainer,
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: const Text(
                          'ingresar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () {
                          login(context);
                        },
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () => pushScreen(context, const RecoverScreen()),
                    child: const Text('Olvidaste tu contraseña?'),
                  )
                ],
              ),
            ));
      },
    );
  }

  void login(BuildContext context) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.save();
      if (formStatus.validate()) {
        final String inputUser = formStatus.value['inputUser'];
        final String inputPasword = formStatus.value['inputPasword'];
        context
            .read<AuthBloc>()
            .add(AuthLogin(usuario: inputUser, password: inputPasword));
      } else {
        print("validation failed");
      }
    }
  }

  Widget? _loginLoadind(context, state) {
    if (state is AuthLoading) return const LinearProgressIndicator();
    return null;
  }

  Widget _loginStateText(context, state) {
    String textMessage = (state is AuthLoading) ? state.message : '';
    textMessage = (state is AuthError) ? state.error : textMessage;
    return Text(textMessage);
  }
}
