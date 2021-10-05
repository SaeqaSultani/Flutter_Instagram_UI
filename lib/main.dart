import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mudole/class.dart';


List <User> users = [
  User(id: 1, family: 'Sultani',),
  User(id: 2, family: 'Hanif',),
  User(id: 3, family: 'Alipor',),
  User(id: 4, family: 'Rezvani',),
  User(id: 5, family: 'Rezaiy',),
  User(id: 6, family: 'Khan',),
];

List<Post> _post = [
    Post(userId: 4, id: 4, title: 'title', userLike: 1, like: 124, comments: 24),
    Post(userId: 1, id: 2, title: 'title', userLike: 2, like: 12, comments: 240),
    Post(userId: 2, id: 1, title: 'title', userLike: 3, like: 123, comments: 23),
    Post(userId: 4, id: 2, title: 'title', userLike: 4, like: 12, comments: 234),
    Post(userId: 2, id: 3, title: 'title', userLike: 5, like: 126, comments: 213),


];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(54, 65, 78, 1),
        title: Text('Instagram',style: GoogleFonts.dancingScript(fontSize: 32,fontWeight: FontWeight.bold),),
        leading: IconButton(icon: Icon(Icons.add_box_outlined),onPressed: (){},),
        actions: [
          IconButton(icon: Icon(Icons.send_outlined),onPressed: (){},),
        ],
      ),
      backgroundColor: Color.fromRGBO(56, 69, 81, 1),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: users.map((e) => UserAvatar(e)).toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView(
              children: _post.map((e) => UserPost(post: e)).toList(),
            ),
          )
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(56, 69, 81, 1),
          primaryColor: Colors.red,
          textTheme: Theme
            .of(context).textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(56, 69, 81, 1),
          fixedColor: Color.fromRGBO(56, 69, 81, 1),
          items: [
            BottomNavigationBarItem(label: '',icon: Icon(Icons.home_filled,color: Colors.white,size: 30,)),
            BottomNavigationBarItem(label: '',icon: Icon(Icons.search,color: Colors.white,size: 30,)),
            BottomNavigationBarItem(label: '',icon: Icon(Icons.add_box_outlined,color: Colors.white,size: 30,)),
            BottomNavigationBarItem(label: '',icon: Icon(CupertinoIcons.heart,color: Colors.white,)),
            BottomNavigationBarItem(label: '',icon: Icon(Icons.person_outline_outlined,color: Colors.white,size: 30,)),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {

  final User user;

  UserAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red.shade200,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Color.fromRGBO(56, 69, 81, 1),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('images/${this.user.id}.jpg'),),
            ),
          ),
          SizedBox(height: 3,),
          Text('${this.user.family}',style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}


class UserPost extends StatelessWidget {

  final Post post;

  UserPost({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage('images/${this.post.userId}.jpg'),),
              SizedBox(width: 5,),
              Text('${users.where((element) => element.id==this.post.userId).first.family}',style: TextStyle(color: Colors.white),),
              Spacer(),
              IconButton(icon: Icon(Icons.more_horiz_rounded,color: Colors.white,),onPressed: (){},),
            ],
          ),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/${this.post.id}.jpg'),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15)
            ),
            height: 300,
          ),
          Row(
            children: [
              IconButton(icon: Icon(CupertinoIcons.heart_fill,color: Colors.red,),onPressed: (){},),
              IconButton(icon: Icon(CupertinoIcons.chat_bubble_text_fill,color: Colors.white,),onPressed: (){},),
              IconButton(icon: Icon(Icons.send_outlined,color: Colors.white,),onPressed: (){},),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red
                ),
                height: 5,
                width: 7,
              ),
              CircleAvatar(radius: 3,backgroundColor: Colors.grey,),
              CircleAvatar(radius: 3,backgroundColor: Colors.grey,),
              CircleAvatar(radius: 3,backgroundColor: Colors.grey,),
              CircleAvatar(radius: 3,backgroundColor: Colors.grey,),
              Spacer(),
              IconButton(icon: Icon(Icons.bookmark_border,color: Colors.white,),onPressed: (){},),

            ],
          ),
          SizedBox(height: 3,),
          Row(
            children: [
              CircleAvatar(radius:12,backgroundImage: AssetImage('images/${this.post.userLike}.jpg'),),
              Text('Liked by Ali and',style: TextStyle(color: Colors.white),),
              Text('${this.post.like}others',style: TextStyle(color: Colors.grey),),
            ],
          ),
          SizedBox(height: 3,),
          Row(
            children: [
              Text('view all${this.post.comments}',style: TextStyle(color: Colors.grey,fontSize: 13),),
              Text('.More',style: TextStyle(color: Colors.white,fontSize: 12),),
            ],
          )
        ],
      ),
    );
  }
}



