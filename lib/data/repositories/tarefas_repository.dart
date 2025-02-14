import 'package:tarefas/core/database_helper.dart';
import 'package:tarefas/data/models/tarefas_model.dart';

class TarefasRepository {
  final String collection = 'tarefas';

  Future<void> insertTarefa(Tarefa tarefa) async {
    await DatabaseHelper.addDocument(collection, tarefa.toMap());
  }

  Future<List<Tarefa>> getTarefa() async {
    List<Map<String, dynamic>> tarefaMaps =
        await DatabaseHelper.getDocuments(collection);
    return tarefaMaps.map((map) {
      return Tarefa(
        nome: map['nome'],
        descricao: map['descricao'] ?? '',
        dataInicio: map['dataInicio'],
        dataFim: map['dataFim'],
      );
    }).toList();
  }

  Future<void> updateTarefa(String id, Tarefa tarefa) async {
    await DatabaseHelper.updateDcument(collection, id, tarefa.toMap());
  }

  Future<void> deleteTarefa(String id) async {
    await DatabaseHelper.deleteDocument(collection, id);
  }
}
