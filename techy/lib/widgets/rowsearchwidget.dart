import 'package:flutter/material.dart';
import 'package:techy/models/list.dart';

class RowSearchWidget extends StatefulWidget {
  SearchList mySearch;
  RowSearchWidget({super.key, required this.mySearch});

  @override
  State<RowSearchWidget> createState() =>
      _RowSearchWidgetState(mySearch: this.mySearch);
}

class _RowSearchWidgetState extends State<RowSearchWidget> {
  SearchList mySearch;
  _RowSearchWidgetState({required this.mySearch});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                mySearch.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${mySearch.price}",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Text(
                "${mySearch.rating}",
                style: TextStyle(color: Colors.grey),
              ),
              leading: Image.network(mySearch.image),
            ));
  }
}
