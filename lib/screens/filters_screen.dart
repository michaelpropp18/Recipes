import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.setFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutonFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    super.initState();
    _glutonFree = widget.currentFilters['gluton'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filters = {
                  'gluton': _glutonFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                return widget.setFilters(filters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text('Adjust your meal selection',
                    style: Theme.of(context).textTheme.headline6)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Gluton Free',
                      'Only include gluton free meals',
                      _glutonFree, (bool value) {
                    setState(() {
                      _glutonFree = value;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose Free',
                      'Only include lactose free meals',
                      _lactoseFree, (bool value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegetarian',
                      'Only include vegetarian meals',
                      _vegetarian, (bool value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', 'Only include vegan meals', _vegan,
                      (bool value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
