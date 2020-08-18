import 'package:flutter/material.dart';
import 'package:hips/Widgets/Web_Page_Body.dart';

class WebPageScreen extends StatelessWidget {
  static const routeName = '/web-page';
  @override
  Widget build(BuildContext context) {
    return WebPageBody(
      content: [
        //SizedBox(height: 50),
        Container(
          padding: EdgeInsets.only(top: 50),
          height: 700,
          width: double.infinity,
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                    'https://www.mrgcm.com/wp-content/uploads/2017/12/BHS-Design-Kitchen-Design-Page-Banner.jpg'),
                width: double.infinity,
                height: 750,
              ),
              Text(
                'We provide the best for the chef and the environment',
                style: TextStyle(
                    backgroundColor: Colors.white60,
                    fontFamily: 'Aller',
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ],
            overflow: Overflow.clip,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 50),
        // Center(
        //   child: Text(
        //     'What we do',
        //     style: Theme.of(context).textTheme.headline6,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://cdn3.iconfinder.com/data/icons/cooking-class-chef-cook/318/chef-cook-learning-learn-003-512.png',
                      ),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 20),
                    Text(
                        'We provide chef for management training for their restaurant', style: Theme.of(context).textTheme.caption,)
                  ],
                ),
              ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/creative-design-kitchen-icon-kitchen-icon-113961815.jpg'),
                    height: 200,
                    width: 250,
                  ),
                  SizedBox(height: 20),
                  Text('Book your own professional kitchen space', style: Theme.of(context).textTheme.caption)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                        'data:image/png;base64,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'),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                      'Sell your food in our platform!', style: Theme.of(context).textTheme.caption,)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
