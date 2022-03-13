import 'package:flutter/material.dart';
import '../stream/message_stream.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<StatefulWidget>{
  late MessageStream messageStream = MessageStream();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streamer',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Streamer V0.0.1'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  );
                }
            )
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                child: Text(messages[index]),
              );
            }
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Start Stream'),
          hoverColor: Colors.green,
          onPressed: () {
            print('Sending messages...');
            sendMessage();
          },
        ),
      ),
    );
  }

  sendMessage() async {
    messageStream.getMessage().listen((eventMessage) {
      setState(() {
        //print(eventVocab);
        messages.add(eventMessage);
      });
    });
  }

}