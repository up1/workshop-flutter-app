import 'package:flutter/material.dart';
import 'package:mybeer/model/beer_type.dart';

class BeerTypeBuilder extends StatelessWidget {
  const BeerTypeBuilder({super.key, required this.future});
  final Future<List<BeerType>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BeerType>>(
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
              final breed = snapshot.data![index];
              return _buildBeerTypeCard(breed, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildBeerTypeCard(BeerType beerType, BuildContext context) {
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
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              child: Text(
                beerType.id.toString(),
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beerType.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(beerType.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
