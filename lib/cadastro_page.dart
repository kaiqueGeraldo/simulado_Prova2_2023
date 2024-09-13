import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;

  final TextEditingController _controllerSenha = TextEditingController();
  final TextEditingController _controllerConfirmSenha = TextEditingController();

  String? _validatePassword(String? senha) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d.*\d)[a-zA-Z\d_.]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (senha == null || senha.isEmpty) {
      return 'A senha não pode estar vazia';
    } else if (!regExp.hasMatch(senha)) {
      return 'A senha deve conter:\n- 8 Caracteres\n- Pelo menos uma letra minúscula\n- Uma letra maiúscula\n- Pelo menos 2 números\n- Somente os caracteres: a-z, A-Z, 0-9, "_", "."';
    }
    return null;
  }

  String? _validateConfirmPassword(String? confirmSenha) {
    if (confirmSenha == null || confirmSenha.isEmpty) {
      return 'A senha não pode estar vazia';
    } else if (_controllerSenha.text != _controllerConfirmSenha.text) {
      return 'As senhas não coicidem';
    }
    return null;
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Apelido',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Apelido',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Senha',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _controllerSenha,
                        obscureText: isVisiblePassword,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisiblePassword = !isVisiblePassword;
                              });
                            },
                            icon: isVisiblePassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: _validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Confirme sua Senha',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _controllerConfirmSenha,
                        textCapitalization: TextCapitalization.none,
                        obscureText: isVisibleConfirmPassword,
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: isVisibleConfirmPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isVisibleConfirmPassword =
                                    !isVisibleConfirmPassword;
                              });
                            },
                          ),
                        ),
                        validator: _validateConfirmPassword,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    }
                  },
                  child: const Text('CADASTRAR'),
                ),
              ),
              const SizedBox(height: 20),
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
                    Navigator.of(context).pop();
                  },
                  child: const Text('VOLTAR'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
