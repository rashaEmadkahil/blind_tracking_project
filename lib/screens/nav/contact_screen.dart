import 'package:blind_tracking_project/screens/tabs/all_contact_tab.dart';
import 'package:blind_tracking_project/screens/tabs/missed_contact_tab.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List<bool> _selections = [true, false];

  @override
  void initState() {
    _tabController = TabController(
        length: 2,
        vsync:
            this); //this relates to taken provider(abstract class) who mixin implements
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 29, end: 30, top: 39.4),
      child: Column(
        // padding: EdgeInsetsDirectional.only(start: 29, end: 30, top: 39.4),
        children: [
          Card(
            elevation: 0,
            color: Color(0XFFF7F7F7),
            child: ListTile(
              title: Text(
                'ابحث في جهات الاتصال',
                style: TextStyle(color: Color(0XFF6C6B6B), fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Color(0XFF134878),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 31,
          ),
          Center(
            child: TabBar(
              controller: _tabController,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Color(0xff134878),
                  borderRadius: BorderRadius.circular(10)),
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff6C6B6B),
              onTap: (int index) {
                _tabController.index = index;
              },
              //IF WE NOT DETERMINE UNSELECTED LABEL STYLE THE IT AFFECT BOTH SELECTED AND UN SELECTED
              labelStyle: TextStyle(fontSize: 18),
              //////////////////////////////////////////////
              //IF WE NOT DETERMINE UNSELECTED LABEL STYLE THE IT AFFECT BOTH SELECTED AND UN SELECTED
              unselectedLabelStyle: TextStyle(fontSize: 17),
              tabs: [
                //un selected tap take 70%from color of selected tap
                Tab(
                  text: 'الكل',
                ),
                Tab(
                  text: 'الفائتة',
                ),
              ],
            ),

            // ToggleButtons(
            //   borderRadius: BorderRadius.circular(8),
            //   fillColor: Color(0xff134878),
            //   selectedColor: Colors.white,
            //   color: Color(0xff6C6B6B),
            //   children: [
            //     Padding(
            //       padding: EdgeInsetsDirectional.only(
            //           top: 8, bottom: 16, end: 40, start: 32),
            //       child: Text(
            //         'الكل',
            //         style: TextStyle(fontSize: 17),
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsetsDirectional.only(
            //           top: 8, bottom: 16, end: 25, start: 28),
            //       child: Text(
            //         'الفائتة',
            //         style: TextStyle(fontSize: 17),
            //       ),
            //     ),
            //   ],
            //   isSelected: _selections,
            //   onPressed: (int index) => _selections[index] = !_selections[index],
            // ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllContactTab(),
                MissedContactTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
