import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'appScreens/appHomeScreen.dart';
import 'myDesign.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;

  static final List<Widget> _widgetOption = <Widget>[
    HomePage(),
    Mydesign(),
    const Text("Health Devices"),
    const Text("Appointments")
  ];

  void tap_index(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _showChatBot(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ChatBotScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOption[selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.pinkAccent : Colors.white,
              ),
              onPressed: () {
                tap_index(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.medical_information_outlined,
                color: selectedIndex == 1 ? Colors.pinkAccent : Colors.white,
              ),
              onPressed: () {
                tap_index(1);
              },
            ),
            SizedBox(width: 48), // The dummy child
            IconButton(
              icon: Icon(
                Icons.devices_other_outlined,
                color: selectedIndex == 2 ? Colors.pinkAccent : Colors.white,
              ),
              onPressed: () {
                tap_index(2);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.people_alt_outlined,
                color: selectedIndex == 3 ? Colors.pinkAccent : Colors.white,
              ),
              onPressed: () {
                tap_index(3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/images/baymaxxx.png'),
        onPressed: () {
          _showChatBot(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChatBotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Baymax, Your health care companion',style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500) ,),
            leading:Container(
              child: CircleAvatar(
                radius: 30, // Set the desired radius (half of the height)
                backgroundImage: AssetImage('assets/images/baymaxxx.png'),
              ),
            )

        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildChatMessage('Hi,hello This is BayMax', false),
                  _buildChatMessage('Can i ask about something?', true),
                  _buildChatMessage('Yes please, I am always there to assist you.', false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send,color: Colors.blueAccent,),
                    onPressed: () {
                      // Send message logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.pinkAccent[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message),
      ),
    );
  }
}
