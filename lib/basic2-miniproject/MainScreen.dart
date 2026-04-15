import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '여기어때',
          style: TextStyle(
            color: Color(0xFFE61919),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("로그인 / 회원가입",
                  style: TextStyle(color: Colors.blue, fontSize: 12)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // 1. 상단 카테고리 그리드 메뉴
            _buildCategoryGrid(context),

            const Divider(thickness: 8, color: Color(0xFFF5F5F5)),

            // 2. 최근에 본 상품
            _buildHorizontalSection("최근에 본 상품", [
              _buildLargeCard("국내 숙소", "★당일특가★...", "assets/images/recent1.png"),
            ]),

            // 3. 이벤트 배너
            _buildEventBanner(),

            // 4. 미리 준비하는 공휴일
            _buildHorizontalSection("미리 준비하는 공휴일", [
              _buildProductCard("강릉", "세인트존스 호텔", "58,400원", true, "assets/images/Gangneung.png"),
              _buildProductCard("서울", "시그니엘 서울", "456,500원", true, "assets/images/Seoul.png"),
            ]),

            // 5. 오늘 체크인 호텔특가
            _buildHorizontalSection("오늘 체크인 호텔특가", [
              _buildProductCard("부산", "해운대 호텔", "88,900원", false, "assets/images/haeundae_hotel.png"),
              _buildProductCard("제주", "서귀포 리조트", "112,400원", false, "assets/images/seogwipo_resort.png"),
            ]),

            // 6. 요즘 많이 찾는 펜션
            _buildHorizontalSection("요즘 많이 찾는 펜션", [
              _buildProductCard("가평", "럭셔리 풀빌라", "280,000원", false, "assets/images/gapyeong_villa.png"),
              _buildProductCard("포천", "숲속 글램핑", "120,000원", true, "assets/images/pocheon_glamping.png"),
            ]),

            // 7. 해외인기 도시 TOP6
            _buildHorizontalSection("해외인기 도시 TOP6", [
              _buildRankingCard("1", "오사카", "일본", "assets/images/osaka.png"),
              _buildRankingCard("2", "도쿄", "일본", "assets/images/tokyo.png"),
              _buildRankingCard("3", "방콕", "태국", "assets/images/bangkok.png"),
            ]),

            // 8. 해외 항공+숙소 특가
            _buildHorizontalSection("해외 항공+숙소 특가", [
              _buildProductCard("세부", "제이파크 리조트", "350,000원", true, "assets/images/cebu_resort.png"),
              _buildProductCard("코타키나발루", "샹그릴라", "420,000원", true, "assets/images/kotakinabalu.png"),
            ]),

            // 9. 지금 여기
            _buildHorizontalSection("지금 여기", [
              _buildLargeCard("벚꽃 축제", "벚꽃 명소 베스트", "assets/images/cherry_blossom.png"),
              _buildLargeCard("서울 여행", "궁궐 야간 개장", "assets/images/seoul_palace.png"),
            ]),

            const SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // --- 위젯 구성 함수들 ---

  // 1. 카테고리 그리드
  Widget _buildCategoryGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        children: [
          _buildCategoryItem(context, Icons.hotel, "호텔·리조트", '/hotel'),
          _buildCategoryItem(context, Icons.king_bed, "모텔", '/motel'),
          _buildCategoryItem(context, Icons.pool, "펜션·풀빌라", '/hotel'),
          _buildCategoryItem(context, Icons.landscape, "캠핑·글램핑", '/hotel'),
          _buildCategoryItem(context, Icons.home, "홈&빌라", '/hotel'),
          _buildCategoryItem(context, Icons.temple_buddhist, "게하·한옥", '/hotel'),
          _buildCategoryItem(context, Icons.directions_car, "렌터카", '/hotel'),
          _buildCategoryItem(context, Icons.card_travel, "패키지 여행", '/hotel'),
          _buildCategoryItem(context, Icons.flight_takeoff, "항공+숙소", '/hotel'),
          _buildCategoryItem(context, Icons.flight, "항공", '/hotel'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.redAccent),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  // 2. 섹션 레이아웃
  Widget _buildHorizontalSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: items,
          ),
        ),
      ],
    );
  }

  // 3. 상품 카드
  Widget _buildProductCard(String location, String name, String price, bool isSale, String imgPath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 120,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.error, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(price, style: TextStyle(color: isSale ? Colors.red : Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // 4. 랭킹 카드
  Widget _buildRankingCard(String rank, String city, String country, String imgPath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 150,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
              ),
            ),
          ),
          Positioned(
            top: 5, left: 10,
            child: Text(rank, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic, shadows: [Shadow(blurRadius: 2, color: Colors.black45)])),
          ),
          Positioned(
            bottom: 10, left: 10,
            child: Text("$city\n$country", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  // 5. 대형 카드
  Widget _buildLargeCard(String tag, String title, String imgPath) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 140,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.photo, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(tag, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
        ],
      ),
    );
  }

  // 6. 이벤트 배너
  Widget _buildEventBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Text("🎁 지금 가입하면 10만원 쿠폰팩 증정!", style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  // 7. 하단 내비게이션 바 (팀원들의 마이페이지 연결 포함)
  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 4) {
          Navigator.pushNamed(context, '/mypage'); // 팀원의 마이페이지로 이동
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "내주변"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "찜"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "내정보"),
      ],
    );
  }
}