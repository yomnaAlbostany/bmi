import 'package:bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.height, required this.weight});
  final int weight;
  final int height;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final double res =
        widget.weight / ((widget.height / 100) * (widget.height / 100));

    String bmiValue() {
      if (res < 18.5) {
        return  'Underweight';
      } else if (res >= 18.5 && res <= 24.9) {
        return 'Normal';
      } else if (res >= 25 && res <= 29.9) {
        return'Overweight';
      } else if (res >= 30) {
        return  'Obese';
      } else {
        return '';
      }
    }


    double sliderVal() {
      if (res < 18.5) {
        return  5;
      } else if (res >= 18.5 && res <= 24.9) {
        return 25;
      } else if (res >= 25 && res <= 29.9) {
        return 48;
      } else if (res >= 30) {
        return 80;
      } else {
        return 0;
      }
    }

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Row(
            children: [
              Text(
                'YOUR',
                style: TextStyle(
                    color: Color(0xFF00C3C3), fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Summary',
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 300,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Your BMI is',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          Text(
                            res.toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00C3C3)),
                          ),
                          const Text(
                            'kg/m2',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: CustomPaint(
                              painter: SliderTrackPainter(sliderVal()),
                              child: Slider(
                                value: sliderVal(),
                                onChanged: (newValue) {
                                  setState(() {});
                                },
                                activeColor: const Color.fromARGB(0, 0, 0, 0),
                                inactiveColor:
                                    const Color.fromARGB(0, 255, 255, 255),
                                thumbColor: Colors.white,
                                min: 0,
                                max: 80,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Your weight is',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                bmiValue(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00C3C3)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Healthy BMI range: 18.5 kg/m2 - 25 kg/m2 Healthy weight for the height: 56.7 kgs - 76.6 kgs Ponderal index 13.1 kg/m3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.white70),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 20, top: 170),
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
                    setState(() {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (c) =>const BmiScreen()));
                    });
                  },
                  child: const Text(
                    'Recalculate  BMI',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]));
  }
}

class SliderTrackPainter extends CustomPainter {
  final double value;

  SliderTrackPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 8;
    double quarterWidth = size.width / 4;
    paint.color = Colors.red;
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(quarterWidth, size.height / 2), paint);

    paint.color = Colors.yellow;
    canvas.drawLine(Offset(quarterWidth, size.height / 2),
        Offset(quarterWidth * 2, size.height / 2), paint);

    paint.color = Colors.green;
    canvas.drawLine(Offset(quarterWidth * 2, size.height / 2),
        Offset(quarterWidth * 3, size.height / 2), paint);

    paint.color = Colors.blue;
    canvas.drawLine(Offset(quarterWidth * 3, size.height / 2),
        Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
