import 'package:flutter/material.dart';
import 'package:hips/Widgets/Web_Page_Body.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
    return WebPageBody(
      content: [
        SizedBox(height: 50),
        Center(
          child: Text('Our vision',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 300),
          child: Center(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu sollicitudin tellus. Phasellus auctor, metus vel pulvinar auctor, tortor sem blandit dui, sit amet finibus quam ipsum maximus magna. Quisque id consequat mauris. Donec imperdiet tincidunt massa, vitae laoreet nibh posuere non. Sed vulputate facilisis nibh, non cursus neque laoreet sed. Curabitur sed massa urna. Pellentesque accumsan dolor sed risus sollicitudin molestie. Vivamus ornare porttitor ante id tempor. Vestibulum vestibulum erat sed enim iaculis, id bibendum metus vehicula. Cras ac congue ligula, ac volutpat eros. Suspendisse volutpat, arcu in mattis molestie, tortor purus pulvinar orci, nec tempor leo est ut ex. Quisque faucibus sem elit. Integer id nisl non leo pretium pharetra accumsan ac odio. Praesent orci velit, posuere nec eros a, pulvinar viverra ante. Aenean vestibulum nisl felis, congue vehicula mi tincidunt ultricies. '),
          ),
        ),
        SizedBox(height: 50),
        SizedBox(height: 50),
        SizedBox(height: 50),
        Center(
          child: Text('Our Mission',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 300),
          child: Center(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu sollicitudin tellus. Phasellus auctor, metus vel pulvinar auctor, tortor sem blandit dui, sit amet finibus quam ipsum maximus magna. Quisque id consequat mauris. Donec imperdiet tincidunt massa, vitae laoreet nibh posuere non. Sed vulputate facilisis nibh, non cursus neque laoreet sed. Curabitur sed massa urna. Pellentesque accumsan dolor sed risus sollicitudin molestie. Vivamus ornare porttitor ante id tempor. Vestibulum vestibulum erat sed enim iaculis, id bibendum metus vehicula. Cras ac congue ligula, ac volutpat eros. Suspendisse volutpat, arcu in mattis molestie, tortor purus pulvinar orci, nec tempor leo est ut ex. Quisque faucibus sem elit. Integer id nisl non leo pretium pharetra accumsan ac odio. Praesent orci velit, posuere nec eros a, pulvinar viverra ante. Aenean vestibulum nisl felis, congue vehicula mi tincidunt ultricies. '),
          ),
        ),
        SizedBox(height: 50),
        SizedBox(height: 50),
        SizedBox(height: 50),
                SizedBox(width: 50),

        Center(
          child: Text('Our Team',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image(
                        image: AssetImage(
                      'Asset/Images/IMG_2425.JPG',
                    ),
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Text('Harry Devara',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    Text('CTO/Founder',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            // SizedBox(width: 30),
          Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image(
                        image: AssetImage(
                      'Asset/Images/IMG_5799.JPG',
                    ),
                    width: 200,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                Text('Harry Sugama',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    Text('CEO/Founder',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),],
        )
      ],
    );
  }
}
