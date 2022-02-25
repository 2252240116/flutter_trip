import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TravelPage();
}

class _TravelPage extends State<TravelPage>
    with SingleTickerProviderStateMixin {
  List tabTitles = ['喔喔', '哈哈', 'hiahia'];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.blue,
          ),
          Container(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: TabBar(
              labelColor: Color(int.parse('0xff000000')),
              unselectedLabelColor: Color(int.parse('0xff666666')),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  insets: EdgeInsets.only(bottom: 0)),
              controller: _tabController,
              tabs: tabTitles
                  .map((title) => Tab(
                        text: title,
                      ))
                  .toList(),
            ),
          ),
          Flexible(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: tabTitles
                    .map((e) => Container(
                          child: Center(
                            child: Text(e),
                          ),
                        ))
                    .toList(),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
