import 'package:bitcoin/services/networking.dart';
const apiKey = null /*instead of null you should put the api key you requested*/;
class CurrenciesPrice{
  CurrenciesPrice();
  Future<String> getPriceData(String currencyFrom,String currencyTo) async{
    String stringPrice;
    Network network=Network('https://rest.coinapi.io/v1/exchangerate/$currencyFrom/$currencyTo/?$apiKey');
    var data =await network.getAccess();
    double price = data['rate'];
    stringPrice = price.toStringAsFixed(2);
    return stringPrice;
  }

}