import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  //数据源
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(14.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2; //向下取整
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final aleadySaved = _saved.contains(pair);
    return new ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(aleadySaved ? Icons.favorite : Icons.favorite_border,
          color: aleadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (aleadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text(wordPair.asPascalCase),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: _buildSuggestions());
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
            title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: AppBar(
          title: Text("saved pair"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}
