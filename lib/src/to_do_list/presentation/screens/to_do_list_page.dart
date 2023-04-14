import 'package:flutter/material.dart';
import 'package:to_do_list_squad/core/components/sqd_modal_bottom_sheet.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/components/all_page.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/components/done_page.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/components/pending_page.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final List<String> _pages = [
    'All',
    'Pending',
    'done',
  ];

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SQDColor.background,
      appBar: AppBar(
        title: const Text('To do List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sQDShowModalBottomSheet(context);
        },
        backgroundColor: SQDColor.primary,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30, bottom: 15),
              decoration: const BoxDecoration(
                color: SQDColor.backgroundPageView,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                children: _pages.map((e) {
                  int index = _pages.indexOf(e);
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              _currentPage = index;
                              _pageController.animateToPage(_currentPage,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 15,
                          decoration: BoxDecoration(
                            color: index == _currentPage
                                ? SQDColor.accent
                                : SQDColor.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(index == 0 ? 30 : 0),
                              topRight: Radius.circular(
                                  index == _pages.length - 1 ? 30 : 0),
                              bottomLeft: Radius.circular(index == 0 ? 30 : 0),
                              bottomRight: Radius.circular(
                                  index == _pages.length - 1 ? 30 : 0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                color: index == _currentPage
                                    ? SQDColor.white
                                    : SQDColor.primaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  AllPage(),
                  PendingPage(),
                  DonePage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
