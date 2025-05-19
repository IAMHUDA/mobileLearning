import 'package:flutter/material.dart';
import 'CoursePlaylist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Bisa tambahkan logika halaman lain jika ada bottom nav
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo, Adek!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent,
                    fontFamily: 'ComicSansMS',
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Yuk Belajar!',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple,
                    fontFamily: 'ComicSansMS',
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Pelajaran Populer',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontFamily: 'ComicSansMS',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 660,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                    children: [
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/coding.png',
                        title: 'Matematika',
                        width: double.infinity,
                      ),
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/development.png',
                        title: 'IPA',
                        width: double.infinity,
                      ),
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/python.png',
                        title: 'Bahasa Indonesia',
                        width: double.infinity,
                      ),
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/web.png',
                        title: 'Bahasa Inggris',
                        width: double.infinity,
                      ),
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/web.png',
                        title: 'IPS',
                        width: double.infinity,
                      ),
                      _courseCard(
                        context: context,
                        imagePath: 'assets/images/python.png',
                        title: 'Pendidikan Pancasila',
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _courseCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required double width,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman materi sesuai title
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseMaterial(title: title)),
        );
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade100.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(3, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(imagePath, width: 90, height: 90, fit: BoxFit.contain),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'ComicSansMS',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseMaterial extends StatelessWidget {
  final String title;

  const CourseMaterial({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> materiMap = {
      'Matematika': _buildMathMaterial(),
      'IPA': _buildScienceMaterial(),
      'Bahasa Indonesia': _buildIndonesianMaterial(),
      'Bahasa Inggris': _buildEnglishMaterial(),
      'IPS': _buildHistoryMaterial(),
      'Pendidikan Pancasila': _buildPancasilaMaterial(),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Materi $title'),
        backgroundColor: const Color.fromARGB(255, 93, 44, 179),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: materiMap[title] ?? _buildSimpleText('Materi belum tersedia'),
        ),
      ),
    );
  }

  static Widget _buildSimpleText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
          fontFamily: 'ComicSansMS',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Matematika
  static Widget _buildMathMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pengantar Pecahan',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Apa itu Pecahan?',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pecahan adalah bagian dari keseluruhan. Misalnya, bayangkan kamu punya sebuah kue yang dibagi menjadi 4 bagian sama besar. '
          'Kalau kamu mengambil satu potong, berarti kamu punya 1/4 bagian dari kue itu.\n\n'
          'Dalam pecahan, bagian atas disebut pembilang (berapa bagian yang kita punya), dan bagian bawah disebut penyebut (total bagian keseluruhan).\n\n'
          'Contoh pecahan: 3/4 artinya kamu punya 3 bagian dari 4 bagian total.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Yuk, coba pikirkan!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Kalau kamu punya sebuah cokelat dan membaginya menjadi 8 bagian sama besar, dan kamu makan 3 potong, berapa pecahan cokelat yang sudah kamu makan?',
          style: TextStyle(fontSize: 18, fontFamily: 'ComicSansMS'),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/fractions_kids.png',
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Belajar Pecahan:\n\n'
            '- Gunakan benda nyata seperti kue, cokelat, atau kertas warna untuk membagi dan memahami pecahan.\n'
            '- Berlatih dengan menggambar lingkaran dan membaginya menjadi bagian-bagian.\n'
            '- Ingat, pembilang adalah bagian yang kamu punya, penyebut adalah total bagian.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade100.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Ayo, praktikkan sekarang! Ambil selembar kertas warna dan potong menjadi beberapa bagian. '
            'Tandai pecahan yang kamu miliki dan coba jelaskan dengan kata-katamu sendiri.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // IPA
  static Widget _buildScienceMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sistem Pencernaan pada Manusia',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Apa itu Sistem Pencernaan?',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Sistem pencernaan adalah proses tubuh untuk mengubah makanan menjadi energi dan zat-zat yang dibutuhkan tubuh. '
          'Makanan masuk ke mulut, kemudian melewati beberapa organ seperti kerongkongan, lambung, usus, hingga akhirnya zat gizi diserap tubuh.\n\n'
          'Organ utama sistem pencernaan meliputi mulut, kerongkongan, lambung, usus halus, dan usus besar.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/digestive_system.png',
            width: 280,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Bagian-Bagian Sistem Pencernaan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '1. Mulut: Tempat awal makanan masuk dan dihancurkan.\n'
          '2. Kerongkongan: Saluran yang menghubungkan mulut ke lambung.\n'
          '3. Lambung: Mengolah makanan menjadi cairan yang mudah diserap.\n'
          '4. Usus Halus: Tempat penyerapan nutrisi ke dalam darah.\n'
          '5. Usus Besar: Menyerap air dan membentuk sisa makanan menjadi tinja.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Menjaga Sistem Pencernaan Sehat:\n\n'
            '- Makan makanan bergizi dan berserat tinggi.\n'
            '- Minum cukup air putih.\n'
            '- Olahraga teratur untuk membantu pencernaan.\n'
            '- Hindari makan berlebihan dan makanan cepat saji.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  // Bahasa Indonesia
  static Widget _buildIndonesianMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kata Baku dan Tidak Baku',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Apa itu Kata Baku?',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Kata baku adalah kata yang sesuai dengan kaidah bahasa Indonesia yang benar, biasanya digunakan dalam penulisan formal. '
          'Contoh kata baku: "tabel", "analisis", "aktif".\n\n'
          'Kata tidak baku adalah kata yang tidak sesuai dengan kaidah bahasa baku, sering dipakai dalam bahasa sehari-hari atau percakapan. '
          'Contoh kata tidak baku: "tabel" yang diucapkan "tabel", "analisa" (seharusnya "analisis"), "aktif" menjadi "aktif".\n\n'
          'Mengenal kata baku membantu kita berkomunikasi dengan baik dan benar, terutama dalam menulis tugas sekolah atau surat resmi.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Contoh Kata Baku dan Tidak Baku',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Kata Baku     | Kata Tidak Baku\n'
          '------------- | ---------------\n'
          'Aktif        | Aktip\n'
          'Analisis     | Analisa\n'
          'Tabel        | Tabel\n'
          'Ilmu         | Ilmu\n'
          'Alamat       | Alamat\n',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ComicSansMS',
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Belajar Kata Baku:\n\n'
            '- Membaca buku dan tulisan resmi.\n'
            '- Memperhatikan kata-kata yang sering digunakan dalam surat atau tugas sekolah.\n'
            '- Latihan menulis dengan menggunakan kata baku.\n'
            '- Bertanya pada guru atau orang dewasa jika ragu.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  // Bahasa Inggris
  static Widget _buildEnglishMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pengenalan Bahasa Inggris',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Salam dan Perkenalan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Berikut beberapa kata dan kalimat dasar dalam bahasa Inggris:\n\n'
          '- Hello = Halo\n'
          '- Goodbye = Selamat tinggal\n'
          '- Thank you = Terima kasih\n'
          '- Please = Tolong\n'
          '- My name is ... = Nama saya ...\n'
          '- How are you? = Apa kabar?\n'
          '- I am fine, thank you = Saya baik-baik saja, terima kasih\n\n'
          'Belajar bahasa Inggris membantu kamu berkomunikasi dengan orang dari berbagai negara dan membuka banyak peluang.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/english_kids.png',
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Belajar Bahasa Inggris:\n\n'
            '- Dengarkan lagu dan tonton film anak-anak berbahasa Inggris.\n'
            '- Berlatih berbicara dengan teman atau guru.\n'
            '- Gunakan aplikasi belajar bahasa Inggris yang menyenangkan.\n'
            '- Jangan takut membuat kesalahan, terus berlatih!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  // Sejarah
  static Widget _buildHistoryMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sejarah Indonesia',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Perjuangan Kemerdekaan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Indonesia meraih kemerdekaan pada tanggal 17 Agustus 1945 setelah berjuang melawan penjajahan selama bertahun-tahun. '
          'Perjuangan ini dipimpin oleh para pahlawan nasional yang berani dan gigih mempertahankan tanah air.\n\n'
          'Beberapa pahlawan yang terkenal antara lain Soekarno, Mohammad Hatta, Cut Nyak Dien, dan lainnya.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/independence_day.png',
            width: 280,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Makna Kemerdekaan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Kemerdekaan berarti bebas mengatur diri sendiri tanpa campur tangan penjajah. '
          'Kita harus menghargai dan menjaga kemerdekaan dengan cara belajar, bekerja keras, dan mencintai tanah air.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Menghargai Kemerdekaan:\n\n'
            '- Mengenang jasa para pahlawan.\n'
            '- Belajar sejarah Indonesia dengan semangat.\n'
            '- Ikut serta dalam upacara atau kegiatan hari kemerdekaan.\n'
            '- Menjaga persatuan dan kesatuan bangsa.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  // Pendidikan Pancasila
  static Widget _buildPancasilaMaterial() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pendidikan Pancasila',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Apa itu Pancasila?',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pancasila adalah dasar negara Indonesia yang terdiri dari lima sila, yaitu:\n'
          '1. Ketuhanan Yang Maha Esa\n'
          '2. Kemanusiaan yang adil dan beradab\n'
          '3. Persatuan Indonesia\n'
          '4. Kerakyatan yang dipimpin oleh hikmat kebijaksanaan\n'
          '5. Keadilan sosial bagi seluruh rakyat Indonesia\n\n'
          'Pancasila mengajarkan kita untuk hidup rukun, adil, dan saling menghormati.',
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontFamily: 'ComicSansMS',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/pancasila.png',
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tips Belajar Pancasila:\n\n'
            '- Pahami setiap sila dan artinya.\n'
            '- Terapkan nilai Pancasila dalam kehidupan sehari-hari.\n'
            '- Diskusikan dengan teman dan keluarga tentang pentingnya persatuan.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
              fontFamily: 'ComicSansMS',
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
