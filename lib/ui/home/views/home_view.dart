import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  // final AmongUsCharacter amon = new  AmongUsCharacter();
  
  @override
  Widget build(BuildContext context) {
    return container(context);
  }

  Widget container(context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Text('Deliza a izquierda o derecha', style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.remove_circle_outline, color: Colors.redAccent, size: 50.0,),
                Icon(Icons.favorite_border, color: Colors.lightGreen, size: 50.0,)
              ],
            )
          ],
        ),
        SizedBox(height: 30.0,),

        card(context),
      ],
    );
  }

  Widget card(context){

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.44,
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.white.withOpacity(0.0),
            );
          },
          itemCount: 20,
          itemBuilder: (context, index) {

            return Dismissible(
              background: Container(color:Colors.redAccent),
              secondaryBackground: Container(color:Colors.lightGreen),
              key: Key('a'),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset('assets/players/crewmate-1.png'),
                  )
                ],
              ),

            );
          }
        ),
      )
    );
  }

}
