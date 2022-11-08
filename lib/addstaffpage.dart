import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pine_house_assignment/staff.dart';

const List<String> departmentList = <String>[
  'Select Department',
  'HR',
  'Finance',
  'Housekeeping',
  'Marketing',
];

class AddStaffPage extends StatefulWidget {
  const AddStaffPage({super.key});

  @override
  AddStaffPageState createState() {
    return AddStaffPageState();
  }
}

class AddStaffPageState extends State<AddStaffPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = departmentList.first;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name Required!';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Enter Name'),
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Required!';
                  } else if (value.length != 10) {
                    return 'Invalid Phone!';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Enter Phone'),
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age Required!';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Enter Age'),
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              const SizedBox(height: 8.0),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: departmentList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Coming Soon!')),
                  );
                },
                child: const Text('Upload Photo'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        dropdownValue != departmentList.first) {
                      Staff staff = Staff(
                        nameController.text,
                        int.parse(ageController.text),
                        phoneController.text,
                        '',
                        dropdownValue,
                      );
                      FirebaseFirestore.instance
                          .collection('staffs')
                          .doc(phoneController.text)
                          .set(staff.toMap());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Staff Added!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please Select Department!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
