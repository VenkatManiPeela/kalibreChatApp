import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/components/my_text_feild.dart';
import 'package:chatapp/service/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiveUserEmail;
  final String receiveUserId;
  const ChatPage({
    super.key,
    required this.receiveUserEmail, 
    required this.receiveUserId
    });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  void sendMessage() async{
    if (_messageController.text.isNotEmpty){
      await _chatService.sendMassage(widget.receiveUserId, _messageController.text);
      _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiveUserEmail),
      ),
      body: Column(children: [
        Expanded(child: _buildMessageList(),
        ),
          _buildMessageInput(),
            const SizedBox(height: 25,),

      ]),
    );
  }

 Widget _buildMessageList(){
    return  StreamBuilder(
      stream: _chatService.getMessages(
        widget.receiveUserId, _firebaseAuth.currentUser!.uid),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return  Text("error${snapshot.error}");
        }
        if ( snapshot.connectionState == ConnectionState.waiting){
          return const Text("loading");
        }
        return ListView(
          children: snapshot.data!.docs
          .map<Widget>((doc)=> _buildMessageItem(doc))
          .toList(),
        );
      },
    );
   }

  Widget _buildMessageItem (DocumentSnapshot document){
      Map<String,dynamic> data = document.data()! as Map<String,dynamic>;

      var alignment=(data['senderId']== _firebaseAuth.currentUser!.uid)
      ?Alignment.centerRight
      :Alignment.centerLeft;
      
      return Container(
        alignment: alignment,
        child:Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (
            data['senderId']== _firebaseAuth.currentUser!.uid) 
            ? CrossAxisAlignment.end 
            : CrossAxisAlignment.start,
            mainAxisAlignment: (data['senderId']== _firebaseAuth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            const SizedBox(height: 5,),
            ChatBubble(message: data['message']),
            ],
          ),
        ),
      );

  }
  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(child: MyTextField(
          controller: _messageController,
          hintText: "Enter Message",
          obscureText: false,
        ),
        ),

        IconButton(
          onPressed: sendMessage, 
          icon:const Icon(Icons.arrow_upward,size: 40,
          ),
        ),
      ],
    );
  }
}