import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'TabNavigator',
        home: CupertinoTabScaffold( // 4
          tabBar: CupertinoTabBar(
            activeColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                title: Text('Place bid'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('More'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 3);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => MainScreen(),
                  defaultTitle: 'Support Chat',
                );
                return MainScreen();
                break;
              case 1:
                return new Container(
                    color: Colors.yellow

                );

                break;
              case 2:
                return new Container(
                    color: Colors.green

                );

                break;
              case 3:
                return new Container(
                    color: Colors.blue

                );

                break;
            }
            return null;
          },
        )

    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(
                  builder: (context) => DetailScreen()),
                );
              },
              child: Container(color: Colors.red,)
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 200,
                width: 200,
                color: Colors.cyan,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }
}
