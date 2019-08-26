import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getBitcoinData(String selectedCurrency) async {
    final helper = NetworkHelper();

    var decodeData =
        await helper.getTickerData(cryptoList[0] + selectedCurrency);

    return decodeData['last'];
  }

  Future<double> getLitecoinData(String selectedCurrency) async {
    final helper = NetworkHelper();

    var decodeData =
        await helper.getTickerData(cryptoList[2] + selectedCurrency);

    return decodeData['last'];
  }

  Future<double> getEthereumnData(String selectedCurrency) async {
    final helper = NetworkHelper();

    var decodeData =
        await helper.getTickerData(cryptoList[1] + selectedCurrency);

    return decodeData['last'];
  }
}
