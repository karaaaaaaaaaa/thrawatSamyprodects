class ChatsModel {
  late String text;
  // late String Datetime;
  // late String ReseverId;
  late String id;
  ChatsModel({
    // required this.Datetime,
    required this.text,
    // required this.ReseverId,
    required this.id,
  });
  ChatsModel.FromJson( json) {
    text = json['message'];
    // Datetime = json['Datetime'];
    // ReseverId = json['ReseverId'];
    id = json['id'];
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'text': text,
  //   //   'Datetime': Datetime,
  //   //   'ReseverId': ReseverId,
  //   //   'SenderId': SenderId,
  //    };
  // }
}
