class Penjualan{
//deklarasi variabel untuk menangkap inputan
//tidak sama dg field pada tabel
int _id;
String _nama;
String _minuman;
String _jenis;
String _jumlah;
String _harga;
String _tanggal;
//deklarasi parameter untuk menerima inputan pada class
// Buat constructor. Dengan parameter untuk menyimpan hasil inputnya di variable yang dibuat tadi
Penjualan(this._nama,this._minuman,this._jenis,this._jumlah,this._harga,this._tanggal);
//memasukkan atribut pada map yang nantinya akan ditampilkan
// buat consturctor lagi. Tapi,dengan memberikan nama tambahan
//agar constructor pertama tidak menerima error
// Jika constructor ini dipanggil, akan mengambil data dari sql
//(Data dari sql yang tersimpan akan berbentuk Map)
//setelah itu, akan disimpan kembali ke dalam variable.
Penjualan.fromMap(Map<String, dynamic> map) {
  this._id=map['id'];
  //terdapat toString(), jika terdapat nilai angka tetap ditampilkan sebagai string
  this._nama=map['nama'].toString();
  this._minuman=map['minuman'].toString();
  this._jenis=map['jenis'].toString();
  this._jumlah=map['jumlah'].toString();
  this._harga=map['harga'].toString();
  this._tanggal=map['tanggal'].toString();
}
// membuat Getter dan setter
//getter akan mengambil nilai yang nanti dimasukkan ke consturctor
//variabel yang digunakan diluar class ini
//sebaiknya sesuaikan dengan field pada tabel
//inisialisasi variabel
int get id => _id;
String get nama => _nama;
String get minuman => _minuman;
String get jenis => _jenis;
String get jumlah => _jumlah;
String get harga => _harga;
String get tanggal => _tanggal;
//setter ini akan dipakai untuk mengembalikan nilai yang dimasukkan dari constructor
//per variable saja
//fungsi ini akan dipanggil pada proses pengisian data untuk form input
//dan yang menggunakan class penjualan
//sebaiknya disamakan nama fungsinya dengan variabel diatas
set nama (String value){
//sebaiknya disamakan dengan variabel lokal diatas _name
//jika berbeda dapat terjadi masalah pada proses update
  _nama=value;
}
set minuman (String value){
  _minuman=value;
}
set jenis (String value){
  _jenis=value;
}
set jumlah (String value){
  _jumlah=value;
}
set harga (String value){
  _harga=value;
}
set tanggal (String value){
  _tanggal=value;
}
//Terakhir, membuat method untuk memasukkan getter dan setter tadi ke dalam map
//return map digunakan pada database, nama variabel disamakan dg field
//method map ini untuk untuk membuat method update dan insert nanti
Map<String, dynamic> toMap(){
  Map<String, dynamic> map= Map<String, dynamic>();
  
  map['id']=this._id;
  map['nama']=nama;
  map['minuman']=minuman;
  map['jenis']=jenis;
  map['jumlah']=jumlah;
  map['harga']=harga;
  map['tanggal']=tanggal;
  return map;
  }
}