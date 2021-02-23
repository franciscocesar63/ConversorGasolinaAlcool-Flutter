import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController _gasolina = new TextEditingController();
  TextEditingController _alcool = new TextEditingController();

  double _calculo = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Gasolina x Alcool"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Coloque o preço da Gasolina e do Álcool para comparar",
          style: TextStyle(fontSize: 30),
        ),
        Divider(),
        TextFormField(
          controller: _gasolina,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: CircleAvatar(
              child: Text(
                "R\$",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
            hintText: "Gasolina",
          ),
        ),
        TextFormField(
          controller: _alcool,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: CircleAvatar(
              child: Text(
                "R\$",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
            hintText: "Álcool",
          ),
        ),
        RaisedButton(
          onPressed: () {
            _botao();
          },
          child: Text("Calcular"),
        ),
        if (_calculo != null)
          _calculo < 0.73
              ? Text("Melhor opção é Álcool")
              : Text("Melhor opção é Gasolina")
      ],
    );
  }

  void _botao() {
    var a = double.parse(_alcool.text);
    var g = double.parse(_gasolina.text);
    setState(() {
      _calculo = a / g;
      print(_calculo);
    });
  }
}
