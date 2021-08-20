import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List <Content> contentList;

  const Previews({Key key, this.title, this.contentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal:8,vertical:12),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context,int index){
              final Content content=  contentList[index];
              return GestureDetector(
                onTap: ()=> print(content.name),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(content.imageUrl),fit: BoxFit.cover,),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color, width: 4.0)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient:const LinearGradient(
                            colors: [Colors.black87, Colors.black45, Colors.transparent],
                            stops: [0,0.25,1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color, width: 4.0)
                      ),
                    ),
                    Positioned(
                      left:0,
                      right:0,
                      bottom: 0,
                        child: SizedBox(
                          height: 60,
                          child: Image.asset(content.titleImageUrl),
                        ),
                    )
                  ],
                ),
              );
          },
          ),
        )
      ],
    );
  }
}
