import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  bool isEnableButton = false;
  bool obscureText = true;
  bool _isSenhaIncorreta = false; // Variável para controlar erro

  @override
  void initState() {
    super.initState();
    _email.addListener(_checkedFields);
    _senha.addListener(_checkedFields);
  }

  void _checkedFields() {
    setState(() {
      isEnableButton = _email.text.isNotEmpty && _senha.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _senha.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/car.png'),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'email@email.com',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Senha',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _senha,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: obscureText
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        hintText: '********',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _isSenhaIncorreta
                                  ? Colors.red
                                  : Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isEnableButton
                        ? const WidgetStatePropertyAll(Colors.blue)
                        : const WidgetStatePropertyAll(Colors.grey),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: const WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: isEnableButton
                      ? () {
                          if (_email.text == 'kaique' && _senha.text == '123') {
                            setState(() {
                              _isSenhaIncorreta = false;
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Bem Vindo Kaique'),
                                contentPadding: const EdgeInsets.all(20),
                                content: const Text(
                                  'Login Bem Sucessedido. Bem Vindo ao APP!',
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: [
                                  TextButton(
                                    style: const ButtonStyle(
                                        foregroundColor: WidgetStatePropertyAll(
                                            Colors.blue)),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/home',
                                              (Route<dynamic> route) => false);
                                    },
                                    child: const Text('Obrigado!'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            setState(() {
                              _isSenhaIncorreta = true;
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Erro de Login'),
                                contentPadding: const EdgeInsets.all(20),
                                content: const Text(
                                  'Email ou senha incorretos. Tente Novamente!',
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: [
                                  TextButton(
                                    style: const ButtonStyle(
                                        foregroundColor: WidgetStatePropertyAll(
                                            Colors.blue)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      : null,
                  child: const Text('ENTRAR'),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(Colors.transparent),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    foregroundColor: WidgetStatePropertyAll(Colors.blue),
                    side: WidgetStatePropertyAll(BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    )),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  child: const Text('CADASTRAR'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
