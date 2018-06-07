import 'package:flutter/material.dart';

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("折叠列表"),
        ),
        body: new ListView.builder(
          itemBuilder: (context, index) =>
              ExpansionItemWidget(item: datas[index]),
          itemCount: datas.length,
        ),
      ),
    );
  }
}

class ExpansionItemWidget extends StatelessWidget {
  final ExpansionItem item;
  ExpansionItemWidget({this.item});
  Widget _buildItem(ExpansionItem item) {
    if (item.chirds.isEmpty) {
      return ListTile(
        title: Text(item.title),
      );
    }
    return new ExpansionTile(
      title: Text(item.title),
      key: new PageStorageKey(item),
      children: item.chirds.map((item) {
        return _buildItem(item);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    return _buildItem(item);
  }
}

//数据模型
class ExpansionItem {
  final String title;
  final List<ExpansionItem> chirds;
  const ExpansionItem({this.title, this.chirds: const <ExpansionItem>[]});
}

//数据源
List<ExpansionItem> datas = const [
  ExpansionItem(title: "A", chirds: [
    ExpansionItem(title: 'A0', chirds: [
      ExpansionItem(title: 'Item A'),
      ExpansionItem(title: 'Item B'),
      ExpansionItem(title: 'Item C'),
    ]),
    ExpansionItem(title: 'A1', chirds: [
      ExpansionItem(title: 'Item A'),
      ExpansionItem(title: 'Item B'),
      ExpansionItem(title: 'Item C'),
    ]),
    ExpansionItem(title: 'A2')
  ]),
  ExpansionItem(title: "B", chirds: [
    ExpansionItem(title: 'B0', chirds: [
      ExpansionItem(title: 'Item 1'),
      ExpansionItem(title: 'Item 2'),
      ExpansionItem(title: 'Item 3'),
    ]),
    ExpansionItem(title: 'B1'),
    ExpansionItem(title: 'B2')
  ]),
  ExpansionItem(title: "C", chirds: [
    ExpansionItem(title: 'C0', chirds: [
      ExpansionItem(title: 'Item 1'),
      ExpansionItem(title: 'Item 2'),
      ExpansionItem(title: 'Item 3'),
    ]),
    ExpansionItem(title: 'C1', chirds: [
      ExpansionItem(title: 'Item 1'),
      ExpansionItem(title: 'Item 2'),
      ExpansionItem(title: 'Item 3'),
    ]),
    ExpansionItem(title: 'C2')
  ]),
];
