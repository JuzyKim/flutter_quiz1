import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color darkblue = Color.fromRGBO(0, 0, 139, 1.0); // Adjusted opacity to 1.0
    return MaterialApp(
      title: 'Search Example',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: darkblue), // Set app bar background color
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkblue), // Corrected colorScheme
      ),
      home: const MySearchWidget(title: 'Weather Forecast'), // Pass the title to MySearchWidget
    );
  }
}

class MySearchWidget extends StatefulWidget {
  final String title; // Declare title property

  const MySearchWidget({Key? key, required this.title}) : super(key: key);

  @override
  _MySearchWidgetState createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  late String searchQuery;
  late List<String> searchResults;

  @override
  void initState() {
    super.initState();
    searchQuery = '';
    searchResults = [];
  }

  void performSearch(String query) {
    setState(() {
      searchQuery = query;
      searchResults = allItems.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 30), // Sun icon
            SizedBox(width: 5), // Add spacing between the icon and text
            Text(
              '14 gradus', // Text next to the sun
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.center,
            color: Colors.lightBlue, // Set background color
            child: TextField(
              onChanged: performSearch,
              decoration: InputDecoration(
                hintText: 'Enter City Name',
                hintStyle: TextStyle(color: Colors.indigo),
                filled: true, // Set filled to true
                fillColor: Colors.white, // Set background color to white
              ),
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pushkin 154, Taraz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Friday, April 19, 2024', // Updated text
              style: TextStyle(
                fontSize: 16.0, // Set middle font size
                color: Colors.blue, // Set custom color for the date
              ),
              textAlign: TextAlign.center, // Align center
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'sun ', // Sun text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,

                  ),
                ),
                Text(
                  '14 gradus', // Temperature text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.orange, // Set custom color for the temperature
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.title, // Access the title passed from MyApp
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.blue, // Set custom color for the title
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        color: Colors.lightBlue, // Set background color
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue, // Set background color
                borderRadius: BorderRadius.circular(45),
              ),
            );
          },
        ),
      ),
    );
  }
}

// List of items to search
List<String> allItems = [];
