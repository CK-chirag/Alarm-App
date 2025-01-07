import 'package:flutter/material.dart';
import 'package:alarm_app/widgets/alarm_tile.dart';

class SetAlarm extends StatefulWidget {
  final Function(AlarmTile) onSave;

  const SetAlarm({Key? key, required this.onSave}) : super(key: key);

  @override
  _SetAlarmState createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  final TextEditingController _alarmNameController = TextEditingController();
  TimeOfDay _selectTime = TimeOfDay.now();
  DateTime _selectDate = DateTime.now();

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: _selectTime);

    if (pickedTime != null) {
      setState(() {
        _selectTime = pickedTime;
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectDate = pickedDate;
      });
    }
  }

  void _saveAlarm() {
    final alarm = AlarmTile(
      time:
          "${_selectTime.hour.toString().padLeft(2, '0')}:${_selectTime.minute.toString().padLeft(2, '0')}",
      date: _selectDate.toLocal().toString().split(' ')[0],
      name: _alarmNameController.text,
      onToggle: (bool value) {
        // Handle toggle action here
        print('Alarm toggled: $value');
      },
      isActive: false,
    );
    widget.onSave(alarm);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Set Alarm',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: _saveAlarm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _pickTime,
              child: Text(
                "${_selectTime.hour.toString().padLeft(2, '0')}:${_selectTime.minute.toString().padLeft(2, '0')}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: _pickDate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Date - ${_selectDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _alarmNameController,
              decoration: InputDecoration(
                labelText: 'Alarm Name',
                labelStyle: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
