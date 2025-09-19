import 'package:flutter/material.dart';
import 'package:sncf_next_trains/models/station.dart';
import 'package:sncf_next_trains/services/data_service.dart';

import '../models/trip.dart';

class NextTrainPage extends StatefulWidget {
  const NextTrainPage({super.key, required this.title});
  final String title;

  @override
  State<NextTrainPage> createState() => _NextTrainPageState();
}

class _NextTrainPageState extends State<NextTrainPage> with SingleTickerProviderStateMixin {
  late DataService _dataService;
  late TabController _tabController;
  
  @override
  void initState() {
    _dataService = DataService(Station('Maurecourt', 'maurecourt'));
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.headlineMedium),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
          tabs: const [
            Tab(text: 'Maurecourt'),
            Tab(text: "Conflans Fin d'Oise")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildDataTable(
              context, 
              [
                Trip('Paris Saint Lazare', '13:16', "à l'heure", '1', 'J', 'MICA'),
                Trip('Paris Saint Lazare', '13:16', "à l'heure", '1', 'J', 'MICA'),
                Trip('Paris Saint Lazare', '13:16', "à l'heure", '1', 'J', 'MICA'),
                Trip('Paris Saint Lazare', '13:16', "à l'heure", '1', 'J', 'MICA')
              ]
          ),
          _buildDataTable(
              context,
              null
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildDataTable(BuildContext context, List<Trip>? trips) {
    if (trips != null && trips.isNotEmpty) {
      return DataTable(
        headingTextStyle: Theme.of(context).textTheme.labelLarge,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Ligne'),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Statut'),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Horaire'),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Destination'),
            ),
          ),
          DataColumn(
            label: Text('Voie'),
            numeric: true,

          ),
        ],
        rows: List<DataRow>.generate(
            trips.length,
                (int index) => DataRow(
              cells: <DataCell>[
                DataCell(Text('    ${trips[index].line}    ', style: Theme.of(context).textTheme.bodyLarge)),
                DataCell(Text(trips[index].status, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge)),
                DataCell(Text(trips[index].time, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge)),
                DataCell(
                    Text(trips[index].destination, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge)),
                DataCell(Text(trips[index].platform, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge)),
              ],
            )
        ),
      );
    }
    else {
      if (trips == null) {
        return Center(
          child: Text(
            "ERREUR LORS DU CHARGEMENT DES DONNEES",
            style: Theme.of(context).primaryTextTheme.labelLarge,
          ),
        );
      }
      return Center(
        child: Text(
          "AUCUN TRAIN",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );
    }
  }
}