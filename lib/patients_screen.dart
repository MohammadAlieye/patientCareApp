import 'package:flutter/material.dart';
import 'package:patient_care_app/api/patient_api.dart';

import 'model/patient_model.dart';

class Patients extends StatefulWidget {
  final String patientName;
  final String alarms;
  final String roomNumber;
  final Container status;
  const Patients({Key key, this.patientName, this.alarms, this.roomNumber, this.status}) : super(key: key);

  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {

  List<patientModel> patientList = [];
  Future<void> patientApi()async {
    fetchApiForPatientClass().fetchApiForPatientMethod().then((value) {
      if (value.statusCode == 200) {
        final patientModel = patientListFromJson(value.body);
        patientList = patientModel;

        setState(() {});
      } else {
        return null;
      }
    });
  }

  @override
  void initState() {
    patientApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 2,
        title: const Text(
          'Patient',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 30, 18, 0),
        child: ListView.builder(
          itemCount: patientList.length,
          itemBuilder: (context ,index){
            return Column(
              children: [
                Row(
                  children: const  [
                    Text(
                      'Patient Name',
                      style: TextStyle(
                        color: Color(0xffB1B1B1),
                      ),
                    ),
                    Spacer(),
                    Text('Alarms', style: TextStyle(
                      color: Color(0xffB1B1B1),
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      patientList[index].firstName,
                    ),
                    const  Spacer(),
                    Text(
                      patientList[index].activeAlarmCount.toString()
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Room Number',
                      style: TextStyle(
                        color: Color(0xffB1B1B1),
                      ),
                    ),
                    Spacer(),
                    Text('Status', style: TextStyle(
                      color: Color(0xffB1B1B1),
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      patientList[index].room.number,
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color:  Color(0xffB1B1B1),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
