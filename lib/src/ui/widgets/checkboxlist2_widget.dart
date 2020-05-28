import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';

class MyCheckBoxListWidget2 extends StatefulWidget {
  MyCheckBoxListWidget2({Key key}) : super(key: key);

  @override
  _MyCheckBoxListWidget2State createState() => _MyCheckBoxListWidget2State();
}

class _MyCheckBoxListWidget2State extends State<MyCheckBoxListWidget2> {
  var _isSelected = [];
  BuildContext generalContext;

  @override
  Widget build(BuildContext context) {
    generalContext = context;
    return Center(
      child: _myList(),
    );
  }

  Widget _myList() {
    return FutureBuilder(
      future: quantityProvider.getQuantityShoppingList(generalContext),
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