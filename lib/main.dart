// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ScreenOne(),
    );
  }
}

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  String profileName = 'Chintan';

  final articles = [
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 1",
      description: "Description 1",
    ),
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 2",
      description: "Description 2",
    ),
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 3",
      description: "Description 3",
    ),
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 4",
      description: "Description 4",
    ),
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 5",
      description: "Description 5",
    ),
    Article(
      imageUrl: "https://picsum.photos/200/300",
      title: "Article Title 6",
      description: "Description 6",
    ),
  ];

  int _currentIndex = 0;

  final List<Widget> _pages = [
    ScreenOne(),
    ScreeenTwo(),
    ScreeenThree(),
    ScreeenFour(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 2,
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(255, 66, 66, 66),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // open hamburger menu
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 8),
            Text("Kerela"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // open notifications
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.account_circle, size: 25),
          //   onPressed: () {
          //     // open profile
          //   },
          // ),
          IconButton(
            icon: Column(
              children: [
                Icon(Icons.account_circle, size: 25),
                Text(
                  profileName,
                  style: TextStyle(fontSize: 12),
                ), // Add this line for the label
              ],
            ),
            onPressed: () {
              // open profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //First row
              Row(
                children: [
                  Icon(Icons.grid_view_outlined, size: 25),
                  SizedBox(width: 8),
                  Text(
                    "My Checklist",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add, size: 25),
                    onPressed: () {},
                  ),
                ],
              ),

              SizedBox(height: 20),

              //Second row

              Row(
                children: [
                  Icon(Icons.grid_view_outlined, size: 25),
                  SizedBox(width: 8),
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: List.generate(
                  6,
                  (index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://picsum.photos/id/$index/100',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('Item $index')
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              //Third row

              Row(
                children: [
                  Icon(Icons.article_outlined, size: 25),
                  SizedBox(width: 8),
                  Text(
                    "Articles",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      articles[index].imageUrl,
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(articles[index].title),
                    subtitle: Text(articles[index].description),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 0, 162, 154),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12.0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Discuss',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Article {
  final String imageUrl;
  final String title;
  final String description;

  Article(
      {required this.imageUrl, required this.title, required this.description});
}

class ScreeenTwo extends StatelessWidget {
  const ScreeenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Screen Two'),
      ),
    );
  }
}

class ScreeenThree extends StatelessWidget {
  const ScreeenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Screen Three'),
      ),
    );
  }
}

class ScreeenFour extends StatelessWidget {
  const ScreeenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Screen Four'),
      ),
    );
  }
}
