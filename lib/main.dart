import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
    '/profile': (context) => const ProfilPage(),
    '/jadwal': (context) => JadwalPage(),
    '/quotes': (context) => QuotesPage(),
    },
    );
    }
    }

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

@override
Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ProfilPage();
            }));
          },
        ),
      ),
    );
  }
    }



class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/PDH.png"),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              ),
                              color: Colors.blue),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Vicalis Armonanda",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "2009116009",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Sistem Informasi",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return JadwalPage();
              },
            ),
          );
        },
        child: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}



class JadwalPage extends StatelessWidget {
  final List<String> _jadwalpage = [
    'Pemrograman Perangkat Bergerak',
    'Manajemen Pengadaan & Investasi TI',
    'Pengukuran Kinerja & Evaluasi SI',
    'Perencanaan Strategis SI/TI',
    'Kuliah Kerja Nyata',
    'Pengolahan Citra Digital',
    'Konstruksi & Pengujian Perangkat Lunak',
    'Perencanaan Sumber Daya Perusahaan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah'),
        leading: Container(),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _jadwalpage.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromARGB(255, 255, 195, 64), // warna background card
              child: ListTile(
                title: Text(_jadwalpage[index]),
                onTap: () {
                  Navigator.pushNamed(context, '/quotes');
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return QuotesPage();
              },
            ),
          );
        },
        child: const Text("Quotes"),
      ),
    );
  }
}


class QuotesPage extends StatelessWidget {
  final List<Map<String, dynamic>> _quotes = [
    {
      'quote': 'Life is a journey, not a destination.',
      'icon': Icons.directions_walk,
    },
    {
      'quote': 'Believe you can and you\'re halfway there.',
      'icon': Icons.thumb_up,
    },
    {
      'quote': 'The only way to do great work is to love what you do.',
      'icon': Icons.work,
    },
    {
      'quote':
          'In the end, we only regret the chances we didn\'t take.',
      'icon': Icons.sentiment_very_satisfied,
    },
    {
      'quote':
          'I have not failed. I\'ve just found 10,000 ways that won\'t work.',
      'icon': Icons.error,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Quotes Of The Day'),
        leading: Container(),
      ),
      body: ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(_quotes[index]['icon']),
              title: Text(_quotes[index]['quote']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Back"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

