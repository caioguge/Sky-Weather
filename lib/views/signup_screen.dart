import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            letterSpacing: -1,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 122, 180, 1),
      ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: nameController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Preencha seu nome';
                        } else if (value.length < 3) {
                          return 'Preencha um nome válido';
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
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: emailController,
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
                    padding:
                        const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: passController,
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
                        } else if (value.length < 6) {
                          return 'Cadastre uma senha com mais de 6 dígitos';
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
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(0, 122, 180, 1),
                          ),
                        ),
                        onPressed: () {
                          // Realizar lógica de cadastro.
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Cadastro realizado com sucesso!'),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Registrar',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
