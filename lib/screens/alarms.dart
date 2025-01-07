import 'package:alarm_app/screens/set_alarm.dart';
import 'package:alarm_app/widgets/alarm_tile.dart';
import 'package:flutter/material.dart';

class Alarms extends StatefulWidget {
  const Alarms({super.key});

  @override
  _AlarmsState createState() => _AlarmsState();
}

class _AlarmsState extends State<Alarms> {
  final List<AlarmTile> _alarms = [];

  void _addAlarm(AlarmTile alarm) {
    setState(() {
      _alarms.add(alarm);
    });
  }

  void _removeAlarm(AlarmTile alarm) {
    setState(() {
      _alarms.remove(alarm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Alarms',style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetAlarm(
                    onSave: _addAlarm,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _alarms[index],
              const SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}