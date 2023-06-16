import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getGreeting(){
    final int hour = DateTime.now().hour;
    if(hour>=1 && hour<=12){
      return "Good Morning";
    } else if(hour>=12 && hour<=16){
      return "Good Afternoon";
    } else if(hour>=16 && hour<=21){
      return "Good Evening";
    } else if(hour>=21 && hour<=24){
      return "Good Night";
    } else {
      return 'Greetings';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight/8,
            child: Container(
              color: const Color.fromRGBO(73, 96, 249, 1),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight/3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: const Color.fromRGBO(73, 96, 249, 1),
            ),
            ),
          ),
          Positioned(
            top: screenHeight/7.5,
            left: screenWidth/8,
            right: screenWidth/8,
            height: screenHeight/8,
            child: Container(
              color: const Color.fromRGBO(73, 96, 249, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getGreeting(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  const Text('Maria,',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
