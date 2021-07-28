//Crypto disini kebanyakan saya ambil dari https://github.com/AsterixStudio/cryptobase/blob/main/lib/main.dart. 

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:submission_dicoding/widgets/navdrawer.dart';
import 'package:submission_dicoding/widgets/search.dart';
import 'package:submission_dicoding/model/model_crypto.dart';
import 'package:submission_dicoding/pages/crypto/detail_crypto.dart';
import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {
  static const String routeName = '/crypto';

  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  Future<List<Crypto>> fetchCoin() async {
    cryptoList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            cryptoList.add(Crypto.fromJson(map));
          }
        }
        if (this.mounted) setState(() {
          cryptoList;
        });
      }
      return cryptoList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text("Crypto",
              style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20)),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {showDialog(
                context: context, builder: (context) =>
                   AlertDialog(
                      title: Text('Ini tidak bermaksud plagiat'),
                      content:
                          Text('Halaman disini kebanyakan  dari https://github.com/AsterixStudio/cryptobase/blob/main/lib/main.dart.           Yang menggunakan MIT license, dimana diizinkan untuk "without limitation the rights to use, copy, modify... the Software".'),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () => Navigator.pop(context),
                          child: Text('Tidak'),
                        ),
                      ]
                    )
                  );
                },
                icon: Icon(Icons.info_outlined))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cryptoList.length,
          itemBuilder: (context, index) {
            return DetailCrypto(
              name: cryptoList[index].name,
              symbol: cryptoList[index].symbol,
              imageUrl: cryptoList[index].imageUrl,
              price: cryptoList[index].price.toDouble(),
              change: cryptoList[index].change.toDouble(),
              changePercentage: cryptoList[index].changePercentage.toDouble(),
            );
          },
        ));
  }
}
