import 'package:flutter/material.dart';

class ViewMenteeRequestScreen extends StatelessWidget {
  const ViewMenteeRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 33.0,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title:  const Text(
          'Client Request Details ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0
          ),
        ),
        elevation: 0.0,
      ),
      body:

      Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: <Color>
                      [
                        Colors.blue,
                        Colors.white10
                      ],
                      tileMode: TileMode.mirror
                  )
              )
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleAndDesc(title: '#APT0001', description: '21 Oct 2019 10:00 AM'),
                  titleAndDesc(title: 'Status:', description: 'inprogress'),
                  titleAndDesc(title: 'Confirm Date:', description: '29 Jun 2019'),
                  titleAndDesc(title: 'Paid Amount', description: '\$450'),
                  titleAndDesc(title: 'Brief word about me and Why am I seeking your help', description: ' Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate nisi consequatur doloremque mollitia in deserunt asperiores nostrum, sit adipisci nam voluptas aliquam autem numquam alias eligendi itaque praesentium architecto eum.'),
                  titleAndDesc(title: 'My goal and steps I need to take', description: 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quisquam modi ea at, praesentium consequatur maiores voluptatem hic harum aperiam asperiores saepe, provident, molestiae placeat? Voluptas facilis hic in excepturi optio.'),
                  titleAndDesc(title: 'Areas I need guiding in', description: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Cum quasi nulla suscipit fugiat pariatur sit, deleniti explicabo at voluptatibus enim excepturi, similique consequuntur impedit eos soluta inventore itaque sunt voluptatum.'),
                  titleAndDesc(title: 'The biggest challenges I am facing', description: 'Lorem ipsum dolor, sit amet consectetur adipisicing elit.'),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget titleAndDesc({required String title, required String description})=> Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Text(

        title,

        style: TextStyle(

          fontWeight: FontWeight.w700,

          color: Colors.black,

          fontSize: 16.0,

        ),

      ),

      SizedBox(height: 4,),

      Text(

        description,

        style: TextStyle(

          fontWeight: FontWeight.w700,

          color: Colors.black.withOpacity(0.7),

          fontSize: 16.0,

        ),

      ),

    ],

  ),
);