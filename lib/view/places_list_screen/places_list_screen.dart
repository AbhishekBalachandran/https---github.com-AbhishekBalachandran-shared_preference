import 'package:exam_shared_prefernce/controller/login_controller/login_controller.dart';
import 'package:exam_shared_prefernce/utils/database/db.dart';
import 'package:exam_shared_prefernce/view/detailscreen/detailscreen.dart';
import 'package:exam_shared_prefernce/view/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(
          Icons.message_outlined,
          color: Colors.white,
          size: 15,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        leadingWidth: 200,
        leading: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Incredible India",
                    style: GoogleFonts.ephesis(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "Tourism app",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Provider.of<LoginController>(context, listen: false)
                      .removeCredentials();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged out successfully')));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    itemIndex: index,
                  ),
                ));
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  places[index]['name'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(places[index]['image']),
                            fit: BoxFit.cover)),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
