import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';

class MyCheckBoxListWidget extends StatefulWidget {
  MyCheckBoxListWidget({Key key}) : super(key: key);

  @override
  _MyCheckBoxListWidgetState createState() => _MyCheckBoxListWidgetState();
}

class _MyCheckBoxListWidgetState extends State<MyCheckBoxListWidget> {
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
    final List<Widget> opciones = [];
    data.forEach( (opt) {
      var index = data.indexOf(opt);
      _isSelected.add(false);
      name = opt['quantityToBuy'].toString() + ' - ' + opt['product']['productName'];
      final contTemp2 = LabeledCheckbox(
        label: name,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        value: _isSelected[index],
        onChanged: (bool newValue) {
          setState(() {
            _isSelected[index] = newValue;
          });
        },
      );
      opciones..add(contTemp2)
              ..add(Divider());
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