import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(width:_screenSize.width ,
            height: MediaQuery.of(context).size.height*0.25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(200.0) ,bottomRight:Radius.circular(200.0))
            ),

          ),
        Container(width:_screenSize.width ,
          height: MediaQuery.of(context).size.height*0.20,
          decoration: BoxDecoration(
              color: const Color(0xff978597),
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(200.0) ,bottomRight:Radius.circular(200.0))
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0,30.0,100.0,20.0),
            child: TextFormField(
              style: TextStyle(color: Colors.black,fontSize: 18.0),
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0)),
                  labelText: 'Search for movies and series',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black,

                  )),
            ),
          ),

        ),
      ],
    ) ;
  }
}
