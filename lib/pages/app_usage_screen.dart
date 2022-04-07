import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

class AppUsageScreen extends StatefulWidget {
  const AppUsageScreen({ Key? key }) : super(key: key);

  @override
  State<AppUsageScreen> createState() => _AppUsageScreenState();
}

class _AppUsageScreenState extends State<AppUsageScreen> {

  List<AppUsageInfo> _infos = [];

  @override
  void initState() {
    super.initState();
    getUsageStats();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(hours: 1));
      final List<AppUsageInfo> infoList = await AppUsage.getAppUsage(startDate, endDate);
      setState(() {
        _infos = infoList;
      });
      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (e) {
      print(e.toString());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Usages'),
        backgroundColor: Color(0xFF442C2E),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _infos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_infos[index].packageName),
              trailing: Text(_infos[index].usage.toString()),
            );
          },
        ),
      ),
    );
  }
}