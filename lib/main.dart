import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Components/CallsComponents.dart';
import 'package:whatsapp/Components/ChatComponent.dart';
import 'package:whatsapp/Components/StatusUi.dart';

import 'globals/globals.dart';

void main() {
  runApp(whatsApp());
}

class whatsApp extends StatefulWidget {
  const whatsApp({Key? key}) : super(key: key);

  @override
  State<whatsApp> createState() => _whatsAppState();
}

class _whatsAppState extends State<whatsApp>
    with SingleTickerProviderStateMixin {
  late TabController tb;
  PageController pg = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tb = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (isIos == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                actions: [
                  const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Switch(
                      value: isIos,
                      onChanged: (val) {
                        setState(() {
                          isIos = val;
                        });
                      })
                ],
                backgroundColor: Colors.teal.shade900,
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                leading: const Icon(Icons.menu),
                bottom: TabBar(
                  onTap: (val) {
                    setState(() {
                      pg.animateToPage(val,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    });
                  },
                  controller: tb,
                  tabs: const [
                    Tab(
                      text: 'Chats',
                      icon: Icon(
                        Icons.chat,
                        size: 30,
                      ),
                    ),
                    Tab(
                      text: 'Calls',
                      icon: Icon(
                        Icons.call_sharp,
                        size: 30,
                      ),
                    ),
                    Tab(
                      text: 'Status',
                      icon: Icon(
                        Icons.circle_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              body: PageView(
                onPageChanged: (val) {
                  setState(() {
                    tb.animateTo(val);
                  });
                },
                controller: pg,
                children: const [
                  SingleChildScrollView(child: ChatComponent()),
                  SingleChildScrollView(child: CallsComponent()),
                  StatusComponent(),
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              child: Column(
                children: [
                  Expanded(
                    flex: 27,
                    child: IndexedStack(
                      index: currentValue,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        const Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Chats',
                                            style: TextStyle(
                                                fontSize: 33,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        Spacer(),
                                        Builder(
                                          builder: (context) {
                                            return CupertinoSwitch(
                                                value: isIos,
                                                onChanged: (val) {
                                                  setState(() {
                                                    isIos = val;
                                                  });
                                                });
                                          }
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CupertinoTextFormFieldRow(
                                      style: const TextStyle(
                                          height: 1.5, fontSize: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      placeholder: '  Search',
                                      prefix: Row(
                                        children: const [
                                          Icon(
                                            CupertinoIcons.search,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 22,
                              child: SingleChildScrollView(
                                child: Column(
                                    children: info
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: double.infinity,
                                                    child: Row(
                                                      children: [
                                                        Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            const CircleAvatar(
                                                              radius: 60,
                                                              backgroundColor:
                                                                  Colors.grey,
                                                            ),
                                                            CircleAvatar(
                                                              radius: 49.7,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      '${e['image']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${e['name']}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                            Text(
                                                              '${e['description']}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        const Text(
                                                          '9:00 AM ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList()),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Calls',
                                        style: TextStyle(
                                            fontSize: 33,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CupertinoTextFormFieldRow(
                                      style: const TextStyle(
                                          height: 1.5, fontSize: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      placeholder: '  Search Call',
                                      prefix: Row(
                                        children: const [
                                          Icon(
                                            CupertinoIcons.phone_circle_fill,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex: 22, child: CallsComponent()),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex: 22, child: StatusComponent()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CupertinoTabBar(
                      currentIndex: currentValue,
                      onTap: (val) {
                        setState(() {
                          currentValue = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(CupertinoIcons.chat_bubble_2_fill),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Chats',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(CupertinoIcons.phone),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Calls',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(CupertinoIcons.circle_grid_hex_fill),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Status',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
