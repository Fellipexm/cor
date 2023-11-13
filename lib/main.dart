import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo Básico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedItem = 'Confiável'; // Valor padrão selecionado no dropdown

  List<String> _dropdownItems = ['Confiável', 'Amigável', 'Animado', 'Em Paz']; // Substituído 'Divertido' por 'Em Paz'

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    // Define a cor de fundo com base na opção selecionada
    if (_selectedItem == 'Confiável') {
      backgroundColor = Colors.blue;
    } else if (_selectedItem == 'Amigável') {
      backgroundColor = Colors.green;
    } else if (_selectedItem == 'Animado') {
      backgroundColor = Colors.yellow;
    } else if (_selectedItem == 'Em Paz') { // Alterado de 'Divertido' para 'Em Paz'
      backgroundColor = Colors.pink;
    } else {
      backgroundColor = Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Fique feliz'),
      ),
      body: Container(
        color: backgroundColor, // Define a cor de fundo de todo o aplicativo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selecione uma opção:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                items: _dropdownItems.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Opção selecionada: $_selectedItem',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
