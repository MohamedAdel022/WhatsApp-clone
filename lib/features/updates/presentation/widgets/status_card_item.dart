import 'package:flutter/material.dart';

class StatusCardItem extends StatelessWidget {
  const StatusCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 16,
      child: Container(
       decoration: BoxDecoration(
        
       ),
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Text('${1}'),
            ),
            SizedBox(height: 5),
            Text('Status 1', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
