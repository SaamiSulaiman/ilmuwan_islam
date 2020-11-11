import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Ilmuwan Islam App"),
        ),
        body: _PageList());
  }
}
//class
class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Abbas Bin Firnas",
    "Al Khawarizmi",
    "Al Zahrawi",
    "Ibn Al Haytham",
    "Ibnu Sina",
    "Jabir Al Hayyan"
  ];

  List<String> subjudul = [
    "Father Of Aviator",
    "Father Of Aljabar",
    "Father Of Surgeon",
    "Father Of Optics",
    "Father Of Modern Medical",
    "Father Of Modern chemistry"
  ];

  List<String> gambar = [
    "images/abbasbinfirnas.jpg",
    "images/alkhawarizmi.jpeg",
    "images/alzahrawi.jpg",
    "images/ibnalhaytham.jpg",
    "images/ibnusina.jpg",
    "images/jabiralhayyan.jpg"
  ];

  List<String> resep = [
    "Padahal pada tahun 9 Masehi, Abbas Ibn Firnas sudah berhasil mendesain alat yang memiliki sayap, mirip seperti kostum burung. Alat tersebut dibuat dengan perhitungan dan penelitian yang rumit. Pada waktu percobaannya, ia berhasil terbang cukup jauh hingga kemudian jatuh dan mematahkan tulang belakangnya. Ia kemudian menginspirasi ilmuwan barat untuk mengembangkan pesawat.",
    "Muhammad bin Musa Al-Khawarizmi adalah ahli matematika Islam yang dikenal sebagai penemu aljabar. Selain itu, ilmuwan asal Persia ini juga menemukan algoritma dan sistem penomoran. Al-Khawarizmi juga dikenal ahli di berbagai bidang, seperti astrologi dan astronomi.",
    "Ia adalah Bapak Ilmu Bedah Modern. Ia berhasil mengenalkan catgut (benang) sebagai alat untuk menutup luka. Selain itu, ia juga menyusun buku At-Tasrif liman Ajiza an at-Ta'lif yang menjadi rujukan dokter hingga sekarang. Di dalamnya, Al Zahrawi menuliskan hal-hal yang terkait dengan bedah, penyakit, dan temuan-temuannya berupa alat kedokteran.",
    "Ia dikenal sebagai Bapak Optik Modern. Karyanya yang terkenal adalah Kitab al-Manazir (Book of Optics) yang hingga kini diakui sebagai rujukan ilmu optik. Al Haytham berhasil menjelaskan bagaimana cara kerja optik mata manusia dalam menangkap gambar secara detail. Ia juga memberikan kontribusi dengan melakukan penelitian terhadap lensa, cermin, dan dispersi cahaya.",
    "Ia adalah seorang filsuf yang terkenal di dunia medis. Ia bahkan dijuluki sebagai Bapak Kedokteran Modern. Dua karyanya yang paling berpengaruh adalah ensiklopedia filsafat Kitab al-Shifa’ (The Book of Healing) dan The Canon of Medicine. Keduanya kini dipakai sebagai standar ilmu medis di seluruh dunia.",
    "Jabir Ibn Hayyan adalah seorang ahli kimia yang berasal dari Iran. Ia berhasil melarutkan emas dan menemukan asam kuat seperti asam sulfat, hidroklorik dan nitrat. Untuk menetralisir “monster” yang ia ciptakan, yaitu asam, ia kemudian memproduksi alkali. Karya-karyanya yang berupa buku adalah Kitab Al-Kimya, Kitab Al-Sab’een, Kitab Al-Rahmah, dan lain-lain."
  ];

  List<String> sampel = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subTitle = subjudul[index].toString();
            final img = gambar[index].toString();
            final sample = sampel[index].toString();
            final resepmakanan = resep[index].toString();
            return Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    backgroundImage(img),
                    Container(
                      child: topContent(title, subTitle, sample),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                            itemJudul: title,
                            itemImage: img,
                            itemSub: subTitle,
                            qty: resepmakanan,
                          )));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

backgroundImage(String gambar) {
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}

topContent(String nama, String deskripsi, String sample) {
  return new Container(
    height: 150,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderText,
          ),
          Container(
            height: 1,
            width: 100,
            color: Colors.lightBlueAccent,
          ),
          Text(
            deskripsi,
            style: descHeaderText,
          ),

          Text(
            sample,
            style: footerHeaderText,
          )
        ],
      ),
    ),
  );
}

final baseTextStyle = const TextStyle( fontFamily: 'arial');

final bigHeaderText =
baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

final descHeaderText =
baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);

final footerHeaderText =
baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

final detailstyle =
baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
