import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/player.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final int rating;
  List<Player> presentes = [];

  CustomCard(
    this.name,
    this.rating,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.people),
        title: Text(name),
        subtitle: Text('Mensal'),
        trailing: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$rating'),
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
