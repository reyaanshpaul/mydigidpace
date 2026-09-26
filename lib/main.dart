import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainVault(),
    );
  }
}

class MainVault extends StatefulWidget {
  @override
  _MainVaultState createState() => _MainVaultState();
}

class _MainVaultState extends State<MainVault> {
  int index = 0;
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    // Auto scan start
    Future.delayed(Duration(seconds: 2), () {
      setState(() => isScanning = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(index == 0 ? "2PB Main Vault" : "1PB Download Vault"),
        actions: [
          IconButton(icon: Icon(Icons.security), onPressed: () {}),
        ],
      ),
      body: isScanning ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 15),
            Text("Scanning All Files...", style: TextStyle(color: Colors.white)),
            Text("Photos, Videos, Folders Collecting...", style: TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ) : index == 0 ? AllFilesTool() : DownloadVault(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0A0E21),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white54,
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder_copy), label: "All Files Tool (2PB)"),
          BottomNavigationBarItem(icon: Icon(Icons.download_for_offline), label: "Downloads (1PB)"),
        ],
      ),
    );
  }
}

class AllFilesTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Color(0xFF1A1E3A), borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("All Data Collected Successfully!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("12,543 Photos | 1,204 Videos | 8,920 Files", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ])
            ],
          ),
        ),
        SizedBox(height: 15),
        gridItem(Icons.photo_library, "All Photos", "8,240 items", Colors.orange),
        gridItem(Icons.video_collection, "All Videos", "1,204 items", Colors.red),
        gridItem(Icons.folder, "All Folders", "342 folders", Colors.blue),
        gridItem(Icons.audiotrack, "Music & Audio", "2,100 files", Colors.green),
        gridItem(Icons.description, "Documents", "1,450 files", Colors.purple),
        gridItem(Icons.apps, "Apps & APKs", "86 apps", Colors.teal),
      ],
    );
  }

  Widget gridItem(IconData icon, String title, String count, Color color) {
    return Card(
      color: Color(0xFF1A1E3A),
      child: ListTile(
        leading: Icon(icon, color: color, size: 35),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(count, style: TextStyle(color: Colors.white54)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
        onTap: () {},
      ),
    );
  }
}

class DownloadVault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.cyan]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1 PETABYTE DOWNLOAD SPACE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 5),
                Text("Separate & Secure - Only for Downloads", style: TextStyle(color: Colors.white70, fontSize: 12)),
                SizedBox(height: 15),
                LinearProgressIndicator(value: 0.02, color: Colors.white, backgroundColor: Colors.white24),
                SizedBox(height: 10),
                Text("15.2 GB Used / 1024 TB Free", style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ListTile(leading: Icon(Icons.download, color: Colors.white), title: Text("Instagram Videos", style: TextStyle(color: Colors.white)), subtitle: Text("12.5 GB - Auto Saved"), trailing: Icon(Icons.check, color: Colors.green)),
                ListTile(leading: Icon(Icons.download, color: Colors.white), title: Text("WhatsApp Media", style: TextStyle(color: Colors.white)), subtitle: Text("2.1 GB - Auto Saved"), trailing: Icon(Icons.check, color: Colors.green)),
                ListTile(leading: Icon(Icons.download, color: Colors.white), title: Text("Chrome Downloads", style: TextStyle(color: Colors.white)), subtitle: Text("0.6 GB"), trailing: Icon(Icons.more_vert, color: Colors.white54)),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blue),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("DOWNLOAD ANYTHING TO 1PB VAULT"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}