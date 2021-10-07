import 'package:flutter/material.dart';

/*
  Código realizado a partir del curso:
  Flutter: Tu guía completa de desarrollo para iOS y Android
*/

class ContadorPage extends StatefulWidget {
  @override
  createState() {
    return _ContadorPageState();
  }
}

// con el _ en el nombre de la clase se indica que es privada
class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contador numérico'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número de clicks:',
              style: _estiloTexto,
            ),
            Text(
              // Interpolación de string
              '$_conteo',
              style: _estiloTexto,
            ),
          ],
        )),
        // Se crea el método _crearBotones para hacer mas legible el código
        floatingActionButton: _crearBotones()
        //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _reset),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer),
        SizedBox(width: 5.0),
        // La función _agregar no lleva los paréntesis para evitar que se construya
        // cuando se inicializa la clase.
        // Se puede usar el valor de null en onPressed para deshabilitar la función del botón.
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar),
      ],
    );
  }

  // Método privado
  void _agregar() {
    // Forma de declaración del setState
    setState(() {
      _conteo++;
    });
  }

  void _sustraer() {
    // Forma reducida de la declaración del setState
    setState(() => _conteo--);
  }

  void _reset() {
    setState(() => _conteo = 0);
  }
}
