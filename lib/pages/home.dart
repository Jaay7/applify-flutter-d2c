import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applify'),
        backgroundColor: Color(0xFF442C2E),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Trackers', style: Theme.of(context).textTheme.headline6),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/app_usage_screen');
                  },
                  child: Container(
                    width: 140,
                    height: 70,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFff946a),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                    child: Center(child: Text('App Usages', style: TextStyle(color: Colors.white, fontSize: 15))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/screen_state');
                  },
                  child: Container(
                    width: 140,
                    height: 70,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFff946a),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                    child: Center(child: Text('Screen State', style: TextStyle(color: Colors.white, fontSize: 15))),
                  ),
                ),
                // GestureDetector(
                //   child: Container(
                //     width: 140,
                //     height: 70,
                //     margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       color: Color(0xFFff946a),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black12,
                //           blurRadius: 6,
                //           offset: Offset(1, 5),
                //         ),
                //       ],
                //     ),
                //     child: Center(child: Text('Screenlight', style: TextStyle(color: Colors.white, fontSize: 15))),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF442C2E),
      //   onPressed: () {},
      //   tooltip: 'Menu',
      //   child: const Icon(Icons.expand_less),
      // ),
    );
  }
}