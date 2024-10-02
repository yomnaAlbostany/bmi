import 'package:bmi/res.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = false;
  int weight = 70;
  int height = 170;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Row(
          children: [
            Text(
              'BMI',
              style: TextStyle(
                  color: Color(0xFF00C3C3), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Calculator',
              style: TextStyle(color: Colors.white70),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              'Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(145, 41, 37, 37),
                      Color.fromARGB(66, 64, 62, 62),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        gender('female'),
                        const SizedBox(
                          width: 10,
                        ),
                        gender('male')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Weight',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    value(weight, () {
                      setState(() {
                        weight++;
                      });
                    }, () {
                      setState(() {
                        weight--;
                      });
                    }, 'kg'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Height',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    value(
                        height,
                        () => setState(() {
                              height++;
                            }),
                        () => setState(() {
                              height--;
                            }),
                        'cm'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Age',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    value(
                        age,
                        () => setState(() {
                              age++;
                            }),
                        () => setState(() {
                              age--;
                            }),
                        'years'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                    
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00C3C3),
                              Color.fromARGB(210, 123, 250, 250)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: 
                              (c) => ResultPage(weight: weight,height: height,)));
                        },
                        child: const Text(
                          'Calculate ',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  value(int val, Function() f1, Function() f2, String type) {
    return Row(
      children: [
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white24,
              foregroundColor: Colors.white,
            ),
            onPressed: f1,
            icon: const Icon(Icons.add)),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 90,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Center(
              child: Text(
                val.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white24,
              foregroundColor: Colors.white,
            ),
            onPressed: f2,
            icon: const Icon(Icons.remove)),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 55,
          child: Center(
            child: Text(
              type,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  gender(String type) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap:
            (isMale && type == 'male') || (isMale == false && type == 'female')
                ? null
                : () {
                    setState(() {
                      isMale = !isMale;
                    });
                  },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
              border: Border.all(
                  color: (isMale && type == 'male') ||
                          (isMale == false && type == 'female')
                      ? const Color(0xFF00C3C3)
                      : Colors.black,
                  width: 2),
              borderRadius: BorderRadius.circular(15),
              color: Colors.black),
          child: Column(
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 60,
                color: (isMale && type == 'male') ||
                        (isMale == false && type == 'female')
                    ? const Color(0xFF00C3C3)
                    : Colors.white70,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: TextStyle(
                    color: (isMale && type == 'male') ||
                            (isMale == false && type == 'female')
                        ? const Color(0xFF00C3C3)
                        : Colors.white70,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
