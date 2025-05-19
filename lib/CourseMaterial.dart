import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizMaterial(),
  ));
}

class QuizMaterial extends StatelessWidget {
  const QuizMaterial({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> materials = const [
  {
    'title': 'Matematika',
    'subtitle': 'Belajar Pecahan',
    'content': 'Pecahan adalah bagian dari keseluruhan. Misalnya, jika sebuah kue dibagi menjadi 4 bagian sama besar, maka setiap bagian adalah 1/4 dari kue tersebut! 🍰',
    'color': Colors.orange,
    'textColor': Colors.black,
    'icon': Icons.calculate,
  },
  {
    'title': 'IPA',
    'subtitle': 'Daur Air',
    'content': 'Daur air adalah perjalanan air di bumi melalui proses penguapan (air menjadi uap), kondensasi (uap menjadi awan), dan presipitasi (hujan/salju). 🌧️💧',
    'color': Color.fromARGB(255, 34, 63, 35),
    'textColor': Colors.white,
    'icon': Icons.science,
  },
  {
    'title': 'Bahasa Indonesia',
    'subtitle': 'Teks Cerita',
    'content': 'Teks cerita berisi kisah yang memiliki alur (jalan cerita), tokoh (pemeran), dan latar (tempat/waktu). Contohnya dongeng, cerpen, atau fabel. 📖✨',
    'color': Colors.purple,
    'textColor': Colors.white,
    'icon': Icons.menu_book,
  },
  {
    'title': 'IPS',
    'subtitle': 'Geografi',
    'content': 'Geografi mempelajari tentang bumi dan fenomena yang terjadi di dalamnya, seperti gunung, sungai, danau, serta kehidupan manusia di berbagai tempat. 🌍🗺️',
    'color': Colors.blue,
    'textColor': Colors.white,
    'icon': Icons.public,
  },
  {
    'title': 'Bahasa Inggris',
    'subtitle': 'Vocabulary',
    'content': 'Vocabulary adalah kumpulan kata dalam bahasa. Mari belajar kosakata dasar seperti warna (red, blue), hewan (cat, dog), dan angka (one, two)! 🐶🌈',
    'color': Colors.red,
    'textColor': Colors.white,
    'icon': Icons.language,
  },
  {
    'title': 'Pendidikan Pancasila',
    'subtitle': 'Nilai-nilai Pancasila',
    'content': 'Pancasila adalah dasar negara Indonesia yang terdiri dari lima sila: Ketuhanan, Kemanusiaan, Persatuan, Kerakyatan, dan Keadilan. 🇮🇩✨',
    'color': Colors.teal,
    'textColor': Colors.white,
    'icon': Icons.flag,
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pelajaran Kelas 4 SD',
            style: TextStyle(fontFamily: 'Baloo2', fontSize: 22, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.lightBlue.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            final material = materials[index];
            return Card(
              color: material['color'].withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseDetailPage(
                        title: material['title'],
                        subtitle: material['subtitle'],
                        content: material['content'],
                        color: material['color'],
                        icon: material['icon'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: material['color'].withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(material['icon'],
                            size: 36, color: material['color']),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              material['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Baloo2',
                                color: material['color'],
                              ),
                            ),
                            Text(
                              material['subtitle'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Baloo2',
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final Color color;
  final IconData icon;

  const CourseDetailPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color,
        title: Text('$title Kelas 4 SD',
            style: const TextStyle(fontFamily: 'Baloo2', fontSize: 22, color: Colors.white)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withOpacity(0.3), width: 2),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 48, color: color),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontFamily: 'Baloo2',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  fontFamily: 'Baloo2',
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizPage(subject: title, color: color),
                  ),
                );
              },
              icon: const Icon(Icons.quiz, size: 28),
              label: const Text('Mulai Quiz Seru!',
                  style: TextStyle(fontSize: 18, fontFamily: 'Baloo2')),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: color.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String subject;
  final Color color;

  const QuizPage({Key? key, required this.subject, required this.color})
      : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showCorrectAnswer = false;
  String? selectedOption;

  late final List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();
    questions = _getQuestionsForSubject(widget.subject);
  }

  List<Map<String, dynamic>> _getQuestionsForSubject(String subject) {
    switch (subject) {
      case 'Matematika':
        return [
          {
            'question': '📘 Berapa angka penyebut pada pecahan 3/4?',
            'options': ['a. 3', 'b. 4', 'c. 7'],
            'answer': 'b. 4',
            'explanation': 'Penyebut adalah angka di bagian bawah pecahan yang menunjukkan jumlah bagian keseluruhan.',
          },
          {
            'question': '📗 Berapakah hasil dari 5 × 4?',
            'options': ['a. 20', 'b. 9', 'c. 10'],
            'answer': 'a. 20',
            'explanation': 'Perkalian adalah penjumlahan berulang. 5 × 4 = 5 + 5 + 5 + 5 = 20.',
          },
          {
            'question': '🧮 Apa itu bilangan prima?',
            'options': [
              'a. Bilangan yang hanya punya dua faktor',
              'b. Bilangan genap',
              'c. Bilangan negatif'
            ],
            'answer': 'a. Bilangan yang hanya punya dua faktor',
            'explanation': 'Bilangan prima hanya bisa dibagi oleh 1 dan bilangan itu sendiri, contoh: 2, 3, 5, 7.',
          },
          {
            'question': '📏 Berapa jumlah sudut pada segitiga?',
            'options': ['a. 180 derajat', 'b. 90 derajat', 'c. 360 derajat'],
            'answer': 'a. 180 derajat',
            'explanation': 'Jumlah ketiga sudut dalam segitiga selalu 180 derajat.',
          },
          {
            'question': '➗ 10 dibagi 2 hasilnya?',
            'options': ['a. 5', 'b. 8', 'c. 7'],
            'answer': 'a. 5',
            'explanation': 'Pembagian adalah pengurangan berulang. 10 ÷ 2 = 5 karena 10 - 2 - 2 - 2 - 2 - 2 = 0 (5 kali).',
          },
        ];
      case 'IPA':
        return [
          {
            'question': '🌧️ Proses pertama dalam daur air adalah?',
            'options': ['a. Kondensasi', 'b. Presipitasi', 'c. Penguapan'],
            'answer': 'c. Penguapan',
            'explanation': 'Air menguap karena panas matahari menjadi uap air yang naik ke atmosfer.',
          },
          {
            'question': '⚡ Apa sumber energi utama tumbuhan?',
            'options': ['a. Air', 'b. Cahaya Matahari', 'c. Tanah'],
            'answer': 'b. Cahaya Matahari',
            'explanation': 'Tumbuhan menggunakan cahaya matahari untuk fotosintesis membuat makanan.',
          },
          {
            'question': '🦠 Organisme terkecil disebut?',
            'options': ['a. Virus', 'b. Mikrob', 'c. Bakteri'],
            'answer': 'a. Virus',
            'explanation': 'Virus adalah organisme terkecil yang hanya bisa dilihat dengan mikroskop elektron.',
          },
          {
            'question': '🔄 Fotosintesis terjadi di organ bagian?',
            'options': ['a. Akar', 'b. Daun', 'c. Batang'],
            'answer': 'b. Daun',
            'explanation': 'Daun mengandung klorofil yang menangkap energi matahari untuk fotosintesis.',
          },
          {
            'question': '🌡️ Satuan suhu adalah?',
            'options': ['a. Liter', 'b. Meter', 'c. Celcius'],
            'answer': 'c. Celcius',
            'explanation': 'Celcius adalah satuan untuk mengukur suhu, seperti suhu tubuh atau udara.',
          },
        ];
      case 'Bahasa Indonesia':
        return [
          {
            'question': '📖 Apa itu tokoh dalam cerita?',
            'options': [
              'a. Tempat terjadinya cerita',
              'b. Pemeran dalam cerita',
              'c. Masalah utama dalam cerita'
            ],
            'answer': 'b. Pemeran dalam cerita',
            'explanation': 'Tokoh adalah pelaku dalam cerita, bisa manusia, hewan, atau benda yang dihidupkan.',
          },
          {
            'question': '✍️ Apa tujuan teks cerita?',
            'options': ['a. Menghibur', 'b. Memberi tahu', 'c. Meminta'],
            'answer': 'a. Menghibur',
            'explanation': 'Cerita fiksi seperti dongeng dan fabel bertujuan menghibur pembaca.',
          },
          {
            'question': '🗺️ Apa itu latar dalam cerita?',
            'options': [
              'a. Waktu dan tempat kejadian',
              'b. Tokoh utama',
              'c. Alur cerita'
            ],
            'answer': 'a. Waktu dan tempat kejadian',
            'explanation': 'Latar menggambarkan di mana dan kapan cerita terjadi, seperti "di hutan pada malam hari".',
          },
          {
            'question': '📜 Apa yang dimaksud alur?',
            'options': [
              'a. Urutan kejadian',
              'b. Tokoh buruk',
              'c. Penulis'
            ],
            'answer': 'a. Urutan kejadian',
            'explanation': 'Alur adalah rangkaian peristiwa dalam cerita dari awal, tengah, sampai akhir.',
          },
          {
            'question': '📝 Kalimat yang berisi pertanyaan disebut?',
            'options': ['a. Kalimat berita', 'b. Kalimat tanya', 'c. Kalimat perintah'],
            'answer': 'b. Kalimat tanya',
            'explanation': 'Kalimat tanya diakhiri tanda tanya (?) dan bertujuan meminta informasi.',
          },
        ];
      case 'IPS':
        return [
          {
            'question': '🌍 Apa yang dipelajari dalam geografi?',
            'options': [
              'a. Manusia dan perilakunya',
              'b. Bumi dan fenomena di dalamnya',
              'c. Hewan dan tumbuhan'
            ],
            'answer': 'b. Bumi dan fenomena di dalamnya',
            'explanation': 'Geografi mempelajari bumi, termasuk gunung, sungai, iklim, dan persebaran penduduk.',
          },
          {
            'question': '🏙️ Kota adalah?',
            'options': ['a. Tempat tinggal satwa', 'b. Pemukiman penduduk', 'c. Sungai'],
            'answer': 'b. Pemukiman penduduk',
            'explanation': 'Kota adalah wilayah dengan penduduk padat dan berbagai fasilitas seperti sekolah dan pasar.',
          },
          {
            'question': '📅 Kalender digunakan untuk?',
            'options': [
              'a. Mengukur waktu',
              'b. Menentukan tanggal',
              'c. Menulis surat'
            ],
            'answer': 'b. Menentukan tanggal',
            'explanation': 'Kalender membantu kita mengetahui hari, tanggal, bulan, dan tahun.',
          },
          {
            'question': '💰 Uang digunakan untuk?',
            'options': ['a. Membeli barang', 'b. Menyimpan makanan', 'c. Menghitung'],
            'answer': 'a. Membeli barang',
            'explanation': 'Uang adalah alat tukar untuk mendapatkan barang atau jasa yang kita butuhkan.',
          },
          {
            'question': '📌 Apa itu peta?',
            'options': ['a. Gambaran wilayah', 'b. Jadwal', 'c. Buku'],
            'answer': 'a. Gambaran wilayah',
            'explanation': 'Peta adalah gambar permukaan bumi yang diperkecil dengan skala tertentu.',
          },
        ];
      case 'Bahasa Inggris':
        return [
          {
            'question': '🗣️ How do you say "selamat pagi" in English?',
            'options': ['a. Good night', 'b. Good morning', 'c. Good afternoon'],
            'answer': 'b. Good morning',
            'explanation': '"Good morning" digunakan untuk menyapa di pagi hari sampai siang.',
          },
          {
            'question': '📚 Choose the correct article for "___ apple".',
            'options': ['a. An', 'b. A', 'c. The'],
            'answer': 'a. An',
            'explanation': 'Kita menggunakan "an" sebelum kata yang dimulai dengan bunyi vokal (a, e, i, o, u).',
          },
          {
            'question': '✈️ What is the past tense of "go"?',
            'options': ['a. Went', 'b. Goed', 'c. Gone'],
            'answer': 'a. Went',
            'explanation': '"Go" adalah kata kerja tidak beraturan. Bentuk past tense-nya adalah "went".',
          },
          {
            'question': '🐶 What is the plural of "dog"?',
            'options': ['a. Dogs', 'b. Doges', 'c. Dog'],
            'answer': 'a. Dogs',
            'explanation': 'Untuk membuat kata benda jamak dalam bahasa Inggris, biasanya ditambahkan "s".',
          },
          {
            'question': '🔤 How do you spell the word "cat"?',
            'options': ['a. C A T', 'b. K A T', 'c. C O T'],
            'answer': 'a. C A T',
            'explanation': 'C-A-T adalah ejaan yang benar untuk kata "cat" yang berarti kucing.',
          },
        ];
      case 'Pendidikan Pancasila':
        return [
          {
            'question': '🛡️ Berapa sila dalam Pancasila?',
            'options': ['a. 3', 'b. 5', 'c. 7'],
            'answer': 'b. 5',
            'explanation': 'Pancasila terdiri dari lima sila yang menjadi dasar negara Indonesia.',
          },
          {
            'question': '⚖️ Apa arti sila pertama Pancasila?',
            'options': [
              'a. Keadilan sosial',
              'b. Ketuhanan Yang Maha Esa',
              'c. Persatuan Indonesia'
            ],
            'answer': 'b. Ketuhanan Yang Maha Esa',
            'explanation': 'Sila pertama berarti Indonesia mengakui adanya Tuhan dan setiap warga bebas beribadah.',
          },
          {
            'question': '🤝 Sila kedua Pancasila?',
            'options': [
              'a. Kemanusiaan yang adil dan beradab',
              'b. Persatuan Indonesia',
              'c. Kerakyatan yang dipimpin oleh hikmat kebijaksanaan'
            ],
            'answer': 'a. Kemanusiaan yang adil dan beradab',
            'explanation': 'Sila kedua mengajarkan kita untuk saling menghormati dan bersikap adil kepada sesama.',
          },
          {
            'question': '🇮🇩 Sila ketiga Pancasila?',
            'options': [
              'a. Ketuhanan Yang Maha Esa',
              'b. Persatuan Indonesia',
              'c. Keadilan sosial bagi seluruh rakyat Indonesia'
            ],
            'answer': 'b. Persatuan Indonesia',
            'explanation': 'Sila ketiga mengajak kita untuk bersatu sebagai bangsa Indonesia meski berbeda suku dan agama.',
          },
          {
            'question': '⚖️ Sila keempat Pancasila?',
            'options': [
              'a. Kerakyatan yang dipimpin oleh hikmat kebijaksanaan',
              'b. Persatuan Indonesia',
              'c. Kemanusiaan yang adil dan beradab'
            ],
            'answer': 'a. Kerakyatan yang dipimpin oleh hikmat kebijaksanaan',
            'explanation': 'Sila keempat berarti keputusan diambil melalui musyawarah untuk mencapai mufakat.',
          },
        ];
      default:
        return [];
    }
  }

  void _checkAnswer(String option) {
    setState(() {
      selectedOption = option;
      showCorrectAnswer = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        final isCorrect = selectedOption == questions[currentQuestionIndex]['answer'];
        if (isCorrect) {
          score++;
        }

        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          showCorrectAnswer = false;
          selectedOption = null;
        } else {
          _showFinishDialog();
        }
      });
    });
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.color.withOpacity(0.3), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.emoji_events,
                size: 80,
                color: widget.color,
              ),
              const SizedBox(height: 20),
              Text(
                'Quiz Selesai! 🎉',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                  fontFamily: 'Baloo2',
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: 'Baloo2',
                  ),
                  children: [
                    const TextSpan(text: 'Skor Kamu: '),
                    TextSpan(
                      text: '$score dari ${questions.length}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _getResultMessage(score, questions.length),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Baloo2',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Go back to course detail
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Kembali ke Materi',
                    style: TextStyle(fontFamily: 'Baloo2')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getResultMessage(int score, int totalQuestions) {
    final percentage = score / totalQuestions;
    if (percentage >= 0.8) {
      return 'Kamu hebat! Nilai kamu sempurna! 🏆';
    } else if (percentage >= 0.6) {
      return 'Bagus sekali! Hanya sedikit lagi untuk sempurna! 👍';
    } else if (percentage >= 0.4) {
      return 'Lumayan! Terus belajar ya! 💪';
    } else {
      return 'Jangan menyerah! Coba lagi dan pelajari materinya! 📚';
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: const Text('Quiz Seru!', style: TextStyle(fontFamily: 'Baloo2', color: Colors.white)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.color, widget.color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Soal ${currentQuestionIndex + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.color,
                        fontFamily: 'Baloo2',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Skor: $score',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.color,
                        fontFamily: 'Baloo2',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Baloo2',
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...question['options'].map<Widget>((option) {
                final isSelected = selectedOption == option;
                final isCorrect = option == question['answer'];
                
                Color buttonColor = Colors.white;
                if (showCorrectAnswer) {
                  if (isSelected && isCorrect) {
                    buttonColor = Colors.green.shade100;
                  } else if (isSelected && !isCorrect) {
                    buttonColor = Colors.red.shade100;
                  } else if (!isSelected && isCorrect) {
                    buttonColor = Colors.green.shade100;
                  }
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!showCorrectAnswer) {
                        _checkAnswer(option);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: showCorrectAnswer && isCorrect 
                              ? Colors.green 
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        if (showCorrectAnswer)
                          Icon(
                            isSelected && isCorrect
                                ? Icons.check_circle
                                : isSelected && !isCorrect
                                    ? Icons.cancel
                                    : !isSelected && isCorrect
                                        ? Icons.check_circle
                                        : null,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                        if (showCorrectAnswer) const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Baloo2',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              if (showCorrectAnswer) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Penjelasan:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Baloo2',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question['explanation'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Baloo2',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}