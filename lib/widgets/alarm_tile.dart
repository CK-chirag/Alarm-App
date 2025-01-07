import 'package:flutter/material.dart';

class AlarmTile extends StatefulWidget {
  const AlarmTile({
    super.key,
    required this.time,
    required this.date,
    required this.name,
    required this.isActive,
    required this.onToggle,
  });

  final String time;
  final String date;
  final String name;
  final bool isActive;
  final ValueChanged<bool> onToggle;

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isActive = value;
    });
    widget.onToggle(value); 
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 69, 69, 69),
              Color.fromARGB(123, 69, 69, 69)
            ]),
            // border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    widget.time,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    )
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                                textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.date,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                                textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: _isActive,
                  onChanged: _toggleSwitch,
                  activeColor: const Color.fromARGB(255, 89, 0, 184),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
