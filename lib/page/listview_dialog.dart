import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    "Dentist",
    "Pharmacist",
    "School teacher",
    "IT manager",
    "Account",
    "Lawyer",
    "Hairdresser",
    "Physician",
    "Web developer",
    "Medical Secretary"
  ];
  var imageList = [
    "assets/images/listview/1.png",
    "assets/images/listview/2.png",
    "assets/images/listview/3.png",
    "assets/images/listview/4.png",
    "assets/images/listview/5.png",
    "assets/images/listview/6.png",
    "assets/images/listview/7.png",
    "assets/images/listview/8.png",
    "assets/images/listview/9.png",
    "assets/images/listview/10.png",
  ];

  var description = [
    "1. There are different types of careers you can pursue in your life. Which one will it be?",
    "2. There are different types of careers you can pursue in your life. Which one will it be?",
    "3. There are different types of careers you can pursue in your life. Which one will it be?",
    "4. There are different types of careers you can pursue in your life. Which one will it be?",
    "5. There are different types of careers you can pursue in your life. Which one will it be?",
    "6. There are different types of careers you can pursue in your life. Which one will it be?",
    "7. There are different types of careers you can pursue in your life. Which one will it be?",
    "8. There are different types of careers you can pursue in your life. Which one will it be?",
    "9. There are different types of careers you can pursue in your life. Which one will it be?",
    "10. There are different types of careers you can pursue in your life. Which one will it be?",
  ];

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(children: [
                ClipRRect(
                  //사진 사각형
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 180,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text("close"),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return GestureDetector(
            //클릭이나 탭같은 기능 없는 위젯에다가 감싸면 기능 생김
            onTap: () {
              showPopup(context, titleList[index], imageList[index],
                  description[index]);
            },
            child: Card(
              //Card 위젯
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        titleList[index],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: width,
                        child: Text(
                          description[index],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          );
        }),
        itemCount: titleList.length,
      ),
    );
  }
}
