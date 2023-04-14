// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/api.dart';
import 'package:http/http.dart' as http;
import 'nav.dart';
import 'api.dart';

class Order extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [Cardapio()],
            ),
          ),
        ),
      ),
    );
  }
}

class Cardapio extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  List _pedidos = [];

  @override
  void initState() {
    super.initState();
    _getPedido();
  }

  void _getPedido() async {
    final pedidos = await CardapioApi.getPedido();
    setState(() {
      _pedidos = pedidos as List;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(   
              child: Column(
                children: [
                  Text(
                    'Customer Orders',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(128, 0, 0, 1)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Nome')),
                          DataColumn(label: Text('Sobrenome')),
                          DataColumn(label: Text('Endereço')),
                          DataColumn(label: Text('Telefone')),
                          DataColumn(label: Text('Lanche')),
                          DataColumn(label: Text('Bebida')),
                          DataColumn(label: Text('Acompanhamento')),
                          DataColumn(label: Text('Valor')),
                        ],
                        rows: _pedidos.map((pedido) => DataRow(
                          cells: [
                            DataCell(Text('${pedido['nome_cliente']}')),
                            DataCell(Text('${pedido['sobrenome_cliente']}')),
                            DataCell(Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text('${pedido['endereco_cliente']}'),
                            )),
                            DataCell(Text('${pedido['telefone_cliente']}')),
                            DataCell(Text('${pedido['lanche']}')),
                            DataCell(Text('${pedido['bebida']}')),
                            DataCell(Text('${pedido['acompanhamento']}')),
                            DataCell(Text('${pedido['valor_total']}')),
                          ]
                        )).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ], // CHILDREN PRINCIPAL
        ),
      ),
    );
  }
}