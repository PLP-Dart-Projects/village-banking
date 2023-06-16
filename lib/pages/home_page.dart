import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getGreeting() {
    final int hour = DateTime.now().hour;
    if (hour >= 1 && hour <= 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour <= 16) {
      return "Good Afternoon";
    } else if (hour >= 16 && hour <= 21) {
      return "Good Evening";
    } else if (hour >= 21 && hour <= 24) {
      return "Good Night";
    } else {
      return 'Greetings';
    }
  }

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> widgetOptions = <Widget>[
      Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 8,
              child: Container(
                color: const Color.fromRGBO(73, 96, 249, 1),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: const Color.fromRGBO(73, 96, 249, 1),
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 16,
              left: screenWidth / 1.35,
              right: screenWidth / 11,
              height: screenHeight / 14,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: const Color.fromRGBO(73, 96, 249, 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Image.asset(
                      'assets/images/zakia_potrait.jpg',
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            Positioned(
              top: screenHeight / 7.5,
              left: screenWidth / 8,
              right: screenWidth / 8,
              height: screenHeight / 8,
              child: Container(
                color: const Color.fromRGBO(73, 96, 249, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreeting(),
                      style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Text(
                      'Zakia,',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 8.8,
              left: screenWidth / 1.15,
              right: screenWidth / 11.2,
              height: screenHeight / 53,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(32, 201, 104, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 2,
                    )),
              ),
            ),
            Positioned(
              top: screenHeight / 2.75,
              left: screenWidth / 19,
              right: screenWidth / 19,
              height: screenHeight / 4.5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 253, 253, 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 1),
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 10, left: 25, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your total balance:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(58, 58, 58, 1),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 26,
                      ),
                      const Text(
                        'TSH 50,000',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(45, 153, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 1.64,
              left: screenWidth / 19,
              right: screenWidth / 19,
              height: screenHeight / 6,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(73, 96, 249, 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(27, 57, 255, 0.2),
                        offset: Offset(0, 1),
                        spreadRadius: 3,
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 25, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 140,
                        child: Text(
                          'Check your Groups',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const Text(
        'Index 1: Business',
      ),
      const Text(
        'Index 2: School',
      ),
    ];

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/wallet.png'),
              activeIcon: Image.asset('assets/images/wallet_active.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/notification.png'),
              activeIcon: Image.asset('assets/images/notification_active.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile.png'),
              activeIcon: const Icon(Icons.person_outline_sharp),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
    );
  }
}
