import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class UI extends StatefulWidget {
  const UI({super.key});


  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children:[ 
            Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff7392ef),
                  Color(0xffed5197),
                  Color(0xffff7554)
                ],
                transform: GradientRotation(45))
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(85, 20, 30,0,),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Text(
                  'Question #2 (UI)',
                  style: TextStyle(
                    fontSize: 30.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.0
                      ..color = Colors.white,
                  ),
                ),
                //Text with font color
                Text(
                  'Question #2 (UI)',
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ],
              
                        ),
            ),
            const SizedBox(height : 70),
            Center(
              child: Stack(
                children: [
                  Expanded(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black
              
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 8, 4, 3),
                      child: Container(
                        width: 288,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[900],
                                    
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(children: [
                                Stack(
                                  children: [
                                    Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white
                                  ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        alignment: Alignment.center,
                                      width: 40,
                                                                        height: 40,
                                                                        decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[900]
                                                                        ),
                                      child: Icon(Icons.apple, color: Colors.white, size: 30)),
                                    ),
                                
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Analytic Data',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                      )
                                    ),
                                                                      Text(
                                      'Apple Officer',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(Icons.bookmark_added_rounded, color: Colors.white,),

                              ],),
                              
                            ),
                                                            Row(children: [
                                                              const SizedBox(width: 12),
                                  Container(
                                    width: 75,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius:  BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Full Time',
                                        style:TextStyle(
                                          fontSize: 14,
                                          color: Colors.white
                                        )
                                      ),
                                    )
                                  ),
                                  const SizedBox(width: 6),
                                                                    Container(
                                    width: 75,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius:  BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Offline',
                                        style:TextStyle(
                                          fontSize: 14,
                                          color: Colors.white
                                        )
                                      ),
                                    )
                                  ),
                                  const SizedBox(width: 6),
                                                                    Container(
                                    width: 85,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius:  BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '1 Years Exp',
                                        style:TextStyle(
                                          fontSize: 14,
                                          color: Colors.white
                                        )
                                      ),
                                    )
                                  ),
                                ],),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 0 , 20,0),
                                  child: Text(
                                    'Discover how we make an impact: See our areas of work, worldwide locations, and oppurtunities for students.',
                                    style: TextStyle(
                                      color: Colors.white
                                    )
                                  ),
                                ),
                                  Row(
                                    children: [

                                       Padding(
                                        padding: const EdgeInsets.fromLTRB(12, 20 , 20,0),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:  BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '\$250\/Month',
                                              style:TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              )
                                            ),
                                          )
                                        ),
                                      ),
                                      const Spacer(),
                                                                            Padding(
                                        padding: const EdgeInsets.fromLTRB(12, 20 , 20,0),
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius:  BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                '1 Week ago',
                                                style:TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600
                                                )
                                              ),
                                              const SizedBox(width: 5),
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundColor: Colors.grey[800],
                                                foregroundColor: Colors.black,
                                                child: Icon(Icons.arrow_forward)
                                              )
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),

                          ],
                        )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}