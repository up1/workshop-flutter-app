import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybeer/data/database_data.dart';
import 'package:mybeer/model/beer.dart';
import 'package:mybeer/model/beer_type.dart';
import 'package:mybeer/screen/beer_form_screen.dart';
import 'package:mybeer/screen/beer_type_form_screen.dart';
import 'package:mybeer/widget/beer_builder_widget.dart';
import 'package:mybeer/widget/beer_type_builder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Beer>> _getBeers() async {
    return await _databaseService.beers();
  }

  Future<List<BeerType>> _getBeerTypes() async {
    return await _databaseService.beerTypes();
  }

  Future<void> _onBeerDelete(Beer dog) async {
    await _databaseService.deleteBeer(dog.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Beer Database'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Beers'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Beer Types'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BeerBuilder(
              future: _getBeers(), // Updated from _getDogs() to _getBeers()
              onEdit: (value) {
                {
                  // Navigator.of(context)
                  //     .push(
                  //       MaterialPageRoute(
                  //         builder: (_) => BeerFormPage(dog: value),
                  //         fullscreenDialog: true,
                  //       ),
                  //     )
                  //     .then((_) => setState(() {}));
                }
              },
              onDelete: _onBeerDelete,
            ),
            BeerTypeBuilder(
              future: _getBeerTypes(),
            ), // Updated to use _getBeerTypes()
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (_) => BeerTypeFormScreen(),
                        fullscreenDialog: true,
                      ),
                    )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addBeerType',
              child: FaIcon(FontAwesomeIcons.plus),
            ),
            SizedBox(height: 12.0),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (_) => BeerFormScreen(),
                        fullscreenDialog: true,
                      ),
                    )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addBeer',
              child: FaIcon(FontAwesomeIcons.beer),
            ),
          ],
        ),
      ),
    );
  }
}
