import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  // final Image image;
  final List<Future<Uint8List?>> futureImageList;
  final Image noImageImage;
  SliverAppBarDelegate(
      {Key? key, required this.futureImageList, required this.noImageImage
      // required this.image
      });

  @override
  double get minExtent => 100;
  @override
  double get maxExtent =>
      // image.height ??
      300;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        // height: 300,

        width: MediaQuery.of(context).size.width,
        child: futureImageList.isNotEmpty
            ? FutureBuilder(
                future: Future.wait(futureImageList),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return noImageImage;
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CupertinoActivityIndicator(),
                        ],
                      ),
                    );
                  }
                  List<Uint8List?> imageList = [];
                  for (var element in snapshot.data.items) {
                    imageList.add(element.getData());
                  }
                  return CarouselSlider.builder(
                      itemCount: imageList.length,
                      options: CarouselOptions(
                        autoPlay: imageList.length > 1 ? true : false,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return CupertinoContextMenu(actions: <Widget>[
                          CupertinoContextMenuAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDefaultAction: true,
                            trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                            child: const Text('Copy'),
                          ),
                          CupertinoContextMenuAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            trailingIcon: CupertinoIcons.share,
                            child: const Text('Share'),
                          ),
                          CupertinoContextMenuAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            trailingIcon: CupertinoIcons.heart,
                            child: const Text('Favorite'),
                          ),
                          CupertinoContextMenuAction(
                            onPressed: () {
                              // imageListResults
                              //     .items[itemIndex]
                              //     .delete()
                              //     .then(
                              //         (value) => refresh());
                              // refresh();
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                            trailingIcon: CupertinoIcons.delete,
                            child: const Text('Delete'),
                          ),
                        ], child: Image.memory(imageList[itemIndex]!));
                      });
                })
            : noImageImage
        // Stack(
        //   fit: StackFit.expand,
        //   children: [
        //     Align(
        //       alignment: Alignment.center,
        //         child: SizedBox(
        //           width: MediaQuery.of(context).size.width,
        //           child: Image(
        //             image: image.image,
        //             fit: BoxFit.fitWidth,
        //           ),
        //         )
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: ClipRRect(
        //         child: BackdropFilter(
        //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //           child: SizedBox(
        //             height: 300,
        //             width: MediaQuery.of(context).size.width,
        //             child: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: image,
        //             ),
        //           ),

        //         ),
        //       ),
        //     )
        //   ],
        // )
        );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
