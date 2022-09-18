import 'package:flutter/material.dart';
import 'package:moviesapp/utilies/text.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,

        leading: Container(
          // margin:
          // const EdgeInsets.only(left: 30),
          padding: const EdgeInsets.only(left: 10),

          child: const CircleAvatar(
            backgroundImage: AssetImage('images/chinema.png'),radius: 46,
          ),

        ),
        title: const modified_text(
          text: 'Crazy Movies',
          size: 22, color: Colors.orangeAccent,
        ),

      ),
      body: Center(

        child:  Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child:Image(
                image: AssetImage('images/chinema.png'),
                height: 300,
                width: 400,
              ),
            ),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, "/b");
            },
                child: Text("Press to see Movies",
                          style: TextStyle(
                          color: Colors.white,
                          fontSize:20,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.normal,
                          ),
                          ),
            )

          ],


        ),
      ),

    );
  }
}
