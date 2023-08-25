import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height*0.5,
      child: Drawer(

        child: ListView(


          children: [
            SizedBox(height: 30.0,),

            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Settings'.tr),
              subtitle: Text('Customize the app'),
              onTap: ()=> Get.toNamed('/settings'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('News'.tr),
              subtitle: Text('Customize the app'),
              onTap: ()=> Get.toNamed('/x'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('FOR ANY HELP'.tr),
              subtitle: Text('Customize the app'),

            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.1 ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.bottomLeft,
                child: Text('By Tawheed Developer',style: TextStyle(color: Colors.grey),)),
          ],
        ),
      ),
    );
  }
}
