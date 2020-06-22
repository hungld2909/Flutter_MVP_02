import 'package:MVP_flutter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:MVP_flutter/presenter/presenter.dart';
import 'package:MVP_flutter/view/view.dart';
class MyHomePage extends StatefulWidget {
  final String title;
  final AppPresenter presenter; //! import presenter
  const MyHomePage(this.presenter,{Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();


}
//todo: sau khi import thành công thì chuyển sang implements AppView
//! nhiệm vụ của nó là cập nhật lại class: MyHomePage()
class _MyHomePageState extends State<MyHomePage> implements AppView {
  AppModel _appModel; //! import Model 
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _appModel.controller1, //! after import model call controller
            ),
            TextField(
              controller: _appModel.controller2, //! after import model call controller
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => this.widget.presenter.buttonClick(), //! bắt sự kiện khi click vào button
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Result:  ${_appModel.result}", //! kết quả hiện thị trên màn hình
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void refreshData(AppModel model) {
    setState(() { //! sử dụng setState để bắt sự kiện thay đổi trạng thái.
      this._appModel = model;
    });
  }
  @override
  void initState() {
    super.initState();
    this.widget.presenter.view = this;
  }
}
