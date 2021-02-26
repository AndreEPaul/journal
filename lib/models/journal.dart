import 'package:journal/models/journal_entry.dart';

class Journal {
  List<JournalEntry> entries;

  addEntry(JournalEntry newEntry) {
    entries.add(newEntry);
  }

  bool isEmpty() {
    return entries.isEmpty;
  }

  Journal(this.entries);
}
