import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///Item Position
///
///Represents a position where a checkpoint can be
class ItemPosition extends Equatable {
  ///Default constructor
  const ItemPosition({@required this.col, @required this.row});

  ///Column position
  final int col;

  ///Row position
  final int row;

  @override
  List<Object> get props => [col, row];
}
