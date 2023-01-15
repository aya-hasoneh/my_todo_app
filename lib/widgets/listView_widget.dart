import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo_model.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/widgets/todo_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =Provider.of<HomeProvider>(context);
    final todos = homeProvider.todo;
    return
      todos.isEmpty ?
          Lottie.network('https://assets2.lottiefiles.com/packages/lf20_ndj9fzcd.json')
          :
      Container(
      height: MediaQuery.of(context).size.height/2,
      child: ListView.builder(itemCount: todos.length,itemBuilder: (context,index){
      final todo = todos[index];
      return ToDo(todo: todo);},),);
  }
}
