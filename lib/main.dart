import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var listofnum = 0;
  var generate = 0;
  List list = [];
  List list2 = [];
  int evenIndex = 0;
  int oddIndex = 1;
  int finaln = 0;
  int mv = 2;
  TextEditingController controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter number',
                    hintText: 'Enter number',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {
                      listofnum = int.parse(v);
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      listofnum = int.parse(value);
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  list.clear();
                  print(listofnum);
                  finaln = listofnum;
                  setState(() {
                    for (int i = 1; i <= finaln; i++) {
                      list.add(i);
                    }
                    for (int j = 1; j <= finaln * 2; j++) {
                      list2.add(j);
                    }
                  });
                  print(list);
                },
                child: Text("Generate"),
              ),
              Column(
                children: [
                  list != null
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 1,
                            crossAxisCount: 1,
                          ),
                          itemCount: finaln,
                          itemBuilder: (BuildContext ctx, index) {
                            return Row(
                              children: List.generate(
                                2,
                                (i) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 180,
                                      width: 178,
                                      child: index % 2 == i % 2
                                          ? Center(
                                              child: Text(
                                              "${index + 1}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ))
                                          : null,
                                      color: index % 2 == i % 2
                                          ? Colors.red
                                          : Colors.transparent),
                                ),
                              ),
                            );
                            //   Container(
                            //   height: 50,
                            //   width: 50,
                            //   alignment: Alignment.center,
                            //   child: v == 1
                            //       ? Text(mv.toString())
                            //       : SizedBox(),
                            //   decoration: BoxDecoration(
                            //       color: Colors.amber,
                            //       borderRadius: BorderRadius.circular(15)),
                            // );
                          })
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
