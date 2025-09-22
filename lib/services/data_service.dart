import 'dart:async';

import 'package:puppeteer/puppeteer.dart';
import 'package:sncf_next_trains/models/trip.dart';

import '../models/station.dart';

class DataService {
  static const String sncf_url = "https://www.garesetconnexions.sncf/fr/gares-services/";
  Station station;
  final Duration _pollingInterval = const Duration(seconds: 10);
  final Duration _timoutDuration = const Duration(milliseconds: 900);
  Timer? _timer;
  late Page page;
  List<Trip>? lastData;

  final _streamController = StreamController<List<Trip>>.broadcast();
  Stream<List<Trip>> get stream => _streamController.stream;

  DataService(this.station){
    startPolling();
  }

  Future<void> startPolling() async {
    /*var browser = await puppeteer.launch();
    page = await browser.newPage();
    await page.goto('$sncf_url${station.urlName}', wait: Until.domContentLoaded,);
    await page.emulateMediaType(MediaType.screen);*/
    _timer = Timer.periodic(_pollingInterval, (timer) async {
      await _fetchData();
    });
  }

  Future<void> _fetchData() async {
    int hour = DateTime.now().hour;
    int second = DateTime.now().second;
    var data = [
      Trip('Paris Saint Lazare', '$hour:$second', "à l'heure", '1', 'J', 'MICA'),
      Trip('Paris Saint Lazare', '${hour+1}:${second < 10 ? ' 0$second' : second }', "à l'heure", '1', 'J', 'MICA'),
      Trip('Paris Saint Lazare', '${hour+2}:${second < 10 ? ' 0$second' : second }', "à l'heure", '1', 'J', 'MICA'),
      Trip('Paris Saint Lazare', '${hour+3}:${second < 10 ? ' 0$second' : second }', "à l'heure", '1', 'J', 'MICA')
    ];
    lastData = data;
    _streamController.add(data);
  }

  Future<void> testData() async {
    //TODO DELETE
    var browser = await puppeteer.launch();
    page = await browser.newPage();
    await page.goto('$sncf_url${station.urlName}', wait: Until.domContentLoaded);
    await page.emulateMediaType(MediaType.screen);
    //TODO DELETE

    var result = await page.waitForXPath('//*[@id="block-gco-staticpagemenustation"]/section[3]/div[2]/div/div/div/div/div[2]/div[2]/div[1]/ul',
      visible: true, timeout: _timoutDuration);

    print(await result?.$$('//li[1]/a'));

    //TODO DELETE
    browser.close();
  }
}
