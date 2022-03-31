import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget? someWidget;

  Future? changeWidget() {
    someWidget = loaderList();
    Future.delayed(Duration(seconds: 7), () {
      setState(() {
        someWidget = randomList();
      });
    });
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    changeWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: someWidget
      )
    );
  }
}

Widget randomList() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 15,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        subtitle: Text("Lorem Ipsum"),
      );
    },
  );
}

Widget loaderList() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: Colors.grey,
    period: Duration(seconds: 4),
    child: ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey,),
          title: Container(
            height: 15,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4)
            ),
          ),
          subtitle: Container(
            height: 15,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4)
            ),
          ),
        );
      },
    ),
  );
}





