import 'dart:math';

import 'package:flutter/material.dart';

class EndGameScreen extends StatelessWidget {
  const EndGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _gridItems = [
      '1',
      '2',
      '3',
      '4',
      '1',
      '2',
      '3',
      '4',
      '1',
      '2',
      '3',
      '4'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
        elevation: 0,
      ),
      body: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          // SliverAppBar #1
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            elevation: 1,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.deepOrange,
                child: const Center(
                    child: Icon(
                  Icons.favorite,
                  size: 70,
                  color: Colors.yellow,
                )),
              ),
              title: const Text(
                'First SliverAppBar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // SliverGrid #1
          SliverGrid.count(
            crossAxisCount: 5,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1,
            children: [
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[600],
                child: Container(),
              ),
              Card(
                color: Colors.blue[100],
                child: Container(),
              ),
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[600],
                child: Container(),
              ),
              Card(
                color: Colors.blue[100],
                child: Container(),
              ),
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[600],
                child: Container(),
              ),
              Card(
                color: Colors.blue[100],
                child: Container(),
              ),
            ],
          ),

          // Just add some padding
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),

          // SliverAppBar #2
          SliverAppBar(
            elevation: 5,
            pinned: true,
            backgroundColor: Colors.pink,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.amber,
                child: const Center(
                    child: Icon(
                  Icons.run_circle,
                  size: 60,
                  color: Colors.white,
                )),
              ),
              title: const Text(
                'Second SliverAppBar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Just add some padding
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),

          // SliverGrid #2 (with dynamic content)
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  // generate ambers with random shades
                  color: Colors.amber[Random().nextInt(9) * 100],
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(_gridItems[index]),
                  ),
                );
              },
              childCount: _gridItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
