import 'dart:async';

import 'package:flutter/material.dart';
import 'package:screen_state/screen_state.dart';

class ScreenState extends StatefulWidget {
  const ScreenState({ Key? key }) : super(key: key);

  @override
  State<ScreenState> createState() => _ScreenStateState();
}

class ScreenStateEventEntry {
  ScreenStateEvent event;
  DateTime? time;

  ScreenStateEventEntry(this.event) {
    time = DateTime.now();
  }
}

class _ScreenStateState extends State<ScreenState> {

  Screen _screen = Screen();
  late StreamSubscription<ScreenStateEvent> _subscription;
  bool started = false;
  List<ScreenStateEventEntry> _log = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(ScreenStateEvent event) {
    setState(() {
      _log.add(ScreenStateEventEntry(event));
    });
    print(event);
  }

  void startListening() {
    try {
      _subscription = _screen.screenStateStream!.listen(onData);
      setState(() => started = true);
    } on ScreenStateException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
    setState(() => started = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen State'),
        backgroundColor: Color(0xFF442C2E),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _log.length,
          itemBuilder: (BuildContext context, int idx) {
            final entry = _log[idx];
            return ListTile(
              leading: Text(entry.time.toString().substring(0, 19)),
              trailing: Text(entry.event.toString().split('.').last));
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF442C2E),
        onPressed: started ? stopListening : startListening,
        tooltip: 'Start/Stop sensing',
        child: started ? Icon(Icons.stop) : Icon(Icons.play_arrow),
      ),
    );
  }
}