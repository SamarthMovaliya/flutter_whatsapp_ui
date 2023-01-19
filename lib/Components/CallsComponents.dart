import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class CallsComponent extends StatefulWidget {
  const CallsComponent({Key? key}) : super(key: key);

  @override
  State<CallsComponent> createState() => _CallsComponentState();
}

class _CallsComponentState extends State<CallsComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (info.isEmpty)
          ? const Center(
        child: Icon(
          Icons.add_box,
          size: 200,
          color: Colors.white10,
        ),
      )
          : Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: info
                  .map((e) => Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Container(
                          decoration:const BoxDecoration(
                            color: Colors.white,
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,
                              children: [
                                 CircleAvatar(
                                  radius: 45,
                                  backgroundImage: AssetImage(e['image']),
                                ),
                                Text(
                                  '${e['name']}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '${e['phone']}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:MaterialStateProperty.all(Colors.teal.shade900)
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Call',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(e['image']),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${e['name']}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: (isIos)
                                          ? Colors.black87
                                          : Colors.black87,
                                      fontWeight: (isIos)
                                          ? FontWeight.w700
                                          : FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 05,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              (isIos == false)
                                  ?  Icon(
                                Icons.phone,
                                size: 30,
                                color: Colors.teal.shade600,
                              )
                                  : const Icon(
                                CupertinoIcons.phone,
                                size: 30,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: (isIos == false)
                                ? Colors.white10
                                : Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
