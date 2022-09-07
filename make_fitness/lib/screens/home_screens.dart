import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:make_fitness/database/database_service.dart';
import 'package:make_fitness/models/activity.dart';
import 'package:make_fitness/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String dropdownValue = "weight";
  String selectedTab = "All";
  buildTab(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
          elevation: 10,
          backgroundColor: Colors.redAccent,
          label: Text(
            text,
            style: textStyle(18, Colors.white, FontWeight.w700),
          )),
    );
  }

  openAddDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
          return Container(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(children: [
                Text(
                  "Add",
                  style: textStyle(28, Colors.black, FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 125,
                      height: 40,
                      child: TextFormField(
                        controller: controller,
                        style: textStyle(20, Colors.black, FontWeight.w600),
                        decoration: InputDecoration(
                            hintText:
                                dropdownValue == "weight" ? "In Kg" : "In cm",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black))),
                      ),
                    ),
                    DropdownButton(
                        hint: Text(
                          "Choose",
                          style: textStyle(18, Colors.black, FontWeight.w700),
                        ),
                        dropdownColor: Colors.grey,
                        onChanged: (value) {
                          stateSetter(
                            () {
                              dropdownValue = value.toString();
                            },
                          );
                        },
                        elevation: 5,
                        value: dropdownValue,
                        items: [
                          DropdownMenuItem(
                            value: "weight",
                            child: Text(
                              "Weight",
                              style:
                                  textStyle(18, Colors.black, FontWeight.w700),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "height",
                            child: Text(
                              "Height",
                              style:
                                  textStyle(18, Colors.black, FontWeight.w700),
                            ),
                          ),
                        ])
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                  color: Colors.redAccent,
                  iconSize: 50,
                  icon: Icon(Icons.double_arrow_rounded),
                  onPressed: () async {
                    int success = await DatabaseService.instance.addActivity({
                      DatabaseService.type: dropdownValue,
                      DatabaseService.date: DateTime.now().toString(),
                      DatabaseService.data: double.parse(controller.text),
                    });
                    print(success);
                    controller.clear();
                    Navigator.pop(context);
                  },
                )
              ]),
            ),
          );
        }));
      },
    );
  }

  late Color back = Color(0xffFBF5F5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Chip(
          backgroundColor: Colors.redAccent,
          onDeleted: () => openAddDialog(context),
          deleteIcon: Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
          label: Text(
            "Add",
            style: textStyle(22, Colors.white),
          )),
      backgroundColor: back,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text("Fitify",
                  style: textStyle(45, Colors.black, FontWeight.w600)),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    buildTab("All"),
                    buildTab("Weight"),
                    buildTab("Height")
                  ],
                ),
              ),
              FutureBuilder(
                  future: DatabaseService.instance.getActivities(selectedTab),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: CircularProgressIndicator(),
                      ));
                    }
                    List<Activity> activitylist = List.generate(,(index)=>Activity(snapshot.data[index]['id'], snapshot.data[index]['date'], snapshot.data[index]['data'], snapshot.data[index]['data']));
                    return GroupedListView<Activity,String>(
                        elements: ,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Image(
                                    width: 50,
                                    height: 50,
                                    image: AssetImage('images/height.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    "65 Kg",
                                    style: textStyle(27),
                                  ),
                                  trailing: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
