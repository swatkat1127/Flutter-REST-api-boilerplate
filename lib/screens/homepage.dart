import 'package:flutter/material.dart';
import 'package:flutter_carselona/icondata.dart';
import 'package:flutter_carselona/reusable%20card.dart';
import 'package:flutter_carselona/services/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_carselona/screens/Welcome/welcome_screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dashboardData;

  @override
  void initState() {
    getDashBoardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      DashBoardView(),
      );
  }

  Widget DashBoardView() {
    if(dashboardData!= null){
      return UpperTile(
        totalCleaner: dashboardData['totalcleaner'],
        totalVehicle: dashboardData['totalvehicle'],
        totalSociety: dashboardData['totalsociety'],
        todayonjobcleaner: dashboardData['todayonjobcleaner'],
        todayonjobactivecleaner: dashboardData['todayonjobactivecleaner'],
        todayonjobinactivecleaner: dashboardData['todayonjobinactivecleaner'],
        todaytotaljobs: dashboardData['todaytotaljobs'],
        todaymarkattendence: dashboardData['todaymarkattendence'],
        todaypendingattendence: dashboardData['todaypendingattendence'],

      );
    } else
      {
      Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

    }

  }

  void getDashBoardData() async {
    // NetworkHelper np = NetworkHelper(
    //     'https://www.carselonadaily.com/api/distributor/distributordashboarddata');
      var response = await http.post(
        'https://www.carselonadaily.com/api/distributor/distributordashboarddata',
        headers: {},
        body: {"distributorid": '24'},
      );
      var data = json.decode(response.body);
      // print(data);

    setState(() {
      dashboardData = data['data'];
    });
  }

}

class UpperTile extends StatelessWidget{
  int totalCleaner;
  int totalVehicle;
  int totalSociety;
  int todayonjobcleaner;
  int todayonjobactivecleaner;
  int todayonjobinactivecleaner;
  int todaytotaljobs;
  int todaymarkattendence;
  int todaypendingattendence;

UpperTile({
  @required this.totalCleaner,
  @required this.totalVehicle,
  @required this.totalSociety,
  @required this.todayonjobcleaner,
  @required this.todayonjobactivecleaner,
  @required this.todayonjobinactivecleaner,
  @required this.todaytotaljobs,
  @required this.todaymarkattendence,
  @required this.todaypendingattendence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard' , textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          leading: BackButton(color: Colors.white,),
          actions:<Widget> [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove("email");
                    // prefs.setString('token', data['token']);
                    Fluttertoast.showToast(msg: 'successfullly logged out');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext ctx) => WelcomeScreen()));
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 26.0,
                  ),
                )
            ),
          ],
    ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
               Expanded(
                 child: Row(
                 children: <Widget>[
                   Expanded(
                   child:ReusableCard(
                    colour: Color(0xFFF7ECFD),
                    cardchild: IconContent(
                      icon: Icons.cleaning_services_rounded, label: '$totalCleaner',label1: 'Cleaners',
                    ),
        ) ,
    ),
                   Expanded(
                     child:ReusableCard(
                       colour: Color(0xFFF7ECFD),
                       cardchild: IconContent(
                      icon: Icons.car_repair, label: '$totalVehicle',label1: 'Customer',
                  ),
                    ),
    ) ,
                   Expanded(
                          child:ReusableCard(
                            colour: Color(0xFFF7ECFD),
                             cardchild: IconContent(
                               icon: Icons.group_outlined, label: '$totalSociety',label1: 'Society',
                             ),
                      ) ,
                      ),
    ],
    ),

    ),

              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:ReusableCard(
                        colour: Color(0xFFF7ECFD),
                        cardchild: IconContent(
                          icon: Icons.sentiment_satisfied_alt, label: '$todayonjobactivecleaner',label1: 'Active',
                        ),
                      ),
                    ) ,
                    Expanded(
                      child:ReusableCard(
                        colour: Color(0xFFF7ECFD),
                        cardchild: IconContent(
                          icon: Icons.sentiment_dissatisfied_sharp, label: '$todayonjobinactivecleaner',label1: 'Inactive',
                        ),
                      ) ,
                    ),
                  ],
                ),

              ),
              Expanded(
                  child: Row(
                  children: <Widget>[
                     Expanded(
                      child:ReusableCard(
                       colour: Color(0xFFF7ECFD),
                        cardchild: IconContent(
                        icon: Icons.touch_app, label: '$todaymarkattendence',label1: 'Marked',
                  ),
                  ) ,
                  ),
                     Expanded(
                     child:ReusableCard(
                      colour: Color(0xFFF7ECFD),
                        cardchild: IconContent(
                          icon: Icons.pending_actions_outlined, label: '$todaypendingattendence',label1: 'Pending',
    ),
    ) ,
    ),

               ]
              ),
              ),
    ],
    ),
    );

  }
}






