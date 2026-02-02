import '../../domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({required super.text});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(text: json['text']);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}
