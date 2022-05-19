import 'dart:collection';
import 'dart:core' as core;
import 'dart:core';

/// A stack data structure
///
/// From:
/// https://github.com/ammaratef45/dart_stack
class Stack<T> {
  final ListQueue<T> _list = ListQueue();

  /// check if the stack is empty.
  bool get isEmpty => _list.isEmpty;

  /// check if the stack is not empty.
  bool get isNotEmpty => _list.isNotEmpty;

  /// push element in top of the stack.
  void push(T e) {
    _list.addLast(e);
  }

  /// get the top of the stack and delete it.
  T pop() {
    final res = _list.last;
    _list.removeLast();
    return res;
  }

  /// get the top of the stack without deleting it.
  T top() {
    return _list.last;
  }

  /// get the size of the stack.
  int size() {
    return _list.length;
  }

  /// get the length of the stack.
  int get length => size();

  /// returns true if element is found in the stack
  bool contains(T x) {
    for (var item in _list) {
      if (x == item) {
        return true;
      }
    }
    return false;
  }

  /// print stack
  void print() {
    for (var item in List<T>.from(_list).reversed) {
      core.print(item);
    }
  }
}
