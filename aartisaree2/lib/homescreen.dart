import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getDeatils()async{

    var response = await http.get(Uri.parse("https://api.aartisaree.com:4300/api/category")).then((value){
      print("data ${value.body}");
    });

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    getDeatils();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your menu functionality here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: SizedBox(
              height: 70,
              width: 150,
              child: Image.asset('assets/logo.png'),
            ),
          ),
          TextButton(
            onPressed: () {
              _handleLogout(context);

            },
            child: Text(
              'Log out',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/grid1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    // Shadow position, adjust as needed
                                    blurRadius:
                                    5, // Shadow blur radius, adjust as needed
                                  ),
                                ],
                                border:
                                Border.all(width: 3, color: Colors.white)),
                            child: Image.asset(
                              'assets/img2.jpg',
                              height: 200,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned.fill(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
                                  child: const Center(
                                      child: Text(
                                        'Todays Deal',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              // Shadow position, adjust as needed
                              blurRadius:
                              5, // Shadow blur radius, adjust as needed
                            ),
                          ], border: Border.all(width: 3, color: Colors.white)),
                          child: Image.asset(
                            'assets/img3.jpg',
                            height: 200,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            children: [
                              const Spacer(),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5)),
                                child: const Center(
                                    child: Text(
                                      'Drape Sarees without',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              // Shadow position, adjust as needed
                              blurRadius:
                              5, // Shadow blur radius, adjust as needed
                            ),
                          ], border: Border.all(width: 3, color: Colors.white)),
                          child: Image.asset(
                            'assets/img3.jpg',
                            height: 200,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
                                  child: const Center(
                                      child: Text(
                                        'Todays Deal',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              // Shadow position, adjust as needed
                              blurRadius:
                              5, // Shadow blur radius, adjust as needed
                            ),
                          ], border: Border.all(width: 3, color: Colors.white)),
                          child: Image.asset(
                            'assets/img4.jpg',
                            height: 200,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            children: [
                              const Spacer(),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5)),
                                child: const Center(
                                    child: Text(
                                      'Drape Sarees without',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              // Shadow position, adjust as needed
                              blurRadius:
                              5, // Shadow blur radius, adjust as needed
                            ),
                          ], border: Border.all(width: 3, color: Colors.white)),
                          child: Image.asset(
                            'assets/img5.jpg',
                            height: 200,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
                                  child: const Center(
                                      child: Text(
                                        'Todays Deal',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              // Shadow position, adjust as needed
                              blurRadius:
                              5, // Shadow blur radius, adjust as needed
                            ),
                          ], border: Border.all(width: 3, color: Colors.white)),
                          child: Image.asset(
                            'assets/img7.jpg',
                            height: 200,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            children: [
                              const Spacer(),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5)),
                                child: const Center(
                                    child: Text(
                                      'Drape Sarees without',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        // onTap: _onItemTapped,
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restore_outlined),
            label: 'Restore',
          ),
        ],
      ),
    );

  }
}
void _handleLogout(BuildContext context) {
  // Clear user data or do any necessary cleanup
  // For example, if you've stored user credentials in SharedPreferences, clear them:
  SharedPreferences.getInstance().then((prefs) {
    prefs.remove('mobileNumber');
    prefs.remove('password');
  });

  // Navigate back to the LoginScreen
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyPhone()),
  );
}