import 'package:flutter_mvc/app/controllers/Controller.dart';
import 'package:flutter_mvc/app/helpers/Request.dart';
import 'package:flutter_mvc/app/models/TicketModel.dart';
import 'package:flutter_mvc/config/Config.dart';
import 'package:get/get.dart';

class OpenTicketsController extends GetxController with Controller {
  var _tickets = <TicketModel>[].obs;
  var _isBusy = false.obs;
  var _filter = 'open'.obs;

  List<String> filters = ["open", "closed", "all"];

  // Getters
  List<TicketModel> get tickets => this._tickets;
  bool get isBusy => this._isBusy.value;
  String get filter => this._filter.value;

  @override
  void onInit() {
    getTickets();
    super.onInit();
  }

  void onFilterChange(value) {
    _filter(value);
  }

  Future<void> getTickets() async {
    _isBusy(true);

    var response = null;

    if (_filter.value == 'open') {
      response = await Request.get(Uri.parse('${Config.apiBaseUrl}/support/tickets')).catchError(handleError);
    } else if (_filter.value == 'closed') {
      response = await Request.get(Uri.parse('${Config.apiBaseUrl}/support/tickets/closed')).catchError(handleError);
    } else if (_filter.value == 'all') {
      response = await Request.get(Uri.parse('${Config.apiBaseUrl}/support/tickets/all')).catchError(handleError);
    }

    _isBusy(false);
  }
}
