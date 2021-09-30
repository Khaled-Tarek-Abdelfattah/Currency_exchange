import 'package:bitcoin/utilities/constants.dart';
import 'package:bitcoin/utilities/currencies_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io'show Platform;
import 'package:bitcoin/services/prices.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CurrenciesPrice currenciesPrice=CurrenciesPrice();
  String selectedCurrency1 = currenciesData[0];
  String selectedCurrency2 = currenciesData[1];
  String price='0';
  void getData() async {
      var data = await currenciesPrice.getPriceData(selectedCurrency1,selectedCurrency2);
      setState(() {
        price = data;
      });
  }
  DropdownButton getDropDownButton1() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesData.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(
          currenciesData[i],
        ),
        value: currenciesData[i],
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      style: kMainTextStyle,
      value: selectedCurrency1,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency1 =value.toString();
          getData();
        });
      },
    );
  }
  CupertinoPicker getCupertinoPicker1() {
    List<Text> cupertinoItems = [];
    for (int i = 0; i < currenciesData.length; i++) {
      var newItem = Text(
        currenciesData[i],
        style: kMainTextStyle,
        );
      cupertinoItems.add(newItem);
    }
    return CupertinoPicker(itemExtent: 32.0,onSelectedItemChanged:(value) {setState(() {
      selectedCurrency1 = currenciesData[value].toString();
    });
    getData();},
        children: cupertinoItems,
    );
  }
  DropdownButton getDropDownButton2() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesData.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(
          currenciesData[i],
        ),
        value: currenciesData[i],
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      style: kMainTextStyle,
      value: selectedCurrency2,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency2 =value.toString();
          getData();
        });
      },
    );
  }
  CupertinoPicker getCupertinoPicker2() {
    List<Text> cupertinoItems = [];
    for (int i = 0; i < currenciesData.length; i++) {
      var newItem = Text(
        currenciesData[i],
        style: kMainTextStyle,
      );
      cupertinoItems.add(newItem);
    }
    return CupertinoPicker(itemExtent: 32.0,onSelectedItemChanged:(value) {setState(() {
      selectedCurrency2 = currenciesData[value].toString();
    });
    getData();},
      children: cupertinoItems,
    );
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            '🤑 bitcoin ticker',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        '$selectedCurrency1 = $price $selectedCurrency2',
                        style: kMainTextStyle,
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: Center(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Platform.isIOS ? getCupertinoPicker1():getDropDownButton1()),
                    Expanded(child: Platform.isIOS ? getCupertinoPicker2():getDropDownButton2()),
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
