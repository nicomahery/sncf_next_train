import 'dart:async';

import 'package:puppeteer/puppeteer.dart';

import '../models/station.dart';

class DataService {
  static const String sncf_url = "https://www.garesetconnexions.sncf/fr/gares-services/";
  Station station;
  final Duration _pollingInterval = const Duration(seconds: 1);
  final Duration _timoutDuration = const Duration(milliseconds: 900);
  Timer? _timer;
  late Page page;

  final _dataController = StreamController<String>.broadcast();
  Stream<String> get dataStream => _dataController.stream;

  DataService(this.station);

  Future<void> startPolling() async {
    var browser = await puppeteer.launch();
    page = await browser.newPage();
    await page.goto('$sncf_url${station.urlName}', wait: Until.domContentLoaded,);
    await page.emulateMediaType(MediaType.screen);
    /*_timer = Timer.periodic(_pollingInterval, (timer) {
      _fetchData();
    });*/
  }

  Future<void> fetchData() async {
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
