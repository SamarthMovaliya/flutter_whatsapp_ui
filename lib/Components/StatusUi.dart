import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class StatusComponent extends StatefulWidget {
  const StatusComponent({Key? key}) : super(key: key);

  @override
  State<StatusComponent> createState() => _StatusComponentState();
}

class _StatusComponentState extends State<StatusComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(info[6]['image']),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'My Status',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_box,
                    size: 30,
                    color: Colors.grey.shade600,
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
            ),
            Divider(
              thickness: 10,
            ),
          ],
        )),
        Expanded(
          flex: 17,
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: info
                      .map((e) => Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                              child: Align(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          child: CircleAvatar(
                                            radius: 37,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage:
                                                  AssetImage(e['image']),
                                            ),
                                          ),
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
                                      ],
                                    ),
                                    Divider(
                                      color: (isIos == false)
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade300,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
