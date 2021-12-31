import 'package:flutter/material.dart';

import 'data/faq.dart' as faq;
import 'data/faq.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            top: 100,
          ),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        faq.itemFaq[index].isExpanded = !isExpanded;
                      });
                    },
                    children: faq.itemFaq.map<ExpansionPanel>((FAQ item) {
                      return ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                item.question,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                          body: ListTile(
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16,),
                              child: Text(
                                item.answer,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          isExpanded: item.isExpanded);
                    }).toList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
