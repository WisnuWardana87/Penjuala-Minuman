import 'package:flutter/material.dart';
import 'ui/home.dart';
//packegdatepicker
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Daftar Nama',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(),
    );
  }
}

// Create a Form widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController minumanController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final format=DateFormat('yyyy-MM-dd');
  List<String> options = <String>['Pilihan 1', 'Pilihan 2', 'Pilihan 3', 'Pilihan 4', 'Pilihan 5', 'Pilihan 6'];
  String dropdownValue = 'Pilihan 1';
  @override
  // Build a Form widget using the _formkey created above.
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Mohon isi Nama Lengkap';
                }
                return null;
              },
              controller: namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              )
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Mohon isi Nama Minuman';
                }
                return null;
              },
              controller: minumanController,
              decoration: InputDecoration(
                labelText: "Minuman",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              )
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Mohon isi Jenis Minuman';
                }
                return null;
              },
              controller: jenisController,
              decoration: InputDecoration(
                labelText: "Jenis",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              )
            ),
          ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: jumlahController,
                //textfield type number
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                    ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Mohon isi dengan Angka";
                  }
                  return null;
                },
              ),
            ),
              Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: hargaController,
                //textfield type number
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                    ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Mohon isi dengan Angka";
                  }
                  return null;
                },
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    //widget DateTimeField terdapat pada package datetime_picker_formfield
                    DateTimeField(
                      controller: tanggalController,
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          //setting datepicker
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
                      ),
                      validator: (DateTime dateTime) {
                        if (dateTime == null) {
                          return "Mohon diisi Tanggal";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: DropdownButton<String>(
                  hint: new Text("Pilih Salah Satu"),
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        );
      }
    }



