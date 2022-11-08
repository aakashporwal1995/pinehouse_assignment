import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pine_house_assignment/staff.dart';
import 'package:pine_house_assignment/staffdetailpage.dart';

class StaffsListPage extends StatefulWidget {
  const StaffsListPage({super.key});

  @override
  State<StaffsListPage> createState() => _StaffsListPageState();
}

class _StaffsListPageState extends State<StaffsListPage> {
  @override
  Widget build(BuildContext context) {
    final staffsRef =
        FirebaseFirestore.instance.collection('staffs').withConverter<Staff>(
              fromFirestore: (snapshots, _) => Staff.fromMap(snapshots.data()!),
              toFirestore: (staff, _) => staff.toMap(),
            );

    return StreamBuilder<QuerySnapshot>(
      stream: staffsRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            Staff staff = data.docs[index].data() as Staff;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StaffDetailPage(staff: staff),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(staff.profilePicture),
                ),
                title: Text(staff.name),
              ),
            );
          },
        );
      },
    );
  }
}
