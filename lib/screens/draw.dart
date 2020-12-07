import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class Draw extends StatefulWidget {
  List<String> players = List();

  Draw({this.players});

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  int placarTime1 = 0;
  int placarTime2 = 0;

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  void incrementTime1() {
    setState(() {
      placarTime1++;
    });
  }

  void incrementTime2() {
    setState(() {
      placarTime2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> time1 = List();
    List<String> time2 = List();

    for (var i = 0; i < widget.players.length; i++) {
      if (i < 5) {
        time1.add(widget.players[i]);
      } else {
        time2.add(widget.players[i]);
      }
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent[700],
      appBar: AppBar(
        title: Text("Acompanhar Jogo"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //color: Colors.red,
                  height: 350,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(16.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$minutesStr:$secondsStr",
                            style: TextStyle(
                              fontSize: 60.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '$placarTime1',
                              style: TextStyle(fontSize: 200.0),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Text(
                            'X',
                            style: TextStyle(fontSize: 30),
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Container(
                            child: Text(
                              '$placarTime2',
                              style: TextStyle(fontSize: 200.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    onPressed: () {
                      if (timerStream == null) {
                        timerStream = stopWatchStream();
                        timerSubscription = timerStream.listen((int newTick) {
                          setState(() {
                            hoursStr = ((newTick / (60 * 60)) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            minutesStr = ((newTick / 60) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            secondsStr = (newTick % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                          });
                        });
                      }
                    },
                    color: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )),
                SizedBox(width: 40.0),
                RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    onPressed: () {
                      timerSubscription.cancel();
                      timerStream = null;
                      setState(() {
                        hoursStr = '00';
                        minutesStr = '00';
                        secondsStr = '00';
                      });
                    },
                    color: Colors.black,
                    child: Icon(
                      Icons.replay,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    width: 170,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: time1.map((name) {
                        return Text(
                          name,
                          style: TextStyle(fontSize: 30),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(4.0)),
                Text(
                  'X',
                  style: TextStyle(fontSize: 30),
                ),
                Padding(padding: EdgeInsets.all(4.0)),
                Container(
                  width: 170,
                  color: Colors.red[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: time2.map((name) {
                      return Text(
                        name,
                        style: TextStyle(fontSize: 30),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: incrementTime1,
                child: Icon(Icons.add),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.red[300],
              onPressed: incrementTime2,
              heroTag: null,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
