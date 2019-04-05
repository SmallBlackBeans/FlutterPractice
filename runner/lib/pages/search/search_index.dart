import 'package:flutter/material.dart';
import 'package:runner/custom_widget/search_bar.dart';
import 'package:runner/custom_widget/webview.dart';
import 'package:runner/model/seach_model.dart';

const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];
const URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();

  final bool hideLeft;
  final String searchUrl;
  final String keyWord;
  final String hint;

  SearchPage(
      {Key key, this.hideLeft, this.searchUrl = URL, this.keyWord, this.hint})
      : super(key: key);
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  String keyword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Column(
          children: <Widget>[
            _appBar(),
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                    child: ListView.builder(
                        itemCount: searchModel?.data?.length ?? 0,
                        itemBuilder: (context, position) {
                          return _item(position);
                        })))
          ],
        ));
  }

  _onTextChange(String text) {

  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 34),
            height: 88,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              hideLift: widget.hideLeft,
              defaultText: widget.keyWord,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        )
      ],
    );
  }

  Widget _item(int position) {
  if(searchModel == null || searchModel.data == null) return null;
  SearchItem item = searchModel.data[position];
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return WebView(
          url: item.url,
          title: '详情',
        );
      }));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.3,color: Colors.grey))
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(1),
            child: Image(
              height: 26,
                width: 26,
                image: AssetImage(_typeImage(item.type))),
          ),
          Column(
            children: <Widget>[
              Container(
                width: 300,
                child: _title(item),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 5),
                child: _subTitle(item),
              )
            ],
          )
        ],
      ),
    ),
  );
  }

  String _typeImage(String type) {
    if(type == null) return 'images/type_travelgroup.png';
  }

  _title(SearchItem item) {}

  _subTitle(SearchItem item) {}
}
