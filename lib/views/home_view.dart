// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lista_terefas_sql/controller/tarefa_controller.dart';
import 'package:lista_terefas_sql/model/bd.dart';
import 'package:lista_terefas_sql/views/components/espacamento.dart';
import 'package:lista_terefas_sql/views/components/tarefa_component.dart';
import 'package:cool_alert/cool_alert.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    final bd = Bd.instance;
    final tarefas = await bd.getTarefas();
    setState(() {
      _tarefas = tarefas;
    });
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 9, 121, 177),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          //chamar modal de adicionar tarefa
          Navigator.pushNamed(context, "/addTarefa");
        },
      ),
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: const Color.fromARGB(255, 9, 121, 177),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Tarefas de hoje:",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              
              ListView.builder(        
                physics: NeverScrollableScrollPhysics(),
                                                     
                shrinkWrap: true,
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onDoubleTap: () {
                     setState(() {
                       
                     });
                    },

                    child: TerefaComponents(
                      id: _tarefas[index]['id'],
                      title: _tarefas[index]['titulo_tarefas'],
                      desc: _tarefas[index]['desc_tarefas'],
                    ),
                  );
                },
              ),
              Espacamento()
          
            ],
          ),
        ),
      ),
    );
  }
}
