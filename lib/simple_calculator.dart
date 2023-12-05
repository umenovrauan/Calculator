import 'package:flutter/material.dart';
import  'button_values.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body:SafeArea(
        bottom: false,
        child: Column(children: [
          //output
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(32),
                child: Text("0",style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          //buttons
          Wrap(children: Btn.buttonValues.map((value) => SizedBox(width:value==Btn.n0?screenSize.width/2: (screenSize.width/4),height:screenSize.width/4 , child: buildButton(value)),).toList(),)
        ],),
      )
    );
  }

  Widget buildButton(value){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(color: getBtnColor(value), clipBehavior: Clip.hardEdge, shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white30)), child: InkWell(onTap: (){}, child: Center(child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 32),)))),
    );
  }

  Color getBtnColor(value){
    return [Btn.del, Btn.clr].contains(value)?Colors.grey:[Btn.per,Btn.multiply,Btn.add,Btn.subtract,Btn.divide,Btn.calculate].contains(value)?Colors.orange:Colors.black87;
  }
}
