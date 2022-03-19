import 'package:flutter/material.dart';


class AllContactTab extends StatefulWidget {
  const AllContactTab({Key? key}) : super(key: key);

  @override
  _AllContactTabState createState() => _AllContactTabState();
}

class _AllContactTabState extends State<AllContactTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsetsDirectional.only(bottom: 20),
            elevation: 5,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 12,bottom: 22,
                  start: 24,end: 25),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'images/soha.png'),

                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        'الاء عمر',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '22-1-2-2022',
                        style:
                        TextStyle(fontSize: 15, color: Color(0XFF8D8A8A)),
                      ),
                    ],
                  ),
                  SizedBox(width: 98,),

                  Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Color(0XFFB6E13D),
                      ),
                      SizedBox(height:  4,),
                      Text(
                        '02:45 AM',
                        style:
                        TextStyle(fontSize: 15, color: Color(0XFF8D8A8A)),
                      ),
                    ],
                  )
                ],
              ),
            )
          // ListTile(
          //   leading: CircleAvatar(
          //     child: Image.asset('images/soha.png'),
          //   ),
          //   title: Text('الاء عمر'),
          //   subtitle: Text('22-1-2-2022'),
          //   trailing:Icon(Icons.phone,
          //   color: Color(0XFFB6E13D),) ,
          // ),
        );
      },
      itemCount: 5,
    );
  }
}
