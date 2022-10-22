import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart';

class MovieDetails extends StatefulWidget {
  Movies movies;
  MovieDetails({required this.movies});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movies.movie_name + " Movie"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/${widget.movies.movie_picture_name}"),
              Text("İndirim Uygulandı" ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
              Text("${widget.movies.movie_prices} \u{20BA}", style: TextStyle(fontSize: 37, color: Colors.black87),
              ),
              SizedBox(
                width: 200,
                height: 55,
                child: RaisedButton(
                  child: Text("Film Kirala",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  color: Colors.cyan,
                  textColor: Colors.black,
                  onPressed: () {
                    print("Kiralandı");
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
