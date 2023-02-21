import 'package:flutter/material.dart';
import 'package:lady_taxi/ui/widgets/registry_pages.dart';
import 'package:lady_taxi/utils/constants.dart';

class RegistryScreen extends StatefulWidget {
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final TextEditingController _textController = TextEditingController();
  final _pageController = PageController();

  String userInput = '+998 ';
  bool buttonDisabled = true;

  @override
  void initState() {
    super.initState();
    _textController.text = userInput;
  }

  void _updateUserInput() {
    _textController.text = userInput;
    _textController.selection = TextSelection.fromPosition(TextPosition(offset: _textController.text.length));
    if (userInput.startsWith('+998') && userInput.length == 17) {
      setState(() => buttonDisabled = false);
    } else if (buttonDisabled == false) {
      setState(() => buttonDisabled = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Ro'yxatdan o'tish")),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    child: PageView(
                      controller: _pageController,
                      allowImplicitScrolling: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RegistryNumberPage(_textController),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ElevatedButton(
                        onPressed: buttonDisabled
                            ? null
                            : () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
                              },
                        child: const Text('Continue')),
                  ),
                ],
              ),
            ),
            Container(
              height: 264,
              decoration: const BoxDecoration(
                color: kInputFillColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 264 / 4,
                ),
                physics: const ScrollPhysics(),
                itemCount: 12,
                padding: const EdgeInsets.all(0),
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      if (numpadItems[index] == '.' && userInput.length > 5) {
                        var list = userInput.split('');
                        list.removeLast();
                        userInput = list.join();
                        if (userInput.length > 7) {
                          userInput = userInput.trimRight();
                        }
                        _updateUserInput();
                      } else if (numpadItems[index] != '*' && numpadItems[index] != '.' && userInput.length < 17) {
                        userInput += numpadItems[index];
                        if (userInput.length == 7 || userInput.length == 11 || userInput.length == 14) {
                          userInput += ' ';
                        }
                        _updateUserInput();
                      }
                    },
                    child: Center(
                      child: numpadItems[index] == '.'
                          ? const Icon(Icons.backspace, size: 20)
                          : Text(numpadItems[index], style: kDefaultTextStyle.copyWith(fontSize: 22)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
