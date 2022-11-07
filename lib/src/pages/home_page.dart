import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /**
     * FutureBuilder Es un widget que construye de manera
     * asyncrona y mientras se carga puede tener un dato inicial
     * Parametros:
     * future: se pone el metodo de la llamada de datos
     * initialData: Datos iniciales mientras carga
     * builder: Lo que se ejecute una vez que se tenga respuesta
     */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /*final route = MaterialPageRoute(builder: (context) => AlertPage());

          Navigator.push(context, route);*/
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;

    /*return [
      ListTile(
        title: Text('Hola..'),
        onTap: () {
          print('asd');
        },
      ),
      Divider(),
      ListTile(
        title: Text('Hola1'),
      ),
      Divider(),
      ListTile(
        title: Text('Hola2'),
      ),
      Divider()
    ];*/
  }
}
