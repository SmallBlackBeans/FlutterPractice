import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBarState();
  }

  final bool hideLift;
  final bool enabled;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.hideLift,
      this.enabled,
      this.searchBarType,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);
}

class _SearchBarState extends State<SearchBar> {

  bool showClear = false;
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.defaultText != null) {
      setState(() {
        _editingController.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.searchBarType == SearchBarType.normal
    ? _getNormalSearch()
    : _getHomeSearch();
  }

  _getNormalSearch() {}

  _getHomeSearch() {}
}
