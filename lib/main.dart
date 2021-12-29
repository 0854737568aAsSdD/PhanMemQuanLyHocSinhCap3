import 'package:flutter/material.dart';
import 'package:ogrencibilgisistemi/models/student.dart';
import 'package:ogrencibilgisistemi/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Đỗ Minh Tuấn", "Giỏi", 9),
    Student.withId(2, "Phan Văn Phong", "Khá", 7),
    Student.withId(3, "Nguyễn Anh Văn", "Khá", 6),
    Student.withId(4, "Phan Văn Anh Quôc", "Khá", 5),
    Student.withId(5, "Nguyễn Thanh Hùng", "Khá", 8),
    Student.withId(6, "Đỗ Tiến Quân", "Khá", 9),
    Student.withId(7, "Phạm Hữu Phong", "Khá", 10),
    Student.withId(8, "Phan Thái Sơn", "Khá", 6),
    Student.withId(9, "Trần Công Giàu", "Khá", 7),
  ];
  Student selectedStudent = Student.withId(0, "Đỗ Minh Tuấn", "Giỏi", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Quản lý học bạ học sinh cấp 3"),
            backgroundColor: Colors.blueAccent),
        body: buildBody());
  }
  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      students[index].firstName +
                          " " +
                          students[index].lastName,
                      style: TextStyle(color: Colors.deepOrange)),
                  subtitle: Text(
                      "Điểm trung bình môn :  " +
                          students[index].grade.toString(),
                      style: TextStyle(color: Colors.amberAccent)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5TQis6uDMi1qPX7FVVjZqsgMtAGvEmTOUVA&usqp=CAU"),
                  ),
                  trailing: bulidStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });

                  },
                  onLongPress: () {
                    print("Uzun basildi.");
                  },
                  //Icon(Icons.done),
                );
                //Text(students[index].firstName);
              }),
        ),
        Text(
          "Thông tin chính xác  : " +
              selectedStudent.firstName +
              ", Học lực :"
              " " +
              selectedStudent.lastName,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Thêm mới học sinh",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)),).then((res) => setState((){}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Cập nhật học sinh",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  print("Guncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Xóa một học sinh",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  students.remove(selectedStudent);
                  setState((){});
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget bulidStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade > 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

