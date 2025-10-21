// import 'package:flutter/material.dart';
// import 'view.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _subscriberCount;
  final TextEditingController _channelIdController = TextEditingController();

  Future<void> fetchSubscriberCount(String channelId) async {
    const apiKey = 'AIzaSyAxSDb-IRgYzaSz2TecYpCXmqVAjjMbIeM'; // ここに取得したAPIキーを入力
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/channels?part=statistics&id=$channelId&key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final subscriberCount = data['items'][0]['statistics']['subscriberCount'];

        setState(() {
          _subscriberCount = subscriberCount;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      setState(() {
        _subscriberCount = 'Error fetching data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Subscriber App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _channelIdController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'チャンネルIDを入力する',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_channelIdController.text.isNotEmpty) {
                  fetchSubscriberCount(_channelIdController.text);
                }
              },
              child: Text('検索する'),
            ),
            SizedBox(height: 20),
            Text(
              _subscriberCount == null
                  ? 'チャンネルIDを入力してください'
                  : 'チャンネル登録者数: $_subscriberCount',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}