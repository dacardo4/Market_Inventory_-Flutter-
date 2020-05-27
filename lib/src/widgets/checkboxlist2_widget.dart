import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'dart:collection';

class MyCheckBoxListWidget2 extends StatefulWidget {
  MyCheckBoxListWidget2({Key key}) : super(key: key);

  @override
  _MyCheckBoxListWidget2State createState() => _MyCheckBoxListWidget2State();
}

class _MyCheckBoxListWidget2State extends State<MyCheckBoxListWidget2> {
  var _isSelected = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _myList(),
    );
    // return LabeledCheckbox(
    //   label: 'This is the label text',
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //   value: _isSelected,
    //   onChanged: (bool newValue) {
    //     setState(() {
    //       _isSelected = newValue;
    //     });
    //   },
    // );
  }

  Widget _myList() {
    return FutureBuilder(
      //future: productProvider.getData(),
      future: getQuantityshoppingListProvider.getData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemsList(snapshot.data, context),
        );
      },
    );
  }

  String name = '';

  List<Widget> _itemsList( List<dynamic> data, BuildContext context ) {

    data.sort((a, b) {
      return a['product']['productName'].toString().toLowerCase().compareTo(b['product']['productName'].toString().toLowerCase());
    });  
    // var temp= { 
    //   'A' : 3,
    //   'B' : 1,
    //   'C' : 2
    // };
    // var sortedKeys = temp.keys.toList(growable:false)
    // ..sort((k1, k2) => temp[k1].compareTo(temp[k2]));
    // LinkedHashMap sortedMap = new LinkedHashMap
    //   .fromIterable(sortedKeys, key: (k) => k, value: (k) => temp[k]);

    final List<Widget> opciones = [];
    data.forEach( (opt) {
      var index = data.indexOf(opt);
      _isSelected.add(false);
      name = opt['quantityToBuy'].toString() + ' - ' + opt['product']['productName'];
      final contTemp = Dismissible(
        key: Key(index.toString()),
        child: Container(
          height: 50,
          color: Colors.amber[100],
          child: Center(
            child: Text(
              "$name",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
              )
            ),
          ),
        ),
      );
      // final contTemp2 = LabeledCheckbox(
      //   label: name,
      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //   value: _isSelected[index],
      //   onChanged: (bool newValue) {
      //     setState(() {
      //       _isSelected[index] = newValue;
      //     });
      //   },
      // );
      opciones..add(contTemp);
              //..add(Divider());
    });
    return opciones;
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}