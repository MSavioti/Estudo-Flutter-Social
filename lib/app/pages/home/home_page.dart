import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String _shareMessage = 'This is an example of a shared message!';
  final String _downloadLink =
      'https://i.picsum.photos/id/237/536/354.jpg?hmac=i0yVXW1ORpyCZpQ-CknuyV-jbtU7_x9EBQVhvT5aRr0';

  Future<void> _download() async {
    final _targetDirectory = await getApplicationDocumentsDirectory();
    final _downloadPath = '${_targetDirectory.path}/image.jpg';
    final dio = Dio();
    final _response = await dio.download(_downloadLink, _downloadPath);
    dio.close();
    if (_response.statusCode == 200) {
      await _share(_downloadPath);
    }
  }

  Future<void> _share(String filePath) async {
    Share.shareFiles([filePath], text: 'Example of file sharing!');
  }

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
                onPressed: () async {
                  try {
                    await _download();
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Share a file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
