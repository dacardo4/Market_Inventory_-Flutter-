import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FadeInImage(
                  image: NetworkImage('https://www.caracteristicas.co/wp-content/uploads/2018/10/galaxias-origen-e1538505946757.jpg'),
                  placeholder: AssetImage('assets/original.gif'),
                  fadeInDuration: Duration( milliseconds: 200),
                  //width: 0.1,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: 150,
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('nombre'),
                      Text(''),
                      Text('Cantidad'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('Editar'),
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de la Card'),
            subtitle: Text('Aqui osiudhjfgedksgois  ierjgojerhg  ejkgoerig eroj tieoríg e erigujoier ij gk e g0ire i eo ertpo jg e eori goe goíer uoei´r góij goiaeru guoisertjg oisreg eoi geriu gre '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://www.caracteristicas.co/wp-content/uploads/2018/10/galaxias-origen-e1538505946757.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text ('Descripcion de la imagen'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          ),
        ],
        //color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
