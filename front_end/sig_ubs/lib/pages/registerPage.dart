import 'package:flutter/material.dart';
import '../context/createAccount.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeValue = TextEditingController();
  final TextEditingController _cpfValue = TextEditingController();
  final TextEditingController _telefoneValue = TextEditingController();
  final TextEditingController _nascimentoValue = TextEditingController();
  final TextEditingController _senhaValue = TextEditingController();
  final TextEditingController _senhaDoisValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        title: const Text(
          'Voltar',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 148, 219),
              Color.fromARGB(255, 52, 98, 159),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Preencha os campos abaixo para melhor experiência.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _nomeValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Nome e Sobrenome',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu nome e sobrenome';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _cpfValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu cpf';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _telefoneValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Telefone',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu número de telefone';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _nascimentoValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Data de Nascimento',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua data de nascimento';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _senhaValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _senhaDoisValue,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Confirme sua senha',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha novamente';
                            }
                            // else if (value != _senhaValue) {
                            //   return 'Senhas diferentes! Insira a senha novamente';
                            // }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              if (_senhaValue.text == _senhaDoisValue.text) {
                                createAccount(
                                    context,
                                    _nomeValue.text,
                                    _cpfValue.text,
                                    _telefoneValue.text,
                                    _nascimentoValue.text,
                                    _senhaValue.text);
                              }

                              // funcao de criar a conta
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(300, 40),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Cadastrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    '../../assets/logo.png', // Caminho para sua imagem
                    height: 50, // Ajuste o tamanho conforme necessário
                  ),
                  const SizedBox(width: 10), // Espaço entre a imagem e o texto
                  const Text(
                    'SIG-UBS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
