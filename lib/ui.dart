import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/ui.dart';
import 'package:tictactoe/Skelton.dart';





class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

bool fg = true;
List  output = ['','','','','','','','',''];
List  _output = ['','','','','','','','',''];
int counter =0;
String result ='';


//******************************************************************************************************* */
//********************************************************************************************************** */
 resBox(BuildContext context){
return showDialog(context: context, builder: (context){
  return AlertDialog(
    title: Text("Result"),
    content: Text(result),
    actions: [
      FlatButton(onPressed: (){Navigator.of(context).pop();
      restart();},
       child: Text("Restart"))
    ],
    elevation: 30.0,
  );
},
barrierDismissible: true,
);
}
//***************************************************************************************************** */
//*********************************************************************************************************8 */

restart(){
fg = true;
output = ['','','','','','','','',''];
_output = ['','','','','','','','',''];
counter =0;
setState(() {
  output= _output;
});
}

bttntap(String a , num i){
  
     if (fg)
      {a='X';

      
      }
    else{
      a='O';
    }

    if(output[i] == 'X' || output[i]== 'O'){
      counter --;
    }
    else{
    _output[i]=a;
    fg =!fg;
    }

setState((){
  for(int i=0 ; i<9 ; i++){
  output[i]= _output[i];
  
  
  }
  if(check(a, output)){
    resBox(context);

  }
  counter++;
  print(counter);
  if(counter==9 && !check(a, output)){
    result = 'It is a tie!!!!!! Try Again';
    resBox(context); 
  }
});

}

//**************************************************************************************************** */
check( String c , List ttt){
bool flag = false;
      if((ttt[0]== c && ttt[1]== c && ttt[2]== c) ||
         (ttt[0]== c && ttt[4]== c && ttt[8]== c) ||
         (ttt[0]== c && ttt[3]== c && ttt[6]== c) ||
         (ttt[1]== c && ttt[4]== c && ttt[7]== c) ||
         (ttt[2]== c && ttt[4]== c && ttt[6]== c) ||
         (ttt[2]== c && ttt[5]== c && ttt[8]== c) ||
         (ttt[3]== c && ttt[4]== c && ttt[5]== c) ||
         (ttt[6]== c && ttt[7]== c && ttt[8]== c)){
         if(c== 'X'){
            result = 'Player 1 Wins!!Congrats!';
            flag =true;}
         else{
            result = 'Player 2 Wins!!Congrats!';
            flag =true;}
         }
         return flag;
}


//**************************************************************************************************************** */
//************************************************************************************************************** */
 Widget bttn(List n , num l ,num t,num r,num b ,num key ,double bs) {
   
   String a;
   if(n[key] == null)
   {a = '';}
   else{
     a= n[key];
   }


    return new Container(
      child: FlatButton(
        height: bs * 0.22,
        minWidth: bs * 0.22,
        onPressed: () => bttntap(a , key),
        child: Text(
          a,
          style: TextStyle(
            fontSize: bs*0.18,
            color: Colors.grey,
          ),
        ),
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        //elevation: 0.0,
        //shape: Border(),
        
      ),
      padding: EdgeInsets.fromLTRB(l, t, r, b)
    );
  }
//********************************************************************************************************** */
//********************************************************************************************************** */



@override
Widget build(BuildContext context){

MediaQueryData deviceInfo = MediaQuery.of(context);
    Size a = deviceInfo.size;
    double devSize = a.width;
    print(devSize);

  
  return Scaffold(
    
    appBar: AppBar(
      title :Text("Tic Tac Toe"),
    ),
    backgroundColor: Colors.white,

    body: SingleChildScrollView(
          child: Container(
        child : Column(
          children :<Widget>[
          new Container(
            padding: EdgeInsets.symmetric(vertical :12.0),
            child: Center(
              child: Text("Player1 : X" , 
              style:TextStyle(fontSize: 24),
              ),
            ),
          ),
          //************************************************************************************************** */
          //************************************************************************************************** */

          new Container(
            //padding: EdgeInsets.symmetric(vertical :8.0),
            child: Center(
              child: Text("Player2 : O" , 
              style:TextStyle(fontSize: 24),
              ),
            ),
          ),

          //************************************************************************************************** */
          //************************************************************************************************** */


        new Divider(height: 50.0, indent: 500,),

        new Container(
          
        //color: Colors.black,
        height: devSize * 0.8,
        width: devSize * 0.8,
        decoration: BoxDecoration(
      color: Colors.black,
      /*image: const DecorationImage(
        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        fit: BoxFit.cover,
      ),*/
      border: Border.all(
        color: Colors.white,
        width: 0,
      ),
   // borderRadius: BorderRadius.circular(12),
  ),
        
        child: Column(
          children:<Widget>[
            Expanded(child:
            Row(
              children:[
                Expanded(child : bttn(output,0.0,0.0,8.0,8.0,0,devSize)),
                Expanded(child : bttn(output,8.0,0.0,8.0,8.0,1,devSize)),
                Expanded(child : bttn(output,8.0,0.0,0.0,8.0,2,devSize)),
              ]
            )),
            Expanded(child:
            Row(
              children:[
                Expanded(child : bttn(output,0.0,8.0,8.0,8.0,3,devSize)),
                Expanded(child : bttn(output,8.0,8.0,8.0,8.0,4,devSize)),
                Expanded(child : bttn(output,8.0,8.0,0.0,8.0,5,devSize)),
              ]
            )),
            Expanded(child:
            Row(
              children:[
                Expanded(child : bttn(output,0.0,8.0,8.0,0.0,6,devSize)),
                Expanded(child : bttn(output,8.0,8.0,8.0,0.0,7,devSize)),
                Expanded(child : bttn(output,8.0,8.0,0.0,0.0,8,devSize)),
              ]
            ))
          ]
        ),
      ),




        new Divider(height: 80.0, indent: 500,),
       // new Expanded(child: Container()),
      new Container(
        //color: Colors.red,

        child:Row(
          children: [
            new Expanded(child: MaterialButton(onPressed: (){
                  restart();
                    setState(() {
                                });}, 
            child: Icon(Icons.undo, size: 50.0,),
            color: Colors.blue,
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0))),





            new Expanded(child: MaterialButton(onPressed: (){
                  restart();
                    setState(() {
                                });},
 
            child: Icon(Icons.refresh , size: 50.0,),
            color: Colors.blue,
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0),)),
            
          ],
        ))
          ]
        ),


      ),
    ),

    
  );
}
  
  }
