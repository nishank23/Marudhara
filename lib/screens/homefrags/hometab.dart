import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../helper/Themes.dart';
import '../Catalog/Catalog.dart';
import '../Productdetails.dart';

class hometab extends StatefulWidget {
  const hometab({super.key});

  @override
  State<hometab> createState() => _hometabState();
}

class _hometabState extends State<hometab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              "Hello, Nishank 👋",
              style: mySemiBold.copyWith(
                fontSize: 28,
              ),
            ),
            Text(
              "Find your style",
              style: myRegularFont.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Categories 💛",
              style: mySemiBold.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928__480.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: greyColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * .30,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  topRight: Radius.circular(22),
                                  bottomRight: Radius.circular(4))),
                          child: Stack(children: [
                            Expanded(
                              child: Text(
                                "Customized \n Products",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                                style: mySemiBold.copyWith(fontSize: 12),
                              ),
                            ),
                            const Spacer(),
                            const Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.arrow_outward_sharp,
                                  size: 15,
                                )),
                          ]),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "New Collection 💛",
              style: mySemiBold.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: size.width / size.height / .60),
                  shrinkWrap: true,
                  itemCount: 6,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const ProductDetail(),
                            transition: Transition.downToUp);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                    height: size.height * .18,
                                    fit: BoxFit.fill,
                                    "https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928__480.jpg"),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Jodhpuri jutties",
                                  style: myRegularFont.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Rs.100",
                                    style: myMediumFont.copyWith(
                                      color: primaryColor,
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
