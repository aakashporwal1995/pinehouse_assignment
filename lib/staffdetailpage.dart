import 'package:flutter/material.dart';
import 'package:pine_house_assignment/staff.dart';

class StaffDetailPage extends StatefulWidget {
  const StaffDetailPage({super.key, required this.staff});

  final Staff staff;

  @override
  StaffDetailPageState createState() {
    return StaffDetailPageState();
  }
}

class StaffDetailPageState extends State<StaffDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.staff.profilePicture),
              ),
              Text(widget.staff.name),
              Text(widget.staff.age.toString()),
              Text(widget.staff.phoneNumber),
              Text(widget.staff.department),
            ],
          ),
        ),
      ),
    );
  }
}
