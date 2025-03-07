import 'package:flutter/material.dart';
import 'package:mybeer/data/database_data.dart';
import 'package:mybeer/model/beer_type.dart';

class BeerTypeFormScreen extends StatefulWidget {
  const BeerTypeFormScreen({Key? key}) : super(key: key);

  @override
  BeerTypeFormScreenState createState() => BeerTypeFormScreenState();
}

class BeerTypeFormScreenState extends State<BeerTypeFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> onSave() async {
    final name = _nameController.text;
    final description = _descController.text;

    await _databaseService.insertBeerType(
      BeerType(name: name, description: description),
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new beer type'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the beer type here',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description about the beer type here',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: onSave,
                child: Text(
                  'Save the beer type',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
