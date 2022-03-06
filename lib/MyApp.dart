import 'package:flutter/material.dart';
class MyApp extends StatefulWidget{
  String ?name;
  int ?age;
  MyApp({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
  
}
class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  String _email ='';//this is state
  final emailEditingControler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    print('Run initState()');
  }
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('Run dispose()');
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.paused){
      print('App is in Background mode');
    }else if(state==AppLifecycleState.resumed){
      print('App is in Foreground mode');    }
  }
  @override
  Widget build(BuildContext context) {
    print('Run build()');
    // TODO: implement build
    return MaterialApp(
      title: 'This is a StatefulWidget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                controller: emailEditingControler,
                onChanged: (text){
                  this.setState(() {
                    _email = text;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20) )
                  ),
                  labelText: 'Enter your email'
                ),
              ),
              ),
                Text('See result here',
                style: TextStyle(fontSize: 20, color: Colors.blue),),
                Text(_email,
                style: TextStyle(fontSize: 20, color: Colors.yellow),)
            ]),
      
        ),
      ),
    );
  }
}