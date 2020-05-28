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
    case 'newCase': {
      data['tittle'] = 'Producto Creado';
      data['info01'] = 'El producto se ha creado con exito.';
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
