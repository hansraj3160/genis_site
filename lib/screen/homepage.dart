import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:genie_site/screen/components/colors.dart';
import 'package:get/get.dart';
import 'package:star_menu/star_menu.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String lan = "English";
  final List<String> items = [
    'English',
    'Hindhi',
    'Urdu',
  ];
  String? selectedValue;
  List<Widget> upperMenuItems = [
    Text('menu entry 1'),
    Text('menu entry 3'),
    Text('menu entry 3'),
  ];
  changelag(int i) {
    setState(() {
      lan = items[i];
    });
  }

  menubutton(String text) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: TextButton(
          onPressed: (() => {}),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  menubuttonIcon(Icon ic) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: ic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimary,
        title: Image.asset(
          "assets/images/logo.png",
          width: 120,
        ),
        actions: [
          menubutton("Home"),
          menubutton("About Us"),
          menubutton("Privacy Policy"),
          menubuttonIcon(Icon(Icons.notifications)),
          menubuttonIcon(Icon(Icons.favorite)),
          menubuttonIcon(Icon(Icons.shopping_cart)),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(Icons.translate),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(lan),
          ),
          PopupMenuButton(
              tooltip: "Language",
              icon: Icon(Icons.arrow_drop_down),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("English"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Hindi"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Urdu"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  changelag(0);
                } else if (value == 1) {
                  changelag(1);
                } else if (value == 2) {
                  changelag(2);
                }
              }),
          StarMenu(
            params: StarMenuParameters.dropdown(context).copyWith(
              backgroundParams: BackgroundParams().copyWith(
                sigmaX: 3,
                sigmaY: 3,
              ),
            ),
            items: upperMenuItems,
            onItemTapped: (index, _) => print('Item $index tapped'),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(Icons.menu),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: (() => {}),
              icon: Icon(Icons.lock),
              label: Text("Sign In"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 218, 203, 33) //elevated btton background color
                  ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/clip-geo.png",
                                width: 25),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                suffixIcon: MaterialButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child:
                                      Icon(Icons.location_searching_outlined),
                                ),

                                suffixIconColor: kprimary,
                                hintText:
                                    'Choose your location to start shopping',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: (() => {}),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      kprimary //elevated btton background color
                                  ),
                              child: Text("Set Location"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: (() => {}),
                              child: Text("Pick From Map"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      kprimary //elevated btton background color
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 237, 150, 240),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("data"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/google.png",
                              width: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: (() => {}),
                              child: Text("Pick From Map"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      kprimary //elevated btton background color
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Container(
              color: kprimary,
              child: Stack(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
