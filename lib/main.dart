import 'package:flutter/material.dart';

void main() {
  runApp(VitaleApp());
}

class VitaleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitale Controle Orçamentário',
      theme: ThemeData(
        primaryColor: Color(0xFFD33074), // Tom de roxo
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFAA2E6C)), // Tom de roxo mais claro
      ),
      home: VitaleLoginPage(),
    );
  }
}

class VitaleLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitale', style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Roboto')),
        backgroundColor: Color(0xFFD33074),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD33074), Color(0xFFAA2E6C)], // Gradiente de roxo
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_balance,
                    size: 50,
                    color: Color(0xFFD33074), // Tom de roxo
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Vitale',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Controle Orçamentário',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VitaleHomePage(username: 'Comercial Interno'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD33074)), // Tom de roxo
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VitaleHomePage extends StatefulWidget {
  final String username;

  VitaleHomePage({required this.username});

  @override
  _VitaleHomePageState createState() => _VitaleHomePageState();
}

class _VitaleHomePageState extends State<VitaleHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitale', style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Roboto')),
        backgroundColor: Color(0xFFD33074),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle,
                color: Color(0xFFD33074), // Tom de roxo
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFAA2E6C), Color(0xFFD33074)], // Gradiente de roxo mais claro
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Início',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Orçamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Transações',
          ),
        ],
        selectedItemColor: Color(0xFFD33074), // Tom de roxo
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFFAA2E6C), // Tom de roxo mais claro
      ),
    );
  }
}
