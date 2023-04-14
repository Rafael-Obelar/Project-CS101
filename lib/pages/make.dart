// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/api.dart';
import 'package:http/http.dart' as http;
import 'nav.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage2> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255)
                ])),
            child: Column(
              children: [
                Nav(),
                Cardapio()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Cardapio extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String _lanche;
  late String _bebida;
  late String _acompanhamento;
  late String _nome;
  late String _sobrenome;
  late String _valor;
  late String _telefone;
  late String _endereco;

  void _enviarFormulario() async {
    final form = _formKey.currentState;
    form!.save();
    var url = Uri.parse('http://35.175.143.13:5000/pedidos');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    _valor = '200';
    var response = await http.post(url,
        body: json.encode({
          'nome_cliente': _nome,
          'sobrenome_cliente': _sobrenome,
          'endereco_cliente': _endereco,
          'lanche': _lanche,
          'bebida': _bebida,
          'telefone_cliente': _telefone,
          'valor_total': _valor,
          'acompanhamento': _acompanhamento,
        }),
        headers: headers);
    if (response.statusCode == 200) {
      // sucesso
      print('Pedido enviado com sucesso!');
    } else {
      // erro
      print('Erro ao enviar pedido: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Text(
                    'Make a Order',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(128, 0, 0, 1)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                            flex: 1,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    label: const Center(
                                      child: Text('Nome do cliente'),
                                    ),
                                    hintText: 'Ex: Victor'),
                                onSaved: (String? value) {
                                  print('teste');
                                  _nome = value!;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                          flex: 1,
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: const Center(
                                    child: Text('Sobrenome do cliente'),
                                  ),
                                  hintText: 'Ex: Antoniazzi'),
                              onSaved: (String? value) {
                                _sobrenome = value!;
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                            flex: 1,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    label: const Center(
                                      child: Text('Endereço para entrega'),
                                    ),
                                    hintText: 'Ex: Av Visconde de Mauá'),
                                onSaved: (String? value) {
                                  _endereco = value!;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                          flex: 1,
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: const Center(
                                    child: Text('Telefone para contato'),
                                  ),
                                  hintText: 'Ex: (DDD) 99999-9999'),
                              onSaved: (String? value) {
                                _telefone = value!;
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                            flex: 1,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    label: const Center(
                                      child: Text('Lanche'),
                                    ),
                                    hintText: 'Ex: Xis Salada'),
                                onSaved: (String? value) {
                                  _lanche = value!;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                          flex: 1,
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: const Center(
                                    child: Text('Bebida'),
                                  ),
                                  hintText: 'Ex: Coca-cola'),
                              onSaved: (String? value) {
                                _bebida = value!;
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Flexible(
                      child: Container(
                        width: 400,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: const Center(
                                child: Text('Acompanhamento'),
                              ),
                              hintText: 'Ex: Batata Frita'),
                          onSaved: (String? value) {
                            _acompanhamento = value!;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(128, 0, 0, 1)),
                        onPressed: _enviarFormulario,
                        child: Text(
                          'Enviar pedido',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )));
  }
}
