import 'package:flutter/material.dart';
 //var size = MediaQuery.of(context).size;
class Logo{

 static const  logo =  Image(image: NetworkImage( "data:image/jpeg;base64,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",
 ),
  height:  200,
  width: 300,);
}

          
           

