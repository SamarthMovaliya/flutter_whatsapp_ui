import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: (info.isEmpty)
                ? Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height/1.1,
                child: const Center(
                  child: Icon(
                    Icons.add_box,
                    size: 200,
                    color: Colors.grey,
                  ),
                ),
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
                        .map(
                          (e) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                     CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(e['image']),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '${e['name']}',
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                              FontWeight.bold,
                                              color:
                                              Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 05,
                                        ),
                                        Text(
                                          '${e['description']}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight.bold,
                                              color:
                                              Colors.black45),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Text(
                                      '9 : 00 AM',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black45),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    (isIos)
                                        ? const Icon(
                                      CupertinoIcons
                                          .forward,
                                      size: 30,
                                    )
                                        : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  color: (isIos == false)
                                      ? Colors.black26
                                      : Colors.black26,
                                  thickness: 0.5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
