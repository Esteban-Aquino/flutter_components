import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 300.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(), //
            _crearCheckbox(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        max: 400,
        min: 10.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                  print(valor);
                });
              });
  }

  Widget _crearImagen() {
    return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        height: _valorSlider,
        fit: BoxFit.contain,
        image: NetworkImage(
            'http://www.pngall.com/wp-content/uploads/4/Justice-League-PNG.png'));
  }

  Widget _crearCheckbox() {
    /*return Checkbox(
                    value: _bloquearCheck, //
                    onChanged: (valor) {
                      setState(() {
                        _bloquearCheck = valor;
                      });
                    });*/
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck, //
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck, //
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
