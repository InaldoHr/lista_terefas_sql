import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:lista_terefas_sql/controller/tarefa_controller.dart';

class TerefaComponents extends StatefulWidget {
  const TerefaComponents({super.key, required this.title, required this.desc, required this.id});
  final int id;
  final String title;
  final String desc;

  @override
  State<TerefaComponents> createState() => _TerefaComponentsState();
}

class _TerefaComponentsState extends State<TerefaComponents> {

  TarefaController controller = TarefaController();

  void _showEditDialog(BuildContext context, int id, String title, String desc) {
    TextEditingController tituloController = TextEditingController(text: title);
    TextEditingController descController = TextEditingController(text: desc);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atualizar tarefa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tituloController,
                decoration: InputDecoration(labelText: 'titulo'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Atualizar"),
              onPressed: () {
                controller.updateTarefa(id, tituloController.text, descController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 360,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromARGB(166, 133, 133, 133), width: 2),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.desc.length > 25
                      ? widget.desc.substring(0, 20) + '...'
                      : widget.desc,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showEditDialog(context, widget.id, widget.title, widget.desc);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        CoolAlert.show(
                        context: context,
                        type: CoolAlertType.confirm,
                        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
                        cancelBtnText: "Cancelar",
                        confirmBtnColor: const Color.fromARGB(255, 9, 121, 177),
                        title: "Deletar ${widget.title}",
                        confirmBtnText: "Deletar",
                        text: "Deseja deletar esta tarefa?",
                        onConfirmBtnTap: () {
                          setState(() {
                          controller.deleteTarefa(widget.id);
                          });
                        },
                      );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

