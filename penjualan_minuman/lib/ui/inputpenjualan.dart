//input penjualan project agus seputra
//13/3/2020
import 'package:flutter/material.dart';
//import class penjualan
import 'package:penjualan_minuman/models/penjualan.dart';
//package untuk datepicker
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class InputPenjualan extends StatefulWidget {
//deklarasi variabel penjualan mewakili class Penjualan
  final Penjualan penjualan;
//menerima data penjualan
  InputPenjualan(this.penjualan);
//deklarasi variabel untuk menampung inputan textfield
  @override
  _InputPenjualanState createState() => _InputPenjualanState(this.penjualan);
}

class _InputPenjualanState extends State<InputPenjualan> {
  Penjualan penjualan;
  _InputPenjualanState(this.penjualan);
  TextEditingController namaController=TextEditingController();
  TextEditingController minumanController=TextEditingController();
  TextEditingController jenisController=TextEditingController();
  TextEditingController jumlahController=TextEditingController();
  TextEditingController hargaController=TextEditingController();
  TextEditingController tanggalController=TextEditingController();
  final format=DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
//inisialisasi data untuk form edit
    if(penjualan != null) {
      namaController.text=penjualan.nama;
      minumanController.text=penjualan.minuman;
      jenisController.text=penjualan.jenis;
      jumlahController.text=penjualan.jumlah;
      hargaController.text=penjualan.harga;
      tanggalController.text=penjualan.tanggal;
    }
    return Scaffold(
      appBar: AppBar(
      //menampilkan pesan berbeda untuk add dan update
        title: penjualan==null?Text("Transaksi Baru"):Text("Update Transaksi"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.0, left: 10.0, right: 10.0
        ),
        child: ListView(
          children: <Widget>[
            //menggunakan widget padding, atau yang lain
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: namaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
                onChanged: (value){

                },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: minumanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Minuman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0) 
                      ),
                  ),
                  onChanged: (value){

                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: jenisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Jenis",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)
                      ),
                  ),
                  onChanged: (value){

                  },
                ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Jumlah",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0)
                        ),
                    ),
                    onChanged: (value){

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Harga",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0)
                        ),
                    ),
                    onChanged: (value){

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      DateTimeField(
                        controller: tanggalController,
                        format: format,
                        onShowPicker: (context, currentValue){
                          return showDatePicker(
                            context: context, 
                            firstDate: DateTime(2020),
                            initialDate: currentValue??DateTime.now(), 
                            lastDate: DateTime(2045)
                            );
                        },
                        decoration: InputDecoration(
                          labelText: "Tanggal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)
                            ),
                        )
                      )
                  ],
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text("Simpan", textScaleFactor: 1.5,),
                            onPressed: (){
                              if(penjualan == null){
                                penjualan=Penjualan(namaController.text, minumanController.text, jenisController.text, jumlahController.text, hargaController.text, tanggalController.text);
                              }else{
                                penjualan.nama=namaController.text;
                                penjualan.minuman=minumanController.text;
                                penjualan.jenis=jenisController.text;
                                penjualan.jumlah=jumlahController.text;
                                penjualan.harga=hargaController.text;
                                penjualan.tanggal=tanggalController.text;
                                print("Ini Update ya");
                              }
                              Navigator.pop(context, penjualan);
                            },
                          ),
                          ),
                          Container(width: 5.0,),
                          Expanded(
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text("Batal", textScaleFactor: 1.5,),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            )
                      ],
                    ),
                    )
          ],
        ),
      ),
    );
  }
}