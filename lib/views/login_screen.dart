import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_idea/models/info_user.dart';
import 'package:weather_idea/models/user_manager.dart';
import 'package:weather_idea/views/weather_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/clouds.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Consumer<UserManager>(
                builder: (context, userManager, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: TextFormField(
                          focusNode: emailFocusNode,
                          cursorColor: Colors.white,
                          controller: _emailController,
                          enabled: !userManager.loading,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha seu E-mail';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(0, 122, 180, 1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 122, 180, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 122, 180, 1),
                              ),
                            ),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, bottom: 24),
                        child: TextFormField(
                          focusNode: passwordFocusNode,
                          cursorColor: Colors.white,
                          controller: _passController,
                          enabled: !userManager.loading,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha sua senha';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(0, 122, 180, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 122, 180, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 122, 180, 1),
                              ),
                            ),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24, left: 24),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: userManager.loading
                                  ? MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 122, 180, 1)
                                          .withOpacity(0.2))
                                  : MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 122, 180, 1)),
                            ),
                            onPressed: userManager.loading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      final userApp = InfoUser(
                                        name: '',
                                        email: _emailController.text,
                                        password: _passController.text,
                                      );
                                      userManager.signIn(
                                        userApp: userApp,
                                        failFunction: (code) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text('$code'),
                                              duration:
                                                  const Duration(seconds: 1),
                                            ),
                                          );
                                        },
                                        sucessFunction: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const WeatherScreen(),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                            child: userManager.loading
                                ? const CircularProgressIndicator(
                                    backgroundColor:
                                        Color.fromRGBO(0, 122, 180, 1),
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, right: 24),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/signup')
                                  .then((_) {
                                _emailController.clear();
                                _passController.clear();
                                emailFocusNode.unfocus();
                                passwordFocusNode.unfocus();
                              });
                            },
                            child: const Text(
                              'Registre-se',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
