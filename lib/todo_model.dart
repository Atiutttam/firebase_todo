class TodoModel{
  String ? title;
  String ? desc;
  TodoModel({
    required this.title,
    required this.desc
});

  factory TodoModel.fromDoc(Map<String,dynamic>doc){
    return TodoModel(
        title: doc['title'],
        desc: doc['desc']);
  }

  Map<String,dynamic> toDoc(){
    return{
      "title":title,
       "desc":desc
    };
  }

}