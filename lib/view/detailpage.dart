import 'package:flutter/material.dart';
import 'package:kuis_123210074/model/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Groceries groceries;
  const DetailPage({super.key, required this.groceries});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groceries.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Image.network(widget.groceries.productImageUrls[0]),
          ),
          Container(
              child: Row(
            children: [
              Text(widget.groceries.name),
            ],
          )),
          Container(
            child: Row(
              children: [
                Text(widget.groceries.price),
                Text(
                    "                                                                           "),
                Text("Discount"),
                Text(widget.groceries.discount),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(widget.groceries.reviewAverage),
                Text("| Tersedia :"),
                Text(widget.groceries.stock),
                Text(
                    "                                                                       "),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                    "--------------------------------------------------------------------------------------------------------")
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_bag),
                  onPressed: () {},
                ),
                Text(widget.groceries.storeName),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                    "--------------------------------------------------------------------------------------------------------")
              ],
            ),
          ),
          Text(widget.groceries.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.groceries.productUrl);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could Not Launch $_url');
    }
  }
}
