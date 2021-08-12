import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/getx_controller/getx_controllers.dart';
import 'package:knovies/widgets/widgets.dart';

class TrendingScreen extends StatelessWidget {
final GetxControllers  screenControllers = Get.put(GetxControllers());
  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? buildMobileAppBar()
            : PreferredSize(
                child: WindowsAppBarList(),
                preferredSize: Size(_screenSize.width, 100)),
        drawer: Drawer(
          child: DrawerWidgets(),
        ),
       body: Column(
         children: [
           SearchBar(),
           const SizedBox(height: 40.0,),
           MediaTypeDivider(),
           Obx((){
                 return screenControllers.isTrendingLoading.value?Center(child: CircularProgressIndicator(),)
                     :Text(screenControllers.trendingList.value.results![0].title.toString());
           }),
         ],
       ),
    );
  }



  AppBar buildMobileAppBar() {
    return AppBar(
              backgroundColor: Colors.black54,
              title: appBarTittle(),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white, // background// foreground
                    ),
                    onPressed: () => {},
                    child: Row(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        const Icon(
                          Icons.account_circle,
                          color: Colors.amber,
                        ),
                        const Text(
                          "  Login",
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
  }
}

class MediaTypeDivider extends StatelessWidget {
  const MediaTypeDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),

      Text("OR"),

      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]);
  }
}
