import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// ملاحظة: تأكد من تهيئة Firebase في مشروعك قبل التشغيل
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // قم بإلغاء التعليق بعد ربط المشروع بـ Firebase
  runApp(const MobdaoonApp());
}

class MobdaoonApp extends StatelessWidget {
  const MobdaoonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مبدعون',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // تصميم ليلي مريح للقراءة الأدبية
        primaryColor: const Color(0xFF8E7AB5), // لون حبري هادئ
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Cairo', // يفضل إضافة خط كوفي أو قاهري في الـ assets
      ),
      home: const HomeScreen(),
    );
  }
}

// --- الشاشة الرئيسية: رواق مبدعون ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const RoaqFeed(), // الرواق العام
    const ChallengesScreen(), // تحدي الأسبوع
    const ProfileScreen(), // الملف الشخصي
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مُـبـدِعُـون', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFFB197FC),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'الرواق'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'التحدي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPostScreen()),
                );
              },
              backgroundColor: const Color(0xFF8E7AB5),
              child: const Icon(Icons.create, color: Colors.white),
            )
          : null,
    );
  }
}

// --- شاشة عرض النصوص (Feed) ---
class RoaqFeed extends StatelessWidget {
  const RoaqFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // جلب البيانات من الفايربيس بترتيب زمني تصاعدي للأحدث
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('الرواق خالٍ حالياً.. كن أول من ينشر إبداعه.'));
        }

        final posts = snapshot.data!.docs;

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF8E7AB5),
                          child: Text(post['author'][0].toUpperCase()),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post['author'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text('كاتب مستقِل', style: TextStyle(size: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      post['title'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFB197FC)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post['content'],
                      style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.whiteBF),
                    ),
                    const Divider(height: 24, color: Colors.white24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
                          onPressed: () {
                            // ميزة الإعجاب (يمكن ربطها بالـ Firebase لاحقاً عبر معرف المستخدم)
                          },
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.comment, size: 20, color: Colors.grey),
                          label: const Text('نقد وبناء', style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// --- شاشة إضافة نص أدبي جديد ---
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isLoading = false;

  void _publishPost() async {
    if (_titleController.text.trim().isEmpty || _contentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('الرجاء ملء العنوان والنص')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'title': _titleController.text.trim(),
        'content': _contentController.text.trim(),
        'author': 'يوسف كمال', // اسم الكاتب الافتراضي حالياً قبل تفعيل نظام الحسابات
        'timestamp': FieldValue.serverTimestamp(),
        'likes': 0,
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء النشر: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انشر إبداعك'),
        backgroundColor: const Color(0xFF1E1E1E),
        actions: [
          _isLoading
              ? const Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator())
              : IconButton(onPressed: _publishPost, icon: const Icon(Icons.send, color: Color(0xFFB197FC)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'عنوان النص الأدبي...',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.white24),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'اسكب حبر أفكارك هنا...',
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- شاشة تحديات الأسبوع (ودية ومحفزة) ---
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, size: 64, color: Color(0xFFB197FC)),
            const SizedBox(height: 16),
            const Text('تحدي الأسبوع الحالي', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)),
              child: const Text(
                '"اكتب نصاً لا يتجاوز 150 كلمة، تدور أحداثه بالكامل في غرفة قطار ليلي مغلق، ويبدأ بعبارة: لم يكن الوقت كافياً لتبرير الاختفاء.."',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.6, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8E7AB5)),
              child: const Text('المشاركة في التحدي'),
            )
          ],
        ),
      ),
    );
  }
}

// --- شاشة الملف الشخصي (Profile) ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, backgroundColor: Color(0xFF8E7AB5), child: Icon(Icons.person, size: 50)),
          SizedBox(height: 16),
          Text('يوسف كمال', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('مؤسس منصة مبدعون | كاتب وروائي ومحب للفلسفة الأدبية', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
