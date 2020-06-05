import 'package:flutter/material.dart';

showMyInformationAlert(BuildContext context, String from) {
  Map<String,String> data = {
    'tittle':'',
    'info01':'',
  };
  switch(from) {
    case 'error': {
      data['tittle'] = 'Error';
      data['info01'] = 'No se ha podido completar la petición, contacte al administrador del sistema.';
    } break;
    case 'postProducts': {
      data['tittle'] = 'Producto Creado';
      data['info01'] = 'El producto se ha creado con exito.';
    } break;
    case 'patchProducts': {
      data['tittle'] = 'Producto Actualizado';
      data['info01'] = 'El producto se ha actualizado con exito.';
    } break;
    case 'emptyName': {
      data['tittle'] = 'Error';
      data['info01'] = 'El nombre no puede estar vacio.';
    } break;
    case 'sameData': {
      data['tittle'] = 'Alerta';
      data['info01'] = 'No se detectaron cambios.';
    } break;
  }
  myInformationAlert(context, data);
}

Future<void> myInformationAlert(BuildContext context, Map<String,String> data) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button to close!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(data['tittle']),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(data['info01']),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<String> myGetInputDialog(BuildContext context, String actualProductName) async {
  TextEditingController controlador = TextEditingController();
  controlador.text = actualProductName;
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Ingresa el nuevo nombre'),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
                  controller: controlador,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Nombre del Producto'
                  ),
              )
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(controlador.text);
            },
          ),
        ],
      );
    },
  );
}