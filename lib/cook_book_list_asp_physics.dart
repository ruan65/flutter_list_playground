import 'package:flutter/material.dart';

class CookbookListASPhysics extends StatelessWidget {
  final List<String> items = List<String>.generate(10000, (i) => "QA Finam $i");

  @override
  Widget build(BuildContext context) {
    final title = 'AlwaysScrollable physics';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: ListTile(
                leading: Icon(Icons.group),
                subtitle: Text('Is Flutter List laggy??'),
                title: Text('${items[index]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
