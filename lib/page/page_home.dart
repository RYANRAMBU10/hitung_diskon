import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  int iHarga = 0;
  int iDiskon = 0;
  int iHasil = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffb71c1c),
        centerTitle: true,
        title: const Text('Hitung Diskon',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              textInputAction: TextInputAction.done,
              onChanged : (txt){
                setState((){
                  iHarga = int.parse(txt);
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xffb71c1c)
                    ),
                  ),
                  labelText: "Masukkan Harga",
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  floatingLabelStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffix: const Text('Rp'),
                  suffixStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              textInputAction: TextInputAction.done,
              onChanged : (txt){
                setState((){
                  iDiskon = int.parse(txt);
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xffb71c1c)
                    ),
                  ),
                  labelText: "Masukkan Diskon",
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  floatingLabelStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffix: const Text('%'),
                  suffixStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffb71c1c)
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        if (iHarga == 0 || iDiskon == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text('Ups, inputan tidak boleh ada yang kosong!',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )
                                      ),
                                    )
                                  ],
                                ),
                                backgroundColor: Color(0xffb71c1c),
                                shape: StadiumBorder(),
                                behavior: SnackBarBehavior.floating,
                              )
                          );
                        }
                        else {
                          int diskon = iHarga * iDiskon;
                          int hasil = diskon ~/ 100;
                          iHasil = iHarga - hasil;
                        }
                      });
                    },
                    child: const Center(
                      child: Text(
                        "Hitung Diskon",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            width: size.width * 0.7,
            height: size.height * 0.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 3,
                  color: const Color(0xffb71c1c),
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  iHasil.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb71c1c),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}