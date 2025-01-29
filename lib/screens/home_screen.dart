// Ana Ekran
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/favori_screen.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 184, 11),
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 182, 5),
        title: const Text('Yemek Kutusu'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 214, 153, 21),
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                context.go("/home");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.star),
              title: const Text('Favori Tariflerin'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                context.go("/settings");
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: RecipeGridPage(),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),
    );
  }
}

class RecipeGridPage extends StatefulWidget {
  @override
  _RecipeGridPageState createState() => _RecipeGridPageState();
}

class _RecipeGridPageState extends State<RecipeGridPage> {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Fırında Sütlaç',
      'image': 'assets/images/sutlac.jpg',
      'content': '''Fırında Sütlaç
MALZEMELER:
1 litre Hasan Türek Çiftliği Çiğ İnek Sütü,
1 su bardağı şeker,
Yarım su bardağı pirinç,
3 yemek kaşığı buğday nişastası,
1 paket vanilya,
2 su bardağı su,
Yarım su bardağı Hasan Türek Çiftliği Çiğ İnek Sütü (nişastayı açmak için).


YAPILIŞI:
Fırında sütlaç için öncelikle pirinci haşlayalım. Pirinçleri güzelce yıkadıktan sonra 2 su bardağı su ile pişene kadar haşlayın. Çok az sulu kalacaktır.
Diğer malzemeleri ekleyelim ve sütlacı pişirelim. Haşlanan pirinçlerin üzerine Hasan Türek Çiftliği Çiğ İnek Sütünü, vanilyayı ilave edip kaynatın. Karışım kaynamaya başlayınca şekeri ve yarım su bardağı Hasan Türek Çiftliği Çiğ İnek Sütü’nü karıştırdığınız 3 yemek kaşığı buğday nişastasını ilave ediniz. 10 - 15 dakika daha kaynatıp altını kapatın.
Sütlaçları fırına sürelim. Fırın için uygun ısıya dayanıklı sütlaç kaselerine sütlaçlarınızı paylaştırın. Tepsinize soğuk su doldurun ve sütlaç kaplarını fırın tepsinize dizin (Tepsideki su sütlaç kaplarının yarısına kadar gelecek). Tepsiyi fırınınızın en üst rafına yerleştirin. 180 derecede, sütlaçlarınız kızarana kadar fırınlayın. 
AFİYET OLSUN!
      '''
    },
    {
      'name': 'Profiterol',
      'image': 'assets/images/pro.jpg',
      'content': '''Profiterol Tarifi İçin Malzemeler
Profiterolun Çikolata Sosu İçin:
220 gram bitter çikolata
200 gram krema(1 kutu)
Profiterolun Hamuru İçin:
1/2 paket margarin (125 gram)
1 su bardağı su
1 su bardağı un
3 adet yumurta (oda sıcaklığında)
Profiterolun Kreması İçin:
500 mililitre süt (2,5 su bardağı)
1,5 çay bardağı toz şeker
3 yemek kaşığı un
1 adet yumurta
1 paket vanilin (veya vanilya çubuğu)

Profiterol Tarifinin Püf Noktası
Soğumuş olan hamurun üzerine her bir yumurtayı teker teker ekleyin ve her seferinde yumurtaları güzelce yedirerek yapışkan bir hamur elde edin.'''
    },
    {
      'name': 'Trileçe',
      'image': 'assets/images/trılece.webp',
      'content': '''Trileçe Tarifi İçin Malzemeler
      5 adet yumurta
1 su bardağından 1 parmak eksik şeker
1,5 su bardağı un
1 paket kabartma tozu
1 paket vanilya

Sütlü sosu için;

3,5 su bardağı süt
3 yemek kaşığı toz şeker
200 g sıvı krema
Karamel sosu için;

1 çay bardağı şeker
1 yemek kaşığı tereyağı
200 g sıvı krema

Üzeri için;

1 paket krem şanti

      '''
    },
    {
      'name': 'Yalancı Tavuk Göğsü',
      'image': 'assets/images/tavukgoğsu.jpg',
      'content': '''Yalancı Tavuk Göğsü Tarifi İçin Malzemeler
      125 g tereyağı (isteğe göre margarin ile de karıştırabilirsiniz)
1 su bardağı un
1,5 su bardağı şeker
1 lt süt
1 paket vanilya

Yalancı Tavuk Göğsü Tarifi Nasıl Yapılır?

İlk olarak tenceremize tereyağımızı alalım ve kısık ateşte yağımızı eritelim.
Yağımız eridikten sonra üzerine unu ilave edelim ve kokusu çıkana kadar yaklaşık 4-5 dakika karıştırarak kavuralım.
Unumuzu tel çırpıcı ile karıştırırken bir yandan üzerine sütü ekleyelim. Burada mutlaka ununuzu karıştırmalısınız aksi halde topaklanma olabilir.
Üzerine şekeri ilave ederek muhallebimiz kıvam alıp koyulaşana kadar karıştıralım.
Koyulaşan muhallebimizi ocaktan alalım, sonrasında vanilya ilave ederek 3-4 dakika mikserle çırpalım.
Hazırladığımız muhallebimizi 22 cm boyutlarındaki ıslattığımız borcama dökerek üzerini bir spatula yardımı ile düzeltelim. Oda  sıcaklığına gelmesi için bekletelim.
Oda ısısına geldikten sonra üzerini streçleyelim, buzdolabında 2-3 saat dinlendirelim.
Dinlenen tatlımızı dolaptan alalım, yanlarına bastırarak havasını çıkartalım ve servis tabağına ters çevirerek çıkartalım.
Sonrasında tekrar kestiğimi pişirme kağıtlarını tatlının boyuna doğru aralıklı olarak
yerleştirdim ve tarçın döktükten sonra dikkatlice çıkarttım ve çok hoş bir görüntü elde ettim. Ancak siz dilediğiniz şekilde süsleyebilirsiniz. Afiyet olsun!

      '''
    },
    {
      'name': 'Fincan Tatlısı',
      'image': 'assets/images/fıncan.jpg',
      'content': '''Fincan Tatlısı Nasıl Yapılır? İçin Malzemeler
      1 litre süt
1 su bardağı toz şeker
1 su bardağı un
1 yemek kaşığı tereyağı
1 paket vanilya

Fincan Tatlısı Nasıl Yapılır?

Muhallebisi için tencereye sütü, unu ve şekeri alıp karıştıralım ve  ocağı açalım.
Muhallebimiz koyulaşıp göz göz oluncaya kadar sürekli karıştırarak pişirelim.
Muhallebi piştikten sonra ocağı kapatalım. Son olarak muhallebiye tereyağı ve vanilyayı ilave edelim. Tereyağı eriyip pürüzsüz bir kıvam alıncaya kadar karıştıralım.
Hazır olan muhallebimizi içerisini çok az ıslattığımız fincanlara paylaştıralım. Muhallebi soğudukça yoğunlaşacağı için bu aşamada hızlı olmanızda fayda var.
Tüm fincanları doldurduktan sonra oda sıcaklığına gelinceye kadar bekletelim.
Ardından tatlılarımızı buzdolabına kaldırarak 3-4 saat dinlenmeye bırakalım.
Sürenin sonunda dinlenen ve soğuyan tatlılarımızı dolaptan alalım, ters çevirerek fincanlardan çıkartalım. Fincanların kenarlarından elimizi hafifçe havasını aldığımızda kolaylıkla tatlı fincandan çıkacaktır.
Tatlıları daha sonra Hindistan cevizine bulayarak servis edebilirsiniz. Afiyet olsun!
      '''
    },
    {
      'name': 'Magnolia',
      'image': 'assets/images/magnolıa.webp',
      'content': '''Magnolia Tatlısı Tarifi İçin Malzemeler
      1 lt süt
2 yemek kaşığı un
2 yemek kaşığı nişasta
1 yumurta sarısı
1 su bardağından biraz az şeker
1 paket vanilya
1 paket krema
1, 5 paket bisküvi (Ben petibör bisküvi ile yaptım)
Çilek, muz

Magnolia Tatlısı Tarifi Nasıl Yapılır?

Krema ve vanilya hariç muhallebi malzemelerini bir tencereye alalım ve kaynayana kadar pişirelim.
Kaynayınca vanilyayı ilave edelim.
5 dk soğumaya bırakalım ve kremasını ekleyip mikserle güzelce çırpalım.
Bisküvileri blenderla ufalayalım.
Kuplara bisküvi muhallebi muz ve çilekleri istediğimiz sıra ve şekilde dizelim.
Süslemeyi yaptıktan sonra dinlenmeye bırakalım afiyet olsun.
      '''
    },
    {
      'name': 'Çikolatalı Kurabiye',
      'image': 'assets/images/kurabiye.jpg',
      'content': '''Çikolatalı Çatlak Kurabiye Nasıl Yapılır? İçin Malzemeler
      100gr margarin veya tereyağı
80gr bitter çikolata
2 adet yumurta
Yarım su bardağı toz şeker
2 yemek kaşığı kakao
1 paket kabartma tozu
1 paket vanilya
1 su bardağı + 2 yemek kaşığı un

Çikolatalı Çatlak Kurabiye Nasıl Yapılır?

Öncelikle tereyağını kısık ateşte eritin ve ocaktan alıp sıcak tereyağının içine çikolatayı koyun ve karıştırarak erimesini sağlayın.
Derin bir kaba yumurtaları ve şekeri koyup köpürene kadar çırpın.
Ilımış olan çikolatalı karışımı çırptığınız yumurta ve şeker karışımının içine ilave edip mikser ile malzemeler iyice karışana kadar çırpın.
Kakao, kabartma tozu, vanilya ve unu çırptığınız malzemeye ilave edin ve spatula yada tahta kaşık yardımıyla karıştırın. (Bildiğimiz kurabiye hamurundan daha akıcı bir kıvamda olacak)
Üzerini streç film ile kapatıp buzdolabında donması için 2-3 saat bekletin.
Buzdolabında bekletiğiniz hamuru tatlı kaşığı yardımıyla ceviz büyüklüğünde alıp elinizle yuvarlayın.
Elinizde yuvarladığınız hamuru pudra şekerine bulayın ve yağlı kağıt serili fırın tepsisine aralıklı yerleştirin.
Bütün işlem bittikten sonra pudra şekeri az olmuş ise kurabiyeleri pudra şekerine ikinci kez bulayabilir yada üzerlerine pudra şekeri serpebilirsiniz.önceden ısıtılmış 180ºC de fırında 15 dk pişirin. Afiyet olsun.
      '''
    },
    {
      'name': 'Kazandibi',
      'image': 'assets/images/kazandıbı.webp',
      'content': '''Kazandibi Tatlısı Tarifi İçin Malzemeler
1,5 lt süt
1,5 su bardağı toz şeker
1 su bardağı pirinç unu
3 yemek kaşığı dolusu nişasta
1 paket vanilin
1 yemek kaşığı dolusu tereyağ

Karamelize kısmı için;

1 parça tereyağ
3 yemek kaşığı pudra şekeri

Kazandibi Tatlısı Tarifi Nasıl Yapılır?

Isıya dayanaklı bir tepsiyi tereyağ veya margarinle yağlayıp üzerine pudra şekeri eleyin. Bir kenarda bekletin.
Muhallebisi için vanilin ve tereyağ hariç bütün malzemeleri uygun bir tencereye ekleyip karıştırın.
Pürüzsüz bir kıvam olduğu zaman ocağa alıp sürekli karıştırarak pişirin.
Piştikten sonra vanilin ve tereyağını ekleyip karıştırın ve 2-3 dk blenderdan geçirin. Bu şekilde daha güzel bir kıvam elde ediyoruz.
Tepsiyi ocağın üstüne alın ve kısık ateşte pudra şekerinin yanarak karamelize olmasını sağlayın. Her yerini çevirerek yapın. Videodan detayları görebilirsiniz.
Muhallebiden 3-4 kepçe tepsiye aktarıp karamelize kısımla nazikçe karıştırın.
Kızarmış katman bu şekilde daha belirgin oluyor.
Kalan muhallebiyi tepsiye aktarıp önce oda sıcaklığında sonra buzdolabında soğutun.
Tamamen soğuduğunda dilimleyerek ve rulo yaparak servis yapın. Afiyet olsun.
'''
    }
  ];

  final List<Map<String, String>> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(favorites: favorites),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 sütunlu düzen
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          name: recipes[index]['name']!,
                          image: recipes[index]['image']!,
                          content: recipes[index]['content']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 230, 196, 8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              recipes[index]['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipes[index]['name']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    icon: Icon(
                      favorites.contains(recipes[index])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favorites.contains(recipes[index])
                          ? Colors.red
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (favorites.contains(recipes[index])) {
                          favorites.remove(recipes[index]);
                        } else {
                          favorites.add(recipes[index]);
                        }
                      });
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String content;

  RecipeDetailPage({
    required this.name,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favorites;

  FavoritesPage({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text('No favorites yet!'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          name: favorites[index]['name']!,
                          image: favorites[index]['image']!,
                          content: favorites[index]['content']!,
                        ),
                      ),
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      favorites[index]['image']!,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                  title: Text(favorites[index]['name']!),
                  subtitle: Text(
                    favorites[index]['content']!,
                    maxLines: 1,
                  ),
                );
              },
            ),
    );
  }
}
