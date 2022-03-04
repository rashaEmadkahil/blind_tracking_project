import 'package:flutter/material.dart';


class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  _NotificationDetailScreenState createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
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
              Navigator.pushReplacementNamed(context, '/notification');
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0XFF989595),
            ),
          ),
          elevation: 0,
        ),
        body:
        SafeArea(
            child: ListView(
              padding: EdgeInsetsDirectional.only (top: 26.4
                  ,

              ),
              children: [
                Card(

                  color: Colors.white,
                  margin: EdgeInsetsDirectional.only(bottom: 25,),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 19,end:21 ,bottom: 11,top: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/profile.png'),

                          radius: 30.5,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width:  10,),
                        Column(children: [
                          Text('بصيرتي', style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF134878),
                              fontWeight: FontWeight.bold
                          )),
                          Text('22/2/2022', style: TextStyle(
                            fontSize: 15,
                            color: Color(0XFF6C6B6B),
                          ),),
                        ],),
                        SizedBox(width: 151,),

                        Text('01:20 PM', style: TextStyle(
                            fontSize: 15,
                            color: Color(0XFF6C6B6B),
                        )),
                      ],
                    ),
                  ),

                ),
                // SizedBox(height: 6.8,),
                Divider(height: 0,
                color: Color(0XFFB1B1B1),
                endIndent: 30,
                indent: 30, ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 22),
                  child: Text('مرحبا احمد ، تواجه سارة مشاكل  في الوصول الى المكان المقصود.'
                    ,style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFFCC5353)
                    ),),
                ),
                SizedBox(height:5 ,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 22),

                  child: Text('هل ترغب في مراجعة الرحلة؟',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0XFF000000)
                    ),),
                ),
                SizedBox(height: 9,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 22),

                  child: Text('مراجعة الرحلة',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0XFFCC5353),
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
        )
    );
  }
}
