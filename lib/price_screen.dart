import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'currency_view.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency;
  String bitcoinValue = '?';
  String litecoinValue = '?';
  String ethereumValue = '?';

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      dropDownItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            setData();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> items = [];

    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedCurrency = currenciesList[index];
            setData();
          });
        },
        children: items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CurrencyView(
              cryptocurrency: 'BTC',
              coinValue: bitcoinValue,
              selectedCurrency: selectedCurrency),
          CurrencyView(
              cryptocurrency: 'ETH',
              coinValue: ethereumValue,
              selectedCurrency: selectedCurrency),
          CurrencyView(
              cryptocurrency: 'LTC',
              coinValue: litecoinValue,
              selectedCurrency: selectedCurrency),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : getDropDownButton(),
          ),
        ],
      ),
    );
  }

  void setData() async {
    try {
      var bitcoinData = await CoinData().getBitcoinData(selectedCurrency);
      var litecoinData = await CoinData().getBitcoinData(selectedCurrency);
      var ethereumData = await CoinData().getBitcoinData(selectedCurrency);

      print(bitcoinData);
      setState(() {
        bitcoinValue = bitcoinData.toString();
        litecoinValue = litecoinData.toStringAsFixed(0);
        ethereumValue = ethereumData.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setData();
  }
}
