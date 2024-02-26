
import 'package:flutter/material.dart';
import '../Streaming/streaming_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final streamingRoomID = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final regExp = RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='"'"']');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.withOpacity(.5),
        title: const Text('Live Streaming', style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.video_call_rounded, size: 50, color: Colors.redAccent,),
                )
              ),
              SizedBox(
                width: width,
                child: const Text(
                  'Test with two or more devices',
                  style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                  key: formKey,
                  child: TextFormField(
                maxLength: 6,
                controller: streamingRoomID,
                keyboardType: TextInputType.number,
                validator: (val){
                  if(val.toString().isEmpty){
                    return 'Enter ID';
                  }
                  else if(val.toString().contains(regExp)){
                    return 'Enter Digits only';
                  }
                  else if(val.toString().length > 6 || val.toString().length < 6){
                    return 'Must contain 6 digits';
                  }
                  else if(val.toString().contains(" ")){
                    return 'Spaces are not allowed';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Enter ID'),
                  hintText: 'Enter ID',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 50,
                width: width * .7,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  enableFeedback: false,
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      debugPrint(streamingRoomID.text.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LivePage(
                        liveID: streamingRoomID.text.toString(),
                        isHost: true,
                      )));
                    }
                  },
                  child: const Center(child: Text('Start Streaming', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ))),
                )
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  width: width * .7,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    enableFeedback: false,
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        debugPrint(streamingRoomID.text.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LivePage(
                          liveID: streamingRoomID.text.toString(),
                        )));
                      }
                    },
                    child: const Center(child: Text('Join Streaming', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ))),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
