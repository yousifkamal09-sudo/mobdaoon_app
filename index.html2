import 'package:flutter/material.dart';

void main() {
  runApp(const NasrPortalApp());
}

// ============================================================
// التطبيق
// ============================================================

class NasrPortalApp extends StatelessWidget {
  const NasrPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'بوابة نصر',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5425C8),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================
// الألوان
// ============================================================

class AppColors {
  static const purple = Color(0xFF5425C8);
  static const darkPurple = Color(0xFF241052);
  static const blue = Color(0xFF1976D2);
  static const green = Color(0xFF16A36A);
  static const orange = Color(0xFFFF8A00);
  static const red = Color(0xFFE53935);
  static const background = Color(0xFFF7F7FB);
}

// ============================================================
// الصفحة الرئيسية
// ============================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeDashboard(),
    CalendarPage(),
    MessagesPage(),
    NotificationsPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFEAE1FF),
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'التقويم',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat),
              label: 'التواصل',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none),
              selectedIcon: Icon(Icons.notifications),
              label: 'الإشعارات',
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz),
              selectedIcon: Icon(Icons.more_horiz),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// لوحة التحكم الرئيسية
// ============================================================

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------
            // رأس الصفحة
            // ------------------------------------------

            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFE8DFFF),
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: AppColors.purple,
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحباً 👋',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'أحمد محمد',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'الصف الأول المتوسط - أ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationsPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 28,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // ------------------------------------------
            // بطاقة بوابة نصر
            // ------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.darkPurple,
                    AppColors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'بوابة نصر',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'مدرستنا • مستقبل أبنائنا',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'لديك 5 حصص اليوم',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'الخدمات الرئيسية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            // ------------------------------------------
            // الخدمات
            // ------------------------------------------

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .92,
              children: [

                ServiceCard(
                  title: 'الجدول الدراسي',
                  icon: Icons.calendar_month,
                  color: AppColors.blue,
                  onTap: () {
                    openPage(
                      context,
                      const SchedulePage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'الواجبات',
                  icon: Icons.menu_book,
                  color: AppColors.orange,
                  badge: '3',
                  onTap: () {
                    openPage(
                      context,
                      const AssignmentsPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'النتائج',
                  icon: Icons.bar_chart,
                  color: AppColors.purple,
                  onTap: () {
                    openPage(
                      context,
                      const ResultsPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'الحضور والغياب',
                  icon: Icons.person,
                  color: AppColors.green,
                  onTap: () {
                    openPage(
                      context,
                      const AttendancePage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'الإعلانات',
                  icon: Icons.campaign,
                  color: Colors.deepPurple,
                  badge: '2',
                  onTap: () {
                    openPage(
                      context,
                      const AnnouncementsPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'التواصل',
                  icon: Icons.chat,
                  color: AppColors.blue,
                  onTap: () {
                    openPage(
                      context,
                      const MessagesPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'الرسوم الدراسية',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.green,
                  onTap: () {
                    openPage(
                      context,
                      const FeesPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'المكتبة الرقمية',
                  icon: Icons.library_books,
                  color: Colors.teal,
                  onTap: () {
                    openPage(
                      context,
                      const LibraryPage(),
                    );
                  },
                ),

                ServiceCard(
                  title: 'الاختبارات',
                  icon: Icons.assignment,
                  color: Colors.indigo,
                  onTap: () {
                    openPage(
                      context,
                      const ExamsPage(),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ------------------------------------------
            // آخر الإعلانات
            // ------------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'آخر الإعلانات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    openPage(
                      context,
                      const AnnouncementsPage(),
                    );
                  },
                  child: const Text('عرض الكل'),
                ),
              ],
            ),

            AnnouncementCard(
              title: 'اجتماع أولياء الأمور',
              description: 'سيتم عقد اجتماع لأولياء الأمور هذا الأسبوع.',
              date: '28 أغسطس 2026',
              icon: Icons.groups,
            ),

            AnnouncementCard(
              title: 'مسابقة حفظ القرآن الكريم',
              description: 'التسجيل مفتوح لجميع الطلاب.',
              date: '30 أغسطس 2026',
              icon: Icons.menu_book,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// بطاقة الخدمات
// ============================================================

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String? badge;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: color.withOpacity(.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 27,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            if (badge != null)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// الجدول الدراسي
// ============================================================

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {

    final lessons = [
      ['08:00', 'الرياضيات', Icons.calculate],
      ['08:50', 'اللغة العربية', Icons.menu_book],
      ['09:40', 'العلوم', Icons.science],
      ['10:30', 'اللغة الإنجليزية', Icons.language],
      ['11:20', 'التربية الإسلامية', Icons.auto_stories],
    ];

    return AppPage(
      title: 'الجدول الدراسي',
      child: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              leading: CircleAvatar(
                backgroundColor: AppColors.purple.withOpacity(.1),
                child: Icon(
                  lessons[index][2] as IconData,
                  color: AppColors.purple,
                ),
              ),

              title: Text(
                lessons[index][1] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                'الحصة ${index + 1}',
              ),

              trailing: Text(
                lessons[index][0] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// الواجبات
// ============================================================

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final assignments = [
      ['الرياضيات', 'حل التمارين من 45 إلى 47', '28 أغسطس'],
      ['اللغة العربية', 'كتابة موضوع تعبير', '29 أغسطس'],
      ['العلوم', 'تجربة عملية عن النباتات', '30 أغسطس'],
      ['اللغة الإنجليزية', 'حل ورقة العمل', '1 سبتمبر'],
    ];

    return AppPage(
      title: 'الواجبات',
      child: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.assignment),
              ),

              title: Text(
                assignments[index][0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                assignments[index][1],
              ),

              trailing: Text(
                assignments[index][2],
                style: const TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// النتائج
// ============================================================

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final subjects = {
      'الرياضيات': 95,
      'اللغة العربية': 93,
      'العلوم': 90,
      'اللغة الإنجليزية': 88,
      'التربية الإسلامية': 98,
      'الحاسب الآلي': 100,
    };

    return AppPage(
      title: 'النتائج',
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7FF),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              children: [
                Text(
                  'المعدل العام',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  '92.4',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purple,
                  ),
                ),

                Text(
                  'ممتاز 🏆',
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: subjects.entries.map((subject) {

                return Card(
                  child: ListTile(
                    title: Text(subject.key),

                    trailing: Text(
                      '${subject.value}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple,
                      ),
                    ),
                  ),
                );

              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// الحضور والغياب
// ============================================================

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الحضور والغياب',
      child: Column(
        children: [

          Row(
            children: [
              AttendanceBox(
                title: 'حاضر',
                number: '20',
                color: AppColors.green,
              ),

              AttendanceBox(
                title: 'غائب',
                number: '2',
                color: AppColors.red,
              ),

              AttendanceBox(
                title: 'متأخر',
                number: '1',
                color: AppColors.orange,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: const [
                AttendanceRow(
                  date: '26 أغسطس',
                  status: 'حاضر',
                  color: AppColors.green,
                ),

                AttendanceRow(
                  date: '25 أغسطس',
                  status: 'حاضر',
                  color: AppColors.green,
                ),

                AttendanceRow(
                  date: '24 أغسطس',
                  status: 'غائب',
                  color: AppColors.red,
                ),

                AttendanceRow(
                  date: '23 أغسطس',
                  status: 'حاضر',
                  color: AppColors.green,
                ),

                AttendanceRow(
                  date: '22 أغسطس',
                  status: 'متأخر',
                  color: AppColors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceBox extends StatelessWidget {
  final String title;
  final String number;
  final Color color;

  const AttendanceBox({
    super.key,
    required this.title,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceRow extends StatelessWidget {
  final String date;
  final String status;
  final Color color;

  const AttendanceRow({
    super.key,
    required this.date,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          status == 'حاضر'
              ? Icons.check_circle
              : status == 'غائب'
                  ? Icons.cancel
                  : Icons.access_time,
          color: color,
        ),

        title: Text(date),

        trailing: Text(
          status,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// الإعلانات
// ============================================================

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الإعلانات',
      child: ListView(
        children: const [

          AnnouncementCard(
            title: 'اجتماع أولياء الأمور',
            description:
                'سيتم عقد اجتماع لأولياء الأمور هذا الأسبوع.',
            date: '28 أغسطس 2026',
            icon: Icons.groups,
          ),

          AnnouncementCard(
            title: 'مسابقة حفظ القرآن الكريم',
            description:
                'التسجيل مفتوح لجميع الطلاب.',
            date: '30 أغسطس 2026',
            icon: Icons.menu_book,
          ),

          AnnouncementCard(
            title: 'رحلة مدرسية',
            description:
                'تم فتح التسجيل للرحلة المدرسية.',
            date: '2 سبتمبر 2026',
            icon: Icons.directions_bus,
          ),
        ],
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final IconData icon;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor:
                AppColors.purple.withOpacity(.1),
            child: Icon(
              icon,
              color: AppColors.purple,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.purple,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// الرسوم الدراسية
// ============================================================

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الرسوم الدراسية',
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [

                Text(
                  'إجمالي الرسوم',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  '1,200,000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purple,
                  ),
                ),

                Text('جنيه سوداني'),
              ],
            ),
          ),

          const SizedBox(height: 15),

          const InfoCard(
            title: 'المبلغ المدفوع',
            value: '800,000 جنيه',
            color: AppColors.green,
          ),

          const InfoCard(
            title: 'المبلغ المتبقي',
            value: '400,000 جنيه',
            color: AppColors.red,
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.payment),
              label: const Text('دفع الرسوم'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// المكتبة الرقمية
// ============================================================

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final books = [
      ['الرياضيات', Icons.calculate],
      ['اللغة العربية', Icons.menu_book],
      ['العلوم', Icons.science],
      ['اللغة الإنجليزية', Icons.language],
      ['التربية الإسلامية', Icons.auto_stories],
    ];

    return AppPage(
      title: 'المكتبة الرقمية',
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(
                books[index][1] as IconData,
                color: AppColors.purple,
              ),

              title: Text(
                books[index][0] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// الاختبارات
// ============================================================

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الاختبارات',
      child: ListView(
        children: const [

          ExamCard(
            subject: 'الرياضيات',
            date: '5 سبتمبر 2026',
            time: '08:00 صباحاً',
          ),

          ExamCard(
            subject: 'اللغة العربية',
            date: '7 سبتمبر 2026',
            time: '08:00 صباحاً',
          ),

          ExamCard(
            subject: 'العلوم',
            date: '9 سبتمبر 2026',
            time: '08:00 صباحاً',
          ),
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  final String subject;
  final String date;
  final String time;

  const ExamCard({
    super.key,
    required this.subject,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.assignment),
        ),

        title: Text(
          subject,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text('$date • $time'),

        trailing: const Icon(Icons.chevron_left),
      ),
    );
  }
}

// ============================================================
// التواصل
// ============================================================

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'التواصل',
      child: ListView(
        children: const [

          MessageCard(
            name: 'أ. محمد علي',
            subject: 'معلم الرياضيات',
            icon: Icons.person,
          ),

          MessageCard(
            name: 'أ. سارة أحمد',
            subject: 'معلمة اللغة العربية',
            icon: Icons.person,
          ),

          MessageCard(
            name: 'إدارة المدرسة',
            subject: 'الإدارة',
            icon: Icons.school,
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String name;
  final String subject;
  final IconData icon;

  const MessageCard({
    super.key,
    required this.name,
    required this.subject,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              AppColors.purple.withOpacity(.1),
          child: Icon(
            icon,
            color: AppColors.purple,
          ),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subject),

        trailing: const Icon(
          Icons.chat_bubble_outline,
        ),
      ),
    );
  }
}

// ============================================================
// الإشعارات
// ============================================================

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الإشعارات',
      child: ListView(
        children: const [

          NotificationCard(
            title: 'تم إضافة واجب جديد',
            description: 'واجب الرياضيات متاح الآن.',
            icon: Icons.assignment,
          ),

          NotificationCard(
            title: 'تم تسجيل الحضور',
            description: 'تم تسجيل حضورك اليوم.',
            icon: Icons.check_circle,
          ),

          NotificationCard(
            title: 'إعلان جديد',
            description: 'تم نشر إعلان من إدارة المدرسة.',
            icon: Icons.campaign,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.purple,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(description),
      ),
    );
  }
}

// ============================================================
// التقويم
// ============================================================

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'التقويم الدراسي',
      child: ListView(
        children: const [

          CalendarEvent(
            date: '28',
            month: 'أغسطس',
            title: 'اجتماع أولياء الأمور',
          ),

          CalendarEvent(
            date: '30',
            month: 'أغسطس',
            title: 'مسابقة مدرسية',
          ),

          CalendarEvent(
            date: '5',
            month: 'سبتمبر',
            title: 'اختبار الرياضيات',
          ),

          CalendarEvent(
            date: '10',
            month: 'سبتمبر',
            title: 'بداية الاختبارات',
          ),
        ],
      ),
    );
  }
}

class CalendarEvent extends StatelessWidget {
  final String date;
  final String month;
  final String title;

  const CalendarEvent({
    super.key,
    required this.date,
    required this.month,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 55,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.purple.withOpacity(.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.purple,
                ),
              ),
              Text(
                month,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// المزيد
// ============================================================

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'المزيد',
      child: ListView(
        children: [

          const ProfileHeader(),

          const SizedBox(height: 15),

          MoreItem(
            title: 'الملف الشخصي',
            icon: Icons.person,
            onTap: () {
              openPage(
                context,
                const ProfilePage(),
              );
            },
          ),

          MoreItem(
            title: 'أبنائي',
            icon: Icons.family_restroom,
            onTap: () {},
          ),

          MoreItem(
            title: 'الإعدادات',
            icon: Icons.settings,
            onTap: () {},
          ),

          MoreItem(
            title: 'المساعدة والدعم',
            icon: Icons.support_agent,
            onTap: () {},
          ),

          MoreItem(
            title: 'اختيار نوع الحساب',
            icon: Icons.manage_accounts,
            onTap: () {
              openPage(
                context,
                const AccountTypePage(),
              );
            },
          ),

          MoreItem(
            title: 'تسجيل الخروج',
            icon: Icons.logout,
            color: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.darkPurple,
            AppColors.purple,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        children: [

          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: AppColors.purple,
              size: 35,
            ),
          ),

          SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أحمد محمد',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'الصف الأول المتوسط - أ',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const MoreItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: color ?? AppColors.purple,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_left,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ============================================================
// الملف الشخصي
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'الملف الشخصي',
      child: Column(
        children: const [

          CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xFFE8DFFF),
            child: Icon(
              Icons.person,
              size: 60,
              color: AppColors.purple,
            ),
          ),

          SizedBox(height: 15),

          Text(
            'أحمد محمد',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            'الصف الأول المتوسط - أ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25),

          ProfileInfo(
            title: 'الرقم الدراسي',
            value: '2024001',
          ),

          ProfileInfo(
            title: 'تاريخ الميلاد',
            value: '15 / 3 / 2011',
          ),

          ProfileInfo(
            title: 'البريد الإلكتروني',
            value: 'ahmed@example.com',
          ),

          ProfileInfo(
            title: 'رقم الهاتف',
            value: '09XXXXXXXX',
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// اختيار نوع الحساب
// ============================================================

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppPage(
      title: 'اختر نوع الحساب',
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [

          AccountCard(
            title: 'طالب',
            icon: Icons.school,
            color: AppColors.orange,
          ),

          AccountCard(
            title: 'ولي أمر',
            icon: Icons.family_restroom,
            color: AppColors.blue,
          ),

          AccountCard(
            title: 'معلم',
            icon: Icons.person,
            color: AppColors.green,
          ),

          AccountCard(
            title: 'الإدارة',
            icon: Icons.admin_panel_settings,
            color: AppColors.purple,
          ),
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const AccountCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(.1),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// عنصر صفحة عامة
// ============================================================

class AppPage extends StatelessWidget {
  final String title;
  final Widget child;

  const AppPage({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

// ============================================================
// دالة الانتقال
// ============================================================

void openPage(
  BuildContext context,
  Widget page,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: page,
      ),
    ),
  );
}
