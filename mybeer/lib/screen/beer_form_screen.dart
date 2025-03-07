import 'package:flutter/material.dart';
import 'package:mybeer/data/database_data.dart';
import 'package:mybeer/model/beer.dart';
import 'package:mybeer/model/beer_type.dart';
import 'package:mybeer/widget/beer_type_selector_widget.dart';
import 'package:mybeer/widget/color_picker.dart';

class BeerFormScreen extends StatefulWidget {
  const BeerFormScreen({super.key, this.beer});
  final Beer? beer;

  @override
  BeerFormScreenState createState() => BeerFormScreenState();
}

class BeerFormScreenState extends State<BeerFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  static final List<Color> _colors = [
    Color(0xFF000000),
    Color(0xFFFFFFFF),
    Color(0xFF947867),
    Color(0xFFC89234),
    Color(0xFF862F07),
    Color(0xFF2F1B15),
  ];
  static final List<BeerType> beerTypeList = [];

  final DatabaseService _databaseService = DatabaseService();

  int _selectedColor = 0;
  int _selectedBeerType = 0;

  @override
  void initState() {
    super.initState();
    if (widget.beer != null) {
      _nameController.text = widget.beer!.name;
      _selectedColor = _colors.indexOf(widget.beer!.color);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<List<BeerType>> _getBeerTypes() async {
    final beerTypes = await _databaseService.beerTypes();
    if (beerTypeList.isEmpty) beerTypeList.addAll(beerTypes);
    if (widget.beer != null) {
      _selectedBeerType = beerTypeList.indexWhere(
        (e) => e.id == widget.beer!.typeId,
      );
    }
    return beerTypeList;
  }

  Future<void> _onSave() async {
    final name = _nameController.text;
    final color = _colors[_selectedColor];
    final beerType = beerTypeList[_selectedBeerType];

    // Add save code here
    widget.beer == null
        ? await _databaseService.insertBeer(
          Beer(name: name, color: color, typeId: beerType.id!),
        )
        : await _databaseService.updateBeer(
          Beer(
            id: widget.beer!.id,
            name: name,
            color: color,
            typeId: beerType.id!,
          ),
        );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beer Record'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the beer here',
              ),
            ),
            SizedBox(height: 16.0),
            // Color Picker
            ColorPicker(
              colors: _colors,
              selectedIndex: _selectedColor,
              onChanged: (value) {
                setState(() {
                  _selectedColor = value;
                });
              },
            ),
            SizedBox(height: 24.0),
            // Beer Type Selector
            FutureBuilder<List<BeerType>>(
              future: _getBeerTypes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading beer types...");
                }
                return BeerTypeSelector(
                  beerTypes: snapshot.data!.map((e) => e.name).toList(),
                  selectedIndex: _selectedBeerType,
                  onChanged: (value) {
                    setState(() {
                      _selectedBeerType = value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 24.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                child: Text('Save my beer', style: TextStyle(fontSize: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
