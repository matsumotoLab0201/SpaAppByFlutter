import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/Spa.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late List<Spa> spaList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://raw.githubusercontent.com/matsumotoLab0201/rentMock/master/spa.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final spaData = data['spa'] as List<dynamic>;
      spaList = spaData.map((item) => Spa.fromJson(item)).toList();
      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spa List'),
      ),
      body: spaList != null
          ? ListView.builder(
        itemCount: spaList.length,
        itemBuilder: (context, index) {
          final spa = spaList[index];
          return ListTile(
            leading: Image.network(
              spa.imageUrl,
              width: 100, // 調整したい幅を指定
              height: 100, // 調整したい高さを指定
              fit: BoxFit.cover, // 画像をウィジェットにフィットさせる
            ),
            title: Text(spa.name),
            subtitle: Text('平日: ${spa.cost1}円 土日: ${spa.cost2}円 徒歩: ${spa.walk}分'),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}