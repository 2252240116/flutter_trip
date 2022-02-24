import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final String city;
  final bool enabled;
  final bool? hideLeft;
  final bool autofocus;
  final SearchBarType? searchBarType;
  final String? hint; // 默认提示文案
  final String defaultText;

  ///暴露点击事件
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;

  //自定义TextField监听方法  暴露出去
  final ValueChanged<String> onChanged;

  const SearchBar({
    Key? key,
    required this.city,
    this.enabled = true,
    this.hideLeft,
    this.autofocus = false,
    this.searchBarType = SearchBarType.normal,
    this.hint,
    required this.defaultText,
    required this.leftButtonClick,
    required this.rightButtonClick,
    required this.speakClick,
    required this.inputBoxClick,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  //是否显示清除按钮
  bool showClear = false;
  //相当于edittext控制器
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch
        : _genHomeSearch;
  }

  Widget get _genHomeSearch {
    return Container(
      child: Row(
        children: [
          //city
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.city,
                    style: TextStyle(
                      color: _homeFontColor,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: _homeFontColor,
                    size: 22,
                  ),
                ],
              ),
            ),
            widget.leftButtonClick,
          ),
          // 搜索
          Expanded(
            flex: 1,
            child: _inputBox,
          ),
          // 消息
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(
                Icons.comment,
                color: _homeFontColor,
                size: 26,
              ),
            ),
            widget.rightButtonClick,
          ),
        ],
      ),
    );
  }

  /// 带点击tap的widget简单封装
  Widget _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: child,
    );
  }

  Widget get _inputBox {
    //初始化搜索输入框的颜色
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      //Container BoxDecoration 做圆角
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        children: <Widget>[
          //搜索icon
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffa9a9a9)
                : Colors.blue,
          ),
          //input
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
              controller: _controller,
              onChanged: _onChanged,
              autofocus: widget.autofocus,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 5,
                  bottom: 14,
                  right: 5,
                ),
                border: InputBorder.none,
                hintText: widget.hint ?? '',
                hintStyle: TextStyle(fontSize: 15),
              ),
            )
                : _wrapTap(
              Container(
                child: Text(
                  widget.defaultText,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              widget.inputBoxClick,
            ),
          ),
          //语音按钮or清除按钮
          !showClear
              ? _wrapTap(
            Icon(
              Icons.mic,
              size: 22,
              color: widget.searchBarType == SearchBarType.normal
                  ? Colors.blue
                  : Colors.grey,
            ),
            widget.speakClick,
          )
              : _wrapTap(
            Icon(
              Icons.clear,
              size: 22,
              color: Colors.grey,
            ),
                () {
              setState(() {
                _controller.clear();
              });
              _onChanged('');
            },
          ),
        ],
      ),
    );
  }

  // 输入框内容改变
  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    widget.onChanged(text);
  }

  Color get _homeFontColor {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }

  Widget get _genNormalSearch {
    return Container(
      child: Row(
        children: [
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: widget.hideLeft ?? false
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 26,
                    ),
            ),
            widget.leftButtonClick,
          ),
          Expanded(
            flex: 1,
            child: _inputBox,
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

}
