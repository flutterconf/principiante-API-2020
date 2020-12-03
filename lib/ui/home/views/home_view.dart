// import 'dart:html';
import 'package:flutter/material.dart';
import '../../../bloc/personajesBloc.dart';
import '../../widgets/character.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  Widget _tituloPedidoPendiente() {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
      child: Text(
        'Desliza a izquierda o derecha',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _deltaX;
    personajesBloc.pedirPersonaje();

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _tituloPedidoPendiente(),
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.cancel_outlined, color: Colors.green, size: 40),
              Icon(Icons.favorite_border, color: Colors.red, size: 40),
            ],
          ),
          padding: EdgeInsets.only(top: 20),
        ),
        Container(
          child: GestureDetector(
            child: StreamBuilder(
              initialData: personajesBloc.data,
              stream: personajesBloc.getStream,
              builder: (context, AsyncSnapshot snapshot) {
                Widget widget;

                if(snapshot.data['enPantalla'] != null){
                  widget = Character(amongUsCharacter: snapshot.data['enPantalla']);
                } else {
                  widget = Center(child: Text('No hay personajes para mostrar'));
                }

                return widget;
              }
            ),
            onPanUpdate: (details) {
              _deltaX = details.delta.dx;
            },
            onPanEnd: (details) {
              if (_deltaX > 0) {
                personajesBloc.pedirPersonaje();
              } else {
                personajesBloc.pedirPersonaje();
              }
            },
          ),
          padding: EdgeInsets.only(top: 50),
        ),
      ],
    );
  }
}
