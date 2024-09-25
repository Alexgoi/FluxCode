// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_barber/data/dummy_users.dart';
import 'package:your_barber/models/user.dart';
import 'package:your_barber/provider/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'You Care',
        home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('You Care'),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.account_circle_rounded))
        ],
      ),
      body: Center(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logotipo
            //Image.asset('assets/logo.png', height: 150),
            //const SizedBox(height: 20),
            // Texto de Boas-vindas
            const Text(
              'Bem-vindo à You Care',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cuidados especiais para você!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            // Botões de navegação
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de agendamento
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Agendar Horário'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de serviços
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Serviços'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela sobre nós
              },
              child: const Text('Sobre Nós'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de contato
              },
              child: const Text('Contato'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You care"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text("Digite seus dados aqui"),
            const SizedBox(
              height: 10,
            ),
            const CupertinoTextField(
              cursorColor: Colors.black,
              padding: EdgeInsets.all(15),
              placeholder: "Digite seu email",
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
            ),
            const SizedBox(height: 15),
            const CupertinoTextField(
              cursorColor: Colors.black,
              padding: EdgeInsets.all(15),
              placeholder: "Digite sua senha",
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.greenAccent,
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.greenAccent,
              )),
              child: CupertinoButton(
                  child: const Text(
                    "Crie a sua conta",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext cxt) {
                          return const AlertDialog(
                            content: CriarConta(),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => DialogoCriar();
}

class DialogoCriar extends State<CriarConta> {
  @override
  Widget build(BuildContext context) {
    final Users user = Provider.of(context);
    final _form = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text("Digite seus dados para cadastro"),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.black,
                //padding: EdgeInsets.all(15),
                //placeholder: "Digite seu nome",
                validator: (value) {
                  return 'Erro';
                },
                //decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(7))
                //),
              ),
              const SizedBox(
                height: 10,
              ),
              const CupertinoTextField(
                cursorColor: Colors.black,
                padding: EdgeInsets.all(15),
                placeholder: "Digite seu email",
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7))),
              ),
              const SizedBox(height: 15),
              const CupertinoTextField(
                cursorColor: Colors.black,
                padding: EdgeInsets.all(15),
                placeholder: "Digite sua senha",
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7))),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(17),
                  color: Colors.greenAccent,
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    _form.currentState?.validate();
                    _form.currentState?.save();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
