/*
 * Jesseframework - Computer Expertz Ltd - https://cpxz.us
 * Copyright (C) 2019-2021 Jesseframework
 *
 * This file is part of Jesseframework - https://github.com/jesseframework/j3.
 *
 * Jesseframework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version. 
 *
 * Jesseframework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 */

part of 'bloc_bloc.dart';

abstract class BlocState extends Equatable {
  const BlocState();
}

class BlocInitial extends BlocState {
  @override
  List<Object> get props => [];
}

class ShowSearchResult extends BlocState {
  final String searchCommand;
  const ShowSearchResult({required this.searchCommand});

  @override
  List<Object> get props => [searchCommand];

  @override
  String toString() => 'ShowSearchResult { searchCommand: $searchCommand }';
}
