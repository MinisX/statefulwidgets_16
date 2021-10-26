import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

// ~ Stateless widget does not change over time and is constant
// ~ Stateful widget is used when something is changed over time or we have dynamic data
class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  // ~ Function createState() return another function _TestState(), which instantiates another class _TestState
  // ~ We link an object to StatefulWidget
  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

// ~ This is building a state object for StatefulWidget
class _NinjaCardState extends State<NinjaCard> {

  // ~ Here we define data that can change state over time
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        // ~ Elavation set to 0 removes the shadow ( which makes 3D effect )
        elevation: 0.0,
      ),
      // ~ Here we define a FloatingButton to increate the lvl of ninja
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ~ When setState() is called, it calls build function and the app is rebuilt again
          setState((){
            ninjaLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          // ~ This alligns everything to the left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ~ Make a circle image with CircleAvatar
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ninja_img.png'),
                backgroundColor: Colors.amberAccent[200],
                radius: 40.0,
              ),
            ),
            // ~ This is a line which literally looks like divider
            Divider(
              // ~ This is the height between top element and bottom, not the line itself
              height: 90.0,
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                // ~ This gives the spacing between the letters
                letterSpacing: 2.0,
              ),
            ),
            // ~ Creates an empty invisible box for us of a height and width we specify
            // ~ we put it between the elements we want to have space in between
            SizedBox(height: 10.0),
            Text(
              'Chun-Li',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                // ~ This gives the spacing between the letters
                letterSpacing: 2.0,
              ),
            ),
            // ~ Creates an empty invisible box for us of a height and width we specify
            SizedBox(height: 10.0),
            Text(
              // ~ With '$' we output the contat of the data to string
              '$ninjaLevel',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children:<Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'chun.li@thenetninja.co.uk',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


