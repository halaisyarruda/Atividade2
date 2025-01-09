import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _output = '0';
  String _entrada = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operador = '';

  void _botaoPressionado(String botaoTexto) {
    setState(() {
      if (botaoTexto == 'C') {
        _entrada = '';
        _output = '0';
        _num1 = 0;
        _num2 = 0;
        _operador = '';
      } else if (botaoTexto == '+' || botaoTexto == '-' || botaoTexto == '*' || botaoTexto == '/') {
        _num1 = double.parse(_entrada);
        _operador = botaoTexto;
        _entrada = '';
      } else if (botaoTexto == '=') {
        _num2 = double.parse(_entrada);
        if (_operador == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operador == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operador == '*') {
          _output = (_num1 * _num2).toString();
        } else if (_operador == '/') {
          _output = (_num1 / _num2).toString();
        }
        _entrada = _output;
      } else {
        _entrada += botaoTexto;
        _output = _entrada;
      }
    });
  }

  Widget _buildBotao(String botaoTexto) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _botaoPressionado(botaoTexto),
        child: Text(
          botaoTexto,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  _buildBotao('7'),
                  _buildBotao('8'),
                  _buildBotao('9'),
                  _buildBotao('/'),
                ],
              ),
              Row(
                children: [
                  _buildBotao('4'),
                  _buildBotao('5'),
                  _buildBotao('6'),
                  _buildBotao('*'),
                ],
              ),
              Row(
                children: [
                  _buildBotao('1'),
                  _buildBotao('2'),
                  _buildBotao('3'),
                  _buildBotao('-'),
                ],
              ),
              Row(
                children: [
                  _buildBotao('C'),
                  _buildBotao('0'),
                  _buildBotao('='),
                  _buildBotao('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}