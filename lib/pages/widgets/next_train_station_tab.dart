import 'package:flutter/material.dart';
import 'package:sncf_next_trains/services/data_service.dart';

import '../../models/trip.dart';

class NextTrainStationTab extends StatefulWidget {
  DataService dataService;
  NextTrainStationTab({super.key, required this.dataService});

  @override
  State<NextTrainStationTab> createState() => _NextTrainStationTabState();
}

class _NextTrainStationTabState extends State<NextTrainStationTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(stream: widget.dataService.stream,
      builder: (context, snapshot) {
        print('${widget.dataService.station.name} ${snapshot.connectionState.name}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text(
              "CHARGEMENT DES DONNEES",
              style: Theme.of(context).primaryTextTheme.headlineMedium,
            ),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return _buildDataTable(context, null);
        }
        else {
          print(snapshot.data);
          return _buildDataTable(context, snapshot.data);
        }
      },
      initialData: widget.dataService.lastData,
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

  @override
  bool get wantKeepAlive => true;
}
