import 'package:condo_news/domain/helper/messages.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameEC = TextEditingController();
  final passwordEC = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    usernameEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

  void login(BuildContext context) {
    authService
        .authenticate(usernameEC.text, passwordEC.text)
        .then((value) => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.lightGrey,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.textLogo,
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Usuário',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsConstants.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  TextFormField(
                                    onTapOutside: (_) => unfocus(context),
                                    validator: Validatorless.required(
                                        'Usuário é obrigatório'),
                                    controller: usernameEC,
                                    style: const TextStyle(
                                      color: ColorsConstants.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: const InputDecoration(
                                      errorStyle: TextStyle(
                                        color: ColorsConstants.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Senha',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsConstants.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  TextFormField(
                                    onTapOutside: (_) => unfocus(context),
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                          'Senha é obrigatória'),
                                      Validatorless.min(6,
                                          'Senha deve conter pelo menos 6 caracteres'),
                                    ]),
                                    obscureText: true,
                                    controller: passwordEC,
                                    style: const TextStyle(
                                      color: ColorsConstants.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: const InputDecoration(
                                      errorStyle: TextStyle(
                                        color: ColorsConstants.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsConstants.blue,
                                  minimumSize: const Size.fromHeight(
                                    56,
                                  ),
                                ),
                                onPressed: () {
                                  switch (formKey.currentState?.validate()) {
                                    case (false || null):
                                      Messages.showError(
                                        'Verifique usuário e senha',
                                        context,
                                      );
                                    case true:
                                      login(context);
                                  }
                                },
                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    color: ColorsConstants.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/auth/register/user');
                        },
                        child: const Text(
                          'Nova conta',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsConstants.blue,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
