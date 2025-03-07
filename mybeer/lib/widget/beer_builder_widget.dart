import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybeer/data/database_data.dart';
import 'package:mybeer/model/beer.dart';

class BeerBuilder extends StatelessWidget {
  const BeerBuilder({
    super.key,
    required this.future,
    required this.onEdit,
    required this.onDelete,
  });
  final Future<List<Beer>> future;
  final Function(Beer) onEdit;
  final Function(Beer) onDelete;

  Future<String> getBeerTypeName(int id) async {
    final DatabaseService databaseService = DatabaseService();
    final beerType = await databaseService.beerType(id);
    return beerType.name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Beer>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final beer = snapshot.data![index];
              return _buildBeerCard(beer, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildBeerCard(Beer beer, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              alignment: Alignment.center,
              child: FaIcon(FontAwesomeIcons.beer, size: 18.0),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future: getBeerTypeName(beer.typeId),
                    builder: (context, snapshot) {
                      return Text('Breed: ${snapshot.data}');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              onTap: () => onEdit(beer),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Icon(Icons.edit, color: Colors.orange[800]),
              ),
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              onTap: () => onDelete(beer),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Icon(Icons.delete, color: Colors.red[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
