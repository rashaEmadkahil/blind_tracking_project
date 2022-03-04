import 'package:blind_tracking_project/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("الاشعارات",style: TextStyle( color: Color(0xff134878),),),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0XFF989595),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(child:
      InkWell(
        onTap: () =>
            Navigator.pushReplacementNamed(context, '/notification_detail_screen')
        ,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30 ,),
          child: ListView.builder(
              itemCount:  5,
              itemBuilder: (context , x) {
                return  NotificationWidget();
              }),
        ),
      )
      ),
    );
  }
}