import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int latestIndex = 0;
  Map<dynamic, dynamic> programsList = {};

  Future<Map> getProgramsApi() async {
    final programs_response = await http.get(Uri.parse(
      'https://632017e19f82827dcf24a655.mockapi.io/api/programs',
    ));
    var data = jsonDecode(programs_response.body.toString());
    if (programs_response.statusCode == 200) {
      setState(() {
        programsList.addAll(data);
      });
      return programsList;
    } else {
      return programsList;
    }
  }


  Map<dynamic, dynamic> lessonsList = {};

  Future<Map> getlessonsApi() async {
    final lessons_response = await http.get(Uri.parse(
      'https://632017e19f82827dcf24a655.mockapi.io/api/lessons',
    ));
    var data = jsonDecode(lessons_response.body.toString());
    if (lessons_response.statusCode == 200) {
      setState(() {
        lessonsList.addAll(data);
      });
      return lessonsList;
    } else {
      return lessonsList;
    }
  }
  @override
  void initState() {
    getProgramsApi();
    getlessonsApi();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.forum_outlined),
              color: const Color(0xFF939CA3),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
              color: const Color(0xFF939CA3),
            ),
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.short_text_rounded,
                  color: Color(0xFF939CA3),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          backgroundColor: const Color(0xFFEEF3FD),
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: latestIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined), label: 'Learn'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined), label: 'Hub'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile')
          ],
          onTap: (index) {
            setState(() {
              latestIndex = index;
            });
          },
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 276.0,
                color: const Color(0xFFEEF3FD),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Hello, Priya!',
                        style: GoogleFonts.lora(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF08090A),
                            fontSize: 20.0),
                      ),
                      Text(
                        'What do you wanna learn today?',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6D747A),
                            fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: const Color(0xFF598BED),
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.book_outlined,
                                          color: Color(0xFF598BED),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'Programs',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF598BED),
                                              fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: const Color(0xFF598BED),
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.help,
                                          color: Color(0xFF598BED),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'Get help',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF598BED),
                                              fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: const Color(0xFF598BED),
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.menu_book_rounded,
                                          color: Color(0xFF598BED),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'Learn',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF598BED),
                                              fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: const Color(0xFF598BED),
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.track_changes,
                                          color: Color(0xFF598BED),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'DD Tracker',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF598BED),
                                              fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Programs for you',
                            style: GoogleFonts.lora(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF6D747A),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_outlined,
                                size: 24.0,
                                color: Color(0xFF6D747A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 280.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: FutureBuilder(
                            future: getProgramsApi(),
                            builder: (context, AsyncSnapshot<Map> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: Text('Loading...'));
                              } else {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: programsList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 280.0,
                                        width: 242.0,
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Image(
                                                image:
                                                    AssetImage('images/1.png'),
                                                height: 140.0,
                                                width: 242.0,
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Text(
                                                  programsList["items"][index]
                                                      ["category"],
                                                  style: GoogleFonts.inter(
                                                    color:
                                                        const Color(0xFF598BED),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0, right: 12.0),
                                                child: Text(
                                                  programsList["items"][index]
                                                      ["name"],
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0, bottom: 21),
                                                child: Text(
                                                  '${programsList["items"][index]["lesson"]} Lessons',
                                                  style: GoogleFonts.inter(
                                                    color:
                                                        const Color(0xFF6D747A),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Lessons for you',
                            style: GoogleFonts.lora(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF6D747A),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_outlined,
                                size: 24.0,
                                color: Color(0xFF6D747A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 300.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: FutureBuilder(
                                future: getProgramsApi(),
                                builder: (context, AsyncSnapshot<Map> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: Text('Loading...'));
                                  } else {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: lessonsList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 280.0,
                                            width: 248.0,
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8.0)),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  const Image(
                                                    image:
                                                    AssetImage('images/3.png'),
                                                    height: 140.0,
                                                    width: 242.0,
                                                  ),
                                                  const SizedBox(
                                                    height: 16.0,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 12.0),
                                                    child: Text(
                                                      lessonsList["items"][index]
                                                      ["category"],
                                                      style: GoogleFonts.inter(
                                                        color:
                                                        const Color(0xFF598BED),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 12.0, right: 12.0),
                                                    child: Text(
                                                      lessonsList["items"][index]
                                                      ["name"],
                                                      style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 12.0,
                                                          top: 15.0,
                                                        ),
                                                        child: Text(
                                                          '${lessonsList["items"][index]
                                                          ["duration"]} min',
                                                          style: GoogleFonts.inter(
                                                            color: const Color(0xFF6D747A),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 150,
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.only(right: 12.0),
                                                        child: Icon((Icons.lock)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 21.0,),
            ],
          ),
        )),
      ),
    );
  }
}
