import 'package:flutter/material.dart';

class AppBarSearch {
  AppBarSearch({
    @required this.state,
    this.title,
    this.hintText = "بحث...",
    this.onPressed,
    this.controller,
    this.onSubmitted,
    this.onEditingComplete,
  }) {
    //
    title ??= Text("بحث ...");

    _hintText = hintText;

    _onPressed = onPressed ?? _pressedFunc;

    _appBarTitle = GestureDetector(
      child: title,
      onTap: _onPressed,
    );

    // title is now a GestureDetector widget.
    title = _appBarTitle;

    _onSubmitted = onSubmitted;

    _onEditingComplete = onEditingComplete;

    _icon = Icon(Icons.search);

    _textController = controller ?? TextEditingController();

    // Flag indicating user tapped to initiate search.
    _wasPressed = false;
  }
  final State state;
  Widget title;
  final String hintText;
  final VoidCallback onPressed;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onEditingComplete;

  Widget _appBarTitle;
  String _hintText;
  VoidCallback _onPressed;
  TextEditingController _textController;
  ValueChanged<String> _onSubmitted;
  VoidCallback _onEditingComplete;

  Icon _icon;
  bool _wasPressed;

  IconButton get searchIcon => IconButton(
        icon: _icon,
        onPressed: _onPressed,
      );

  Widget onTitle(Widget title) {
    // title already defined.
    if (_wasPressed) return this.title;

    if (title != null && title is! GestureDetector) {
      _appBarTitle = GestureDetector(
        child: title,
        onTap: _onPressed,
      );
    }
    return _appBarTitle;
  }

  IconButton onSearchIcon({
    String hintText,
    TextEditingController controller,
    ValueChanged<String> onSubmitted,
    VoidCallback onEditingComplete,
  }) {
    if (hintText != null) _hintText = hintText;
    if (controller != null) _textController = controller;
    if (onSubmitted != null) _onSubmitted = onSubmitted;
    if (onEditingComplete != null) _onEditingComplete = onEditingComplete;
    return searchIcon;
  }

  void _pressedFunc() {
    _wasPressed = true;
    if (_icon.icon == Icons.search) {
      _icon = Icon(Icons.close);
      title = TextField(
        controller: _textController,
        textInputAction: TextInputAction.search,
        onSubmitted: _submitFunc,
        onEditingComplete: _onEditingComplete,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: _hintText,
        ),
      );
    } else {
      _icon = Icon(Icons.search);
      title = _appBarTitle;
      _textController.clear();
    }
    // Display the change in the app's title
    // state.setState(() {});
  }

  void _submitFunc(String value) {
    _pressedFunc();
    if (_onSubmitted != null) {
      _onSubmitted(value);
    } else if (onSubmitted != null) onSubmitted(value);
  }

  static AppBar appBarBase(String title) {
    return AppBar(
      title: Text(title),
      flexibleSpace: PreferredSize(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],color: Colors.yellow

//              gradient: LinearGradient(
//                List: [Color(0xFFDD4B39), Color(0xFFFD8176)],
////                colors: [Color(0xFFDD4B39), Color(0xFFFD8176)],
//                begin: Alignment.centerLeft,
//                end: Alignment.centerRight,
//              )
          ),
        ),
        preferredSize: Size(double.infinity, 56),
      ),
    );
  }
}
