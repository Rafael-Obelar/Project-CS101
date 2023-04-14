// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/api.dart';
import 'package:flutter_application_1/pages/order.dart';
import 'package:http/http.dart' as http;
import 'make.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text('Welcome to snack bar CS101, choose what you want to do',
            style:TextStyle(
              fontSize: 23,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold

            ),
            ),
          ),

          SizedBox(width: 60, height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(128, 0, 0, 1)),
                  child: Text('Place Orders'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage2()),
                    );
                  },
                ),
              ),
              SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(128, 0, 0, 1)),
                  child: Text('Customer Orders'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Order()),
                    );
                  },
                ),
              ),
            ],
          ),
/*
SizedBox(height: 80),
          TextField(
            controller: _pokemonNameController,
            decoration: InputDecoration(
              labelText: 'Enter Pokemon Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(128, 0, 0, 1),
            ),
            onPressed: _getPokemonName,
            child: Text('Get Pokemon Name'),
          ),
          SizedBox(height: 16.0),
          if (_pokemonName.isNotEmpty) Text(_pokemonName.toLowerCase()),
          */
        ],
      ),
    );
  }
}
