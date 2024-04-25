import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: "Image List"),
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
  final List<String> imgList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyRzHldSVmt4_Ik48b_QSr-1K_HcYoEQEVrftJ7SEVQw&s",
    "https://i.blogs.es/ba4666/emele/1366_2000.jpg",
    "https://www.eleconomista.com.mx/__export/1565648827262/sites/eleconomista/img/2019/08/12/mercado-libre-imagen-corporativa-mercadolibre.jpg_1077173139.jpg",
    "https://blog.saleslayer.com/hubfs/mercado-libre-logo.jpg",
  ];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Center(
                          child: Image.network(e),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (value, _) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            buildCarouselIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              for (int i = 0; i < imgList.length; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  height: i == _currentPage ? 7 : 5,
                  width: i == _currentPage ? 7 : 5,
                  decoration: BoxDecoration(
                    color: i == _currentPage ? Colors.black : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
