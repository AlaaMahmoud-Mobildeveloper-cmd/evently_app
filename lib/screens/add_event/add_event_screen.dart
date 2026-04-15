import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/StringApp.dart';
import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = '/addEvent';
   AddEventScreen({super.key});


  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> categories = [
    "Birthday",
    "Sport",
    "Book Club",
    "Exhibition",
    "Meeting"
  ];
  TextEditingController? titleController;
  TextEditingController? descriptionController ;
  bool isInit = true;
  @override
  void initState(){
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }
  int selectedCategory = 0;
  bool isLoaded = false;
  var selectedDate= DateTime.now();
  late final model = ModalRoute.of(context)!.settings.arguments as TaskModel?;
  @override
  void didChangeDependencies() {
  super.didChangeDependencies();
  if(isInit){

    if(model != null){
      titleController!.text = model!.title;
      descriptionController!.text = model!.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(model!.date);
      selectedCategory = categories.indexOf(model!.categories);
    }
    isInit = false;
  }

}
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Theme.of(context).colorScheme.primary,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(themeProvider.themeMode ==ThemeMode.light
              ? ImageApp.back
              : ImageApp.darkBack
            ,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          )
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text( "addEventButton".tr(),
          style: StyleApp.titleStyleLocalize.copyWith(
            color: Theme.of(context).colorScheme.primary,
          )
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child:isLoaded?Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: themeProvider.themeMode == ThemeMode.light?
              Image.asset("assets/images/${categories[selectedCategory]}.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.2,
                fit: BoxFit.cover,
            ):Image.asset("assets/images/${categories[selectedCategory]}dark.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) =>InkWell(
                    onTap: (){
                      selectedCategory = index;
                      setState(() {

                      });
                    },
                    child: Chip(
                        backgroundColor: selectedCategory == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Colors.transparent,

                          )
                        ),
                        label: Text(categories[index],
                          style: StyleApp.descriptionStyleLocalize.copyWith(
                            fontSize: 18,
                            color: selectedCategory == index ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
                          ),
                        )),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: categories.length),
            ),
            SizedBox(height:15),
            Text(
              "title".tr(),
              style: StyleApp.descriptionStyleLocalize.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "hint".tr(),
                hintStyle: StyleApp.descriptionStyleLocalize.copyWith(),
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,

                  ),
               ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
              ),
              style: StyleApp.descriptionStyleLocalize.copyWith(),
            ),
            SizedBox(height:15),
            Text(
             "description".tr(),
              style: StyleApp.descriptionStyleLocalize.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "hintTextDescription".tr(),
                hintStyle: StyleApp.descriptionStyleLocalize.copyWith(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,

                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
              ),
              style: StyleApp.descriptionStyleLocalize.copyWith(),
              maxLines: 5,
            ),
            SizedBox(height:15),
            Row(
              children: [
                Image.asset(ImageApp.addCalender,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Text("addDate".tr(),
                  style: StyleApp.titleStyleLocalize
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    selectedDateTime();
                    setState(() {

                    });
                  },

                  child:  Text(
                    "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                    style: StyleApp.descriptionStyleLocalize.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )


              ]
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>saveTask(model),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text( model == null
                    ? "addEventButton".tr()
                    :  "editEventButton".tr()
                  ,
                  style: StyleApp.titleStyleLocalize.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),)
              ),
            ),
          ]
        ),
      )
    );
  }
  selectedDateTime() async{
    DateTime? chosenDate = await showDatePicker(
      initialDate: DateTime.now(),
      builder: (context, child)=>Theme(data:  ThemeData(
        colorScheme: ColorScheme.light(
          primary: Theme.of(context).colorScheme.primary,
          onPrimary: Theme.of(context).colorScheme.onPrimary,
          surface: Theme.of(context).colorScheme.surface,
          onSurface: Theme.of(context).colorScheme.onSurface,
        ),), child: child!) ,
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),


    );
    if(chosenDate !=null){
      selectedDate = chosenDate;
      setState(() {

      });
    }
  }
  void saveTask(TaskModel? oldTask) async{
    if (titleController!.text.isEmpty || descriptionController!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }
    TaskModel task = TaskModel(
      id: oldTask?.id ?? "",
      title: titleController!.text,
      description: descriptionController!.text,
      date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
      userId: FirebaseAuth.instance.currentUser?.uid ?? "",
      categories: categories[selectedCategory],
    );

    try{
      if(oldTask == null){
        isLoaded=true;
        setState(() {});
        await FirebaseFunction.createTask(task);
      }else{
        isLoaded=true;
        setState(() {});
        await FirebaseFunction.updateTask(task);
      }

      Navigator.pop(context);
    }catch(e){
      isLoaded=false;
      setState(() {});
      print("Error saving task: $e");
    }
  }

}
