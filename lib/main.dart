import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    Color darkblue = Color.fromRGBO(21, 32, 112, 1.0); // Dark blue color

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Weather Forecast',
        darkblue: darkblue, // Pass the dark blue color to MyHomePage
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Color darkblue; // Declare dark blue color property

  const MyHomePage({Key? key, required this.title, required this.darkblue})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String searchQuery;

  @override
  void initState() {
    super.initState();
    searchQuery = '';
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _performSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Set background color to a lighter shade of blue
      appBar: AppBar(
        backgroundColor: widget.darkblue, // Use the dark blue color for app bar
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white), // Set title color to white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20), // Add space between title and search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color to white
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent, // Set background color of icon container to transparent
                      ),
                      child: Icon(Icons.search, color: widget.darkblue), // Set icon color to dark blue
                    ),
                    SizedBox(width: 10), // Add space between icon and text field
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: TextField(
                          onChanged: _performSearch,
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            border: InputBorder.none, // Remove default border
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                            fillColor: Colors.white, // Set background color to white
                            filled: true, // Fill the background
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40), // Add space between search field and "Pushkin 154, Taraz"
            Text(
              'Pushkin 154, Taraz',
              style: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold), // Increase font size
            ),
            SizedBox(height: 20), // Add space between "Pushkin 154, Taraz" and "Friday, April 19, 2024"
            Text(
              'Friday, April 19, 2024',
              style: TextStyle(color: Colors.indigo, fontSize: 22),
            ),
            SizedBox(height: 20), // Add space between "Friday, April 19, 2024" and sun icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny, color: Colors.yellow[100], size: 90), // Add sun icon
                SizedBox(width: 10), // Add space between sun icon and text
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '14°F',
                          style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w100), // Set text color to white and font weight to extra thin
                        ), // Add text "6°F"

                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'LIGHT SNOW',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ), // Add text "LIGHT SNOW"
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add space between text and snow icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.ac_unit, color: Colors.indigo, size: 50),
                    SizedBox(height: 5),
                    Text('5', style: TextStyle(color: Colors.white,fontSize: 30)),
                    SizedBox(height: 5),
                    Text('km/hr', style: TextStyle(color: Colors.indigo,fontSize: 17)),
                  ],
                ),
                SizedBox(width: 70),
                Column(
                  children: [
                    Icon(Icons.ac_unit, color: Colors.indigo, size: 50),
                    SizedBox(height: 5),
                    Text('3', style: TextStyle(color: Colors.white,fontSize: 30)),
                    SizedBox(height: 5),
                    Text('%', style: TextStyle(color: Colors.indigo,fontSize: 17)),
                  ],
                ),
                SizedBox(width: 70),
                Column(
                  children: [
                    Icon(Icons.ac_unit, color: Colors.indigo, size: 50),
                    SizedBox(height: 5),
                    Text('20', style: TextStyle(color: Colors.white,fontSize: 30)),
                    SizedBox(height: 5),
                    Text('%', style: TextStyle(color: Colors.indigo,fontSize: 17)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add space between snow icons and text
            Text(
              '7 DAY WEATHER FORECAST',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ), // Add text "7 DAY WEATHER FORECAST"
            SizedBox(height: 20), // Add space between text and bottom edge
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Friday',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '6°F  ',
                              style: TextStyle(color: Colors.blue[300], fontSize: 25),
                            ),
                            Icon(Icons.wb_sunny, color: Colors.yellow, size: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Saturday',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '5°F  ',
                              style: TextStyle(color: Colors.blue[300], fontSize: 25),
                            ),
                            Icon(Icons.wb_cloudy, color: Colors.grey, size: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Friday',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '6°F  ',
                              style: TextStyle(color: Colors.blue[300], fontSize: 25),
                            ),
                            Icon(Icons.wb_sunny, color: Colors.yellow, size: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
