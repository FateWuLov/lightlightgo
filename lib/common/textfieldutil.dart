import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

///
/// Helper class that ensures a Widget is visible when it has the focus
/// For example, for a TextFormField when the keyboard is displayed
///
/// 使用方法:
///
/// In the class that implements the Form,
///   Instantiate a FocusNode
///   FocusNode _focusNode = new FocusNode();
///
/// In the build(BuildContext context), wrap the TextFormField as follows:
///
///   new EnsureVisibleWhenFocused(
///     focusNode: _focusNode,
///     child: new TextFormField(
///       ...
///       focusNode: _focusNode,
///     ),
///   ),
///
/// Initial source code written by Collin Jackson.
/// Extended (see highlighting) to cover the case when the keyboard is dismissed and the
/// user clicks the TextFormField/TextField which still has the focus.
///
class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    required Key key,
    required this.child,
    required this.focusNode,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  /// The node we will monitor to determine if the child is focused
  ///传入FocusNode，用于监听TextField获取焦点事件
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  _EnsureVisibleWhenFocusedState createState() => new _EnsureVisibleWhenFocusedState();
}

///
/// We implement the WidgetsBindingObserver to be notified of any change to the window metrics
///实现WidgetsBindingObserver接口，监听屏幕矩阵变化事件
class _EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> with WidgetsBindingObserver  {

  @override
  void initState(){
    super.initState();
    widget.focusNode.addListener(_ensureVisible);  ///监听焦点事件
    WidgetsBinding.instance.addObserver(this);      ///监听屏幕矩阵是否发生变化
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode.removeListener(_ensureVisible);
    super.dispose();
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  /// This happens when the keyboard is open or dismissed, among others.
  /// It is the opportunity to check if the field has the focus
  /// and to ensure it is fully visible in the viewport when
  /// the keyboard is displayed
  ///屏幕矩阵发生变化时系统调用，如键盘弹出或是收回
  @override
  void didChangeMetrics(){
    super.didChangeMetrics();
    if (widget.focusNode.hasFocus){ ///有焦点时，进入滑动显示处理Function
      _ensureVisible();
    }
  }

  ///
  /// This routine waits for the keyboard to come into view.
  /// In order to prevent some issues if the Widget is dismissed in the
  /// middle of the loop, we need to check the "mounted" property
  ///
  /// This method was suggested by Peter Yuen (see discussion).
  ///等待键盘显示在屏幕上
  Future<Null> _keyboardToggled() async {
    if (mounted){
      EdgeInsets edgeInsets = MediaQuery.of(context).viewInsets;
      while (mounted && MediaQuery.of(context).viewInsets == edgeInsets) {
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }

    return;
  }

  Future<Null> _ensureVisible() async {
    // Wait for the keyboard to come into view
    await Future.any([Future.delayed(const Duration(milliseconds: 300)), _keyboardToggled()]);

    // No need to go any further if the node has not the focus
    if (!widget.focusNode.hasFocus){
      return;
    }
    // Find the object which has the focus
    //找到Current RenderObjectWidget，获得当前获得焦点的widget，这里既TextField
    final RenderObject? object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);

    // If we are not working in a Scrollable, skip this routine
    if (viewport == null) {
      return;
    }

    // Get the Scrollable state (in order to retrieve its offset)
    //获取滑动状态，目的是为了获取滑动的offset
    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    // Get its offset
    ScrollPosition position = scrollableState.position;
    double alignment;

    ///这里需要解释下
    ///1、position.pixels是指滑动widget，滑动的offset（一般指距离顶部的偏移量(滑出屏幕多少距离)）
    ///2、viewport.getOffsetToReveal(object, 0.0).offset 这个方法，可以看下源码
    ///      他有一个alignment参数，0.0 代表显示在顶部，0.5代表显示在中间，1.0代表显示在底部
    ///       offset是指view显示在三个位置时距离顶部的偏移量
    ///       他们两者相比较就可以知道当前滑动widget是需要向上还是向下滑动，来完全显示TextField

    ///判断TextField处于顶部时是否全部显示，需不需下滑来完整显示
    if (position.pixels > viewport.getOffsetToReveal(object!, 0.0).offset) {
      // Move down to the top of the viewport
      alignment = 0.0;
      ///判断TextField处于低部时是否全部显示，需不需上滑来完整显示
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset){
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }

    //这是ScrollPosition的内部方法，将给定的view 滚动到给定的位置，
    //alignment的意义和上面描述的一致， 三种位置顶部，底部，中间
    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}