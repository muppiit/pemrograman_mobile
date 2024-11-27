# Nama : Achmad Mufid

# Kelas : TI-3B

# NIM : 2241720159

<br>

## Praktikum 1

### Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama books di folder src week-11 repository GitHub Anda.

Kemudian Tambahkan dependensi http dengan mengetik perintah berikut di terminal.

```py
flutter pub add http
```

### Langkah 2: Cek file pubspec.yaml

Jika berhasil install plugin, pastikan plugin http telah ada di file pubspec ini seperti berikut.

```dart
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```

### Langkah 3: Buka file main.dart

Ketiklah kode seperti berikut ini.

#### Soal 1

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "2241720159 Achmad Mufid",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2241720159 Achmad Mufid"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () async {},
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

### Langkah 4: Tambah method getData()

Tambahkan method ini ke dalam class \_FuturePageState yang berguna untuk mengambil data dari API Google Books.

```dart
Future<Response> getData() async {
  const authority = 'www.googleapis.com';
  const path = '/books/v1/volumes/zA36EAAAQBAJ';
  Uri url = Uri.https(authority, path);
  return await get(url);
}
```

#### Soal 2

Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
![alt text](img/1.png)

### Langkah 5: Tambah kode di ElevatedButton

Tambahkan kode pada onPressed di ElevatedButton seperti berikut.

```dart
ElevatedButton(
              child: const Text('GO!'),
              onPressed: () async {
                setState(() {});
                getData().then((value) {
                  setState(() {
                    result = value.body.toString().substring(0, 450);
                    setState(() {});
                  });
                }).catchError((_) {
                  setState(() {
                    result = "An error occurred";
                    setState(() {});
                  });
                });
              },
            ),
```

#### Soal 3

- Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!<br>
  Jawab :<br>
  substring digunakan untuk mengambil data dari index tertentu pada string. catchError digunakan untuk menangkap error yang terjadi pada kode.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.<br>
  ![alt text](img/gif1.gif)

## Praktikum 2

### Langkah 1: Buka file main.dart

Tambahkan tiga method berisi kode seperti berikut di dalam class \_FuturePageState.

```dart
Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
```

### Langkah 2: Tambah method count()
Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.
```dart
  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
```

### Langkah 3: Panggil count()
Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.
```dart
ElevatedButton(
              child: const Text('GO!'),
              onPressed: () async {
                count();
              },
            ),
```

### Langkah 4: Run
Akhirnya, run atau tekan F5 jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.
![alt text](img/2.png)

#### Soal 4
- Jelaskan maksud kode langkah 1 dan 2 tersebut!<br>
Jawab: <br>
Kode langkah 1 adalah kode yang akan mengembalikan nilai 1,2,3 dengan delay 3 detik. Kode langkah 2 adalah kode yang akan menjalankan kode langkah 1 dan menampilkan hasilnya.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif2.gif)

## Praktikum 3

### Langkah 1: Buka main.dart
Pastikan telah impor package async berikut.
```dart
import 'package:async/async.dart
```

### Langkah 2: Tambahkan variabel dan method
Tambahkan variabel late dan method di class _FuturePageState seperti ini.
```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

### Langkah 3: Ganti isi kode onPressed()
Tambahkan kode berikut pada fungsi onPressed(). Kode sebelumnya bisa Anda comment.
```dart
 getNumber().then((value) {
      setState(() {
        result = value.toString();
      });
    });
``` 

### Langkah 4:
Terakhir, run atau tekan F5 untuk melihat hasilnya jika memang belum running. Bisa juga lakukan hot restart jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.
![alt text](img/3.png)

#### Soal 5
- Jelaskan maksud kode langkah 2 tersebut!<br>
Jawab :<br>
Kode tersebut menggunakan Completer untuk mengelola penyelesaian (completion) dari sebuah Future secara manual.

Mendeklarasikan variabel completer dengan keyword late, yang berarti variabel akan diinisialisasi nanti sebelum digunakan.

Fungsi getNumber() membuat instance baru dari Completer<int>(). Memanggil fungsi calculate() yang akan menyelesaikan Completer tersebut. Mengembalikan completer.future, yaitu sebuah Future yang akan berisi nilai ketika completer selesai (complete).

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif3.gif)

## Praktikum 4
### Langkah 1: Buka file main.dart
Tambahkan method ini ke dalam class _FuturePageState
```dart
void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());

    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (int i = 0; i < value.length; i++) {
        total += value[i];
      }
      setState(() {
        result = total.toString();
      });
    });
  }
```
### Langkah 2: Edit onPressed()
Anda bisa hapus atau comment kode sebelumnya, kemudian panggil method dari langkah 1 tersebut.
```dart
 ElevatedButton(
              child: const Text('GO!'),
              onPressed: () async {
                returnFG();
              },
            ),
```

### Langkah 3: Run
Anda akan melihat hasilnya dalam 3 detik berupa angka 6 lebih cepat dibandingkan praktikum sebelumnya menunggu sampai 9 detik.
#### Soal 7
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif4.gif)

### Langkah 4: Ganti variabel futureGroup
Anda dapat menggunakan FutureGroup dengan Future.wait seperti kode berikut.
```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);
```
#### Soal 8
Jelaskan maksud perbedaan kode langkah 1 dan 4!<br>
Jawab :<br>
Kode langkah 1 menggunakan FutureGroup untuk mengelola beberapa Future secara paralel. Sedangkan kode langkah 4 menggunakan Future.wait untuk menjalankan beberapa Future secara paralel dan mengembalikan Future yang akan menyelesaikan ketika semua Future selesai.

Keduanya digunakan untuk menunggu beberapa Future selesai, tetapi FutureGroup memberikan fleksibilitas lebih dalam menambahkan Future secara dinamis

## Praktikum 5
### Langkah 1: Buka file main.dart
Tambahkan method ini ke dalam class _FuturePageState
```dart
Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }
```
### Langkah 2: ElevatedButton
Ganti dengan kode berikut
```dart
onPressed: () async {
    returnError().then((value) {
      setState(() {
        result = 'Success'; 
      });
    }).catchError((onError) {
      setState(() {
        result = onError.toString();
      });
    }).whenComplete(() => print('Complete'));   

  },
  child: const Text('GO!'),
```
### Langkah 3: Run
Lakukan run dan klik tombol GO! maka akan menghasilkan seperti gambar berikut.
#### Soal 9
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif5.gif)

### Langkah 4: Tambah method handleError()
Tambahkan kode ini di dalam class _FutureStatePage
```dart
Future handleError() async {
    try {
      await returnError();
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    } finally {
      print('Complete');
    }
  }
```
#### Soal 10
Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!<br>
Jawab :<br>
Hasilnya akan menampilkan complete pada console. Perbedaan kode langkah 1 dan 4 adalah kode langkah 1 menggunakan catchError untuk menangkap error yang terjadi pada kode dan onComplete untuk menampilkan hasilnya di console. Sedangkan kode langkah 4 menggunakan try-catch pada method returnError untuk menangkap error yang terjadi dan menggunakan finally untuk menampilkan hasilnya di console.

## Praktikum 6
### Langkah 1: install plugin geolocator
Tambahkan plugin geolocator dengan mengetik perintah berikut di terminal.
```java
flutter pub add geolocator
```
### Langkah 2: Tambah permission GPS
Jika Anda menargetkan untuk platform Android, maka tambahkan baris kode berikut di file android/app/src/main/androidmanifest.xml
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
### Langkah 3: Buat file geolocation.dart
Tambahkan file baru ini di folder lib project Anda.
### Langkah 4: Buat StatefulWidget
Buat class LocationScreen di dalam file geolocation.dart
### Langkah 5: Isi kode geolocation.dart
```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2241720159 - Achmad Mufid"),
      ),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext contex, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
```

#### Soal 11
Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.
```dart
 appBar: AppBar(
        title: const Text("2241720159 - Achmad Mufid"),
      ),
```

### Langkah 6: Edit main.dart
Panggil screen baru tersebut di file main Anda seperti berikut.
```dart
home: LocationScreen(),
```
### Langkah 7: Run
Run project Anda di device atau emulator (bukan browser), maka akan tampil seperti berikut ini.
![alt text](img/4.png)

#### Soal 12
- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));<br>
Jawab :<br>
Menambahkan delay pada method getPosition() dengan kode
```dart
await Future.delayed(const Duration(seconds: 3));
```
- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?<br>
Jawab :<br>
Saya mendapatkan koordinat GPS ketika run di browser. Hal ini dikarenakan browser memiliki akses ke GPS sehingga dapat menampilkan koordinat GPS.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif6.gif)

## Praktikum 7
### Langkah 1: Modifikasi method getPosition()
Buka file geolocation.dart kemudian ganti isi method dengan kode ini.
```dart
Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
```
### Langkah 2: Tambah variabel
Tambah variabel ini di class _LocationScreenState
```dart
Future<Position>? position;
```
### Langkah 3: Tambah initState()
Tambah method ini dan set variabel position
```dart
void initState() {
    super.initState();
    position = getPosition();
}
```
### Langkah 4: Edit method build()
Ketik kode berikut dan sesuaikan. Kode lama bisa Anda comment atau hapus.
```dart
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2241720159 - Achmad Mufid"),
      ),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext contex, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
```
#### Soal 13
- Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?<br>
Jawab :<br>
Tidak, tidak ada perbedaan UI dengan praktikum sebelumnya. Hal ini dikarenakan menggunakan FutureBuilder yang akan menampilkan widget sesuai dengan status Future.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 13".<br>
Jawab :<br>
![alt text](img/4.png)


### Langkah 5: Tambah handling error
Tambahkan kode berikut untuk menangani ketika terjadi error. Kemudian hot restart.
```dart
else if (snapshot.connectionState == ConnectionState.done) {
  if (snapshot.hasError) {
     return Text('Something terrible happened!');
  }
  return Text(snapshot.data.toString());
}
```
#### Soal 14
- Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?<br>
Jawab :<br>
Tidak, tidak ada perbedaan UI dengan langkah sebelumnya. Hal ini dikarenakan menggunakan FutureBuilder yang akan menampilkan widget sesuai dengan status Future dan menambahkan handle error jika terjadi error.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif6.gif)

## Praktikum 8
### Langkah 1: Buat file baru navigation_first.dart
Buatlah file baru ini di project lib Anda.
### Langkah 2: Isi kode navigation_first.dart
```dart
import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.deepOrange.shade400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("2241720159 - Achmad Mufid"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Change Color'),
        ),
      ),
    );
  }
}
```
#### Soal 15
- Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.
```dart
title: const Text("2241720159 - Achmad Mufid"),
```
- Silakan ganti dengan warna tema favorit Anda.
```dart
Color color = Colors.deepOrange.shade400;
```
### Langkah 4: Buat file baru navigation_second.dart
Buat file baru ini di project lib Anda. Silakan jika ingin mengelompokkan view menjadi satu folder dan sesuaikan impor yang dibutuhkan.
### Langkah 5: Buat class NavigationSecond dengan StatefulWidget
```dart
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                color = Colors.red.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```
### Langkah 6: Edit main.dart
Lakukan edit properti home.
```dart
home: const NavigationFirst(),
```
### Langkah 8: Run
Lakukan run, jika terjadi error silakan diperbaiki.
![alt text](img/5.png)

#### Soal 16
- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?<br>
Jawab : <br>
Ketika button change color diklik, maka akan menampilkan halaman kedua, di halaman kedua terdapat 3 button yang masing-masing akan mengubah warna background pada halaman pertama.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. 
![alt text](img/gif7.gif)

## Praktikum 9
### Langkah 1: Buat file baru navigation_dialog.dart
Buat file dart baru di folder lib project Anda.
### Langkah 2: Isi kode navigation_dialog.dart
```dart
import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("2241720159 - Achmad Mufid"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Change Color'),
        ),
      ),
    );
  }
}
```
### Langkah 3: Tambah method async
```dart
_showColorDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Very important question'),
        content: const Text('Please choose a color'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              color = Colors.red.shade700;
              Navigator.pop(context, color);
            },
            child: const Text('Red'),
          ),
          TextButton(
            onPressed: () {
              color = Colors.green.shade700;
              Navigator.pop(context, color);
            },
            child: const Text('Green'),
          ),
          TextButton(
            onPressed: () {
              color = Colors.blue.shade700;
              Navigator.pop(context, color);
            },
            child: const Text('Blue'),
          ),
        ],
      );
    },
  );
  setState(() {});
}
```
### Langkah 4: Panggil method di ElevatedButton
```dart
onPressed: () {
    _showColorDialog(context);
},
```
### Langkah 5: Edit main.dart
Ubah properti home
```dart
home: const NavigationDialogScreen(),
```

### Langkah 6: Run
Coba ganti warna background dengan widget dialog tersebut. Jika terjadi error, silakan diperbaiki. Jika berhasil, akan tampil seperti gambar berikut.
![alt text](img/6.png)

#### Soal 17
- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?<br>
Jawab :<br>
Ketika button change color diklik, maka akan menampilkan dialog yang berisi 3 button yang masing-masing akan mengubah warna background pada halaman pertama.
- Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!<br>
Jawab : <br>
```dart
showColorDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                color = Colors.deepPurple.shade700;
                setState(() {});
                Navigator.pop(context, color);
              },
              child: const Text('Purple'),
            ),
            TextButton(
              onPressed: () {
                color = Colors.yellow.shade700;
                setState(() {});
                Navigator.pop(context, color);
              },
              child: const Text('Yellow'),
            ),
            TextButton(
              onPressed: () {
                color = Colors.blue.shade700;
                setState(() {});
                Navigator.pop(context, color);
              },
              child: const Text('Blue'),
            ),
          ],
        );
      },
    );
  }
```
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![alt text](img/gif8.gif)