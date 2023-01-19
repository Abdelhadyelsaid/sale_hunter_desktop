import 'package:flutter/material.dart';
class RelatedModel extends StatefulWidget {
  const RelatedModel({Key key}) : super(key: key);

  @override
  _RelatedModelState createState() => _RelatedModelState();
}

class _RelatedModelState extends State<RelatedModel> {
  bool fav =true;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Wrap(
        //لما نربط بالداتا هنحلي ال 10 دي تاخد ال length of data base
          children:List.generate(10, (index){
            return Card(
              elevation:1,
              child: Column(

                children:<Widget> [
                  Container(
                    width: 800/1,
                    height: 300,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              ///لما تيجي تقرأ من الداتا بيز هنخليه يا خد الصوره منهم ونبقي نمسح الصور من الassets
                              image: AssetImage('assets/images/main photo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                                  child: Text(
                                    'Apple iphone 13 512gb - midnight',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(200, 50, 0, 0),
                                  child: InkWell(
                                    child: fav
                                        ? Icon(
                                      Icons.favorite_border,
                                    )
                                        : Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        fav = !fav;
                                      });
                                    },

                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: 500,
                              child: Text(
                                'iPhone 13 The most advanced dual camera on the iPhone to date. The blazing-fast A15Bionic chip. Significantly improved battery life. Rugged design. Super-fast 5G. And abrighter Super Retina XDR display. ',
                               // overflow: TextOverflow.ellipsis,
                                overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 16.0,),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                ///rate icon
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      ///لما تيجي تقرأ من الداتا بيز هنخليه يا خد الصوره منهم ونبقي نمسح الصور من الassets
                                      image: AssetImage('assets/images/rate x2.png'),
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 20,
                                ),

                                ///text rate
                                Text(
                                  '3.2(3.214)',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                ///Price After Sale
                                Text(
                                  '70.00',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepOrange,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(
                                  width: 30.0,
                                ),

                                ///Price before sale
                                Text(
                                  '99.00',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(
                                  width: 70.0,
                                ),

                                ///Logo
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        ///لما تيجي تقرأ من الداتا بيز هنخليه يا خد الصوره منهم ونبقي نمسح الصور من الassets
                                        image: AssetImage('assets/images/jumia-seeklogo.com.png'),
                                        // fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            );
          })
      ),
    );
  }
}
