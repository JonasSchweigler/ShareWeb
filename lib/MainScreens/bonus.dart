import 'package:flutter/material.dart';

import '../widgets/recent_orders.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: ,
            centerTitle: true,
            backgroundColor: Colors.black12,
            title: Text(
              "Bonus",
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          preferredSize: Size.fromHeight(40)),
      body: RecentOrders(),
    );
  }
}
