import 'package:flutter/material.dart';
import 'package:movie_app/DetailsMovie.dart';
import 'movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Movies>> MoviesGet() async{
    var movieList = <Movies>[];
    var m1 = Movies(1, "Avatar", "avatar.jpg", 10.99);
    var m2 = Movies(2, "Batman", "batman.jpg", 8.99);
    var m3 = Movies(3, "Popeye", "popeye.jpg", 8.99);
    var m4 = Movies(4, "Dolittle", "dolittle.jpg", 9.50);
    var m5 = Movies(5, "Orumcek Adam" ,"orumcek_adam.jpg", 10.99);
    var m6 = Movies(6, "Black Adam", "black_adam.jpg", 11.99);


    movieList.add(m1);
    movieList.add(m2);
    movieList.add(m3);
    movieList.add(m4);
    movieList.add(m5);
    movieList.add(m6);

    return movieList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: MoviesGet(),
        builder: (context, snapshot){
          if(snapshot.hasData){
              var movieLists = snapshot.data;

              return GridView.builder(
                  itemCount: movieLists?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5
                ),
                itemBuilder: (context,index){
                    var movie = movieLists![index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetails(movies: movie) ));                      },
                      
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("assets/images/${movie.movie_picture_name}"),
                            ),
                            Text(movie.movie_name, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("${movie.movie_prices} \u{20BA}",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    );
                },
              );

          }else{
            return Center(
              child:Row(
                children: [
                  Text("Bilinmeyen Bir Hata Oluştu?", style: TextStyle(color: Colors.black26),)
                ],
              ),
            );
          }
        },
      )

    );
  }
}
