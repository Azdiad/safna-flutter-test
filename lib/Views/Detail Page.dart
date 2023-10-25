import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {super.key,
      required this.title,
      required this.price,
      required this.details});
  var title;
  var price;
  var details;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.black12),
                  width: MediaQuery.of(context).size.width,
                ),
                Text(widget.title),
                Text(widget.price),
                Text(widget.details),
              ]),
        ),
      ),
    );
  }
}
