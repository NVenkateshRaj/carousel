import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> imageList=["assets/images/1.jpg","assets/images/2.jpeg","assets/images/2.jpg","assets/images/3.png","assets/images/4.jpeg"];
  int page=0;



  List<T> map<T>(List list,Function handler){
    List<T> result=[];
    for(int i=0;i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: CarouselSlider(
                items: imageList.map((e) {
                  return Builder(
                    builder: (context){
                      return Container(
                       // width: MediaQuery.of(context).size.width,
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image(
                          image: ExactAssetImage(e),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
                options:CarouselOptions(
                  height: 400,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      page = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ) ,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children:map<Widget>(imageList,(index,url){
                    return Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page==index?Colors.black26:Colors.grey
                      ),
                    );
                  }
                  ) ,
                ),
          ),
          ],
        ),
      ),
    );
  }
}
