import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));

  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id: Nat) {
    // will be the new beginning of list (.take() returns first n elmts of list)
    let listFront = List.take(notes, id);
    // will be the end of list (.drop() removes first n elmts of list)
    let listBack = List.drop(notes, id + 1);
    // concatenate the above list segments
    notes := List.append(listFront, listBack);
  };

}