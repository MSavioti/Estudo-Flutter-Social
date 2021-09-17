import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String _shareMessage = 'This is an example of a shared message!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social sharing demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Share.share(_shareMessage);
                },
                child: Text('Share text'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    final dir = Directory.current;

                    Share.shareFiles(['${dir.path}assets/flutter_logo.png']);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Share a file'),
              ),
              ElevatedButton(
                onPressed: () {
                  Share.share(
                    _shareMessage,
                    subject: 'Subject test',
                  );
                },
                child: Text('Share a file with text and a subject'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
