import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sncf_next_trains/models/station.dart';
import 'package:sncf_next_trains/pages/widgets/next_train_station_tab.dart';
import 'package:sncf_next_trains/services/data_service.dart';

class NextTrainPage extends StatefulWidget {
  const NextTrainPage({super.key, required this.stations});
  final List<Station> stations;

  @override
  State<NextTrainPage> createState() => _NextTrainPageState();
}

class _NextTrainPageState extends State<NextTrainPage> with SingleTickerProviderStateMixin {
  late List<DataService> _dataServices;
  late TabController _tabController;
  Timer? _timer;
  final Duration _changeInterval = const Duration(seconds: 15);
  
  @override
  void initState() {
    _dataServices = widget.stations.map((Station s) => DataService(s)).toList();
    _tabController = TabController(vsync: this, length: _dataServices.length);
    _timer = Timer.periodic(_changeInterval, (timer) async {
      _tabController.animateTo((_tabController.index+1)%_tabController.length);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Prochains trains en gare", textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.headlineMedium),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
          tabs: _dataServices.map((d) => Tab(text: d.station.name)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _dataServices.map((d) => NextTrainStationTab(dataService: d)).toList(),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}