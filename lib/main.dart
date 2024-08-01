import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: myHomePage(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref){
  return 0 ;
});

class myHomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context,WidgetRef ref){
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RiverPod'),
      ),
      body: Center(
        child:
          Text('value = $value',style: TextStyle(fontSize: 32),),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(40,10,15,10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(onPressed: () => ref.read(counterStateProvider.state).state++,child: Icon(Icons.plus_one)),
            Expanded(child: Container()),
            FloatingActionButton(onPressed: () => ref.read(counterStateProvider.state).state--,child: Icon(Icons.exposure_minus_1))
          ],
        ),
      ),
    );
  }
}
