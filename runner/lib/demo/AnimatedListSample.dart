import 'package:flutter/material.dart';

class AnimatedListSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimatedListSampleState();
  }
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListManager<int> _manager;

  int _selectItem;
  int _nextItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _manager = ListManager<int>(
      listKey: _listKey,
      initialItems: [0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _manager[index],
      selected: _selectItem == _manager[index],
      onTap: () {
        setState(() {
          //选中或者取消选中
          _selectItem = _selectItem == _manager[index] ? null : _manager[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

//Action
  void _insert() {
    //找到插入的位置，在最后或者点击的位置插入一个新的
    final int index =
        _selectItem == null ? _manager.length : _manager.indexOf(_selectItem);
    _manager.insert(index, _nextItem++);
  }

//移除选中的那一项
  void _remove() {
    if (_selectItem != null) {
      _manager.removeAt(_manager.indexOf(_selectItem));
      setState(() {
        _selectItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: const Text("AnimatedList"),
          actions: <Widget>[
            new IconButton(
              tooltip: 'insert a new item',
              onPressed: _insert,
              icon: const Icon(Icons.add_circle),
            ),
            new IconButton(
              tooltip: 'delete selected item',
              onPressed: _remove,
              icon: const Icon(Icons.remove_circle),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedList(
              key: _listKey,
              initialItemCount: _manager.length,
              itemBuilder: _buildItem),
        ),
      ),
    );
  }
}

//每一个条目
class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      //扩展父主题时无需覆盖所有的主题属性，我们可以通过使用copyWith方法来实现。
      textStyle = textStyle.copyWith(color: Colors.lightBlueAccent[400]);
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: SizedBox(
              height: 128.0,
              child: Card(
                color: Colors.primaries[item % Colors.primaries.length],
                child: Center(
                  child: Text(
                    'Item $item',
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

//管理模型和动画列表
class ListManager<E> {
  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;
  ListManager(
      {@required this.listKey,
      @required this.removedItemBuilder,
      Iterable<E> initialItems})
      : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = List<E>.from(initialItems ?? <E>[]);
  //定义一个get
  AnimatedListState get _animatedListState => listKey.currentState;
  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedListState.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedListState.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }
}
