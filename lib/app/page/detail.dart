import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  User? user;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? strUser = prefs.getString('user');
    if (strUser != null) {
      setState(() {
        user = User.fromJson(jsonDecode(strUser));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user != null
          ? SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
                  ),
                  SizedBox(height: 16.0),
                  _buildInfoRow('Number ID', user?.idNumber ?? ''),
                  _buildInfoRow('Fullname', user?.fullName ?? ''),
                  _buildInfoRow('Phone Number', user?.phoneNumber ?? ''),
                  _buildInfoRow('Gender', user?.gender ?? ''),
                  _buildInfoRow('Birthday', user?.birthDay ?? ''),
                  _buildInfoRow('School Year', user?.schoolYear ?? ''),
                  _buildInfoRow('School Key', user?.schoolKey ?? ''),
                  _buildInfoRow('Date Created', user?.dateCreated ?? ''),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label + ': ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
