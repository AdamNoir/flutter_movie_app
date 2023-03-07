import 'package:flutter/material.dart';
import 'package:movie_app/utils/custom_text.dart';

class Description extends StatelessWidget {
  final String? name;
  final String? description;
  final String bannerUrl;
  final String? posertUrl;
  final String? vote;
  final String? launchOn;

  const Description(
    {super.key, 
    this.name, 
    this.description, 
    required this.bannerUrl,
    this.posertUrl,
    this.vote,
    this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(text: '⭐ Average Rring - ' + vote!, size: 18,)
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name!=null ? name! : "Not Loaded", size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Releasing On - ' + (launchOn!= null ? launchOn! : "Unknow"), size: 14,),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posertUrl!),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(text: description!=null ? description! : "No description avalible", size: 14,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}