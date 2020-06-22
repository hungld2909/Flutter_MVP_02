import 'package:MVP_flutter/model/model.dart';
import 'package:MVP_flutter/view/view.dart';

class AppPresenter{
  set view(AppView value){}
  void buttonClick(){} //! khởi tạo buttonClick
}
//! khởi tạo lớp BasicAppPresenter
class BasicAppPresenter implements AppPresenter{
  AppModel _model; //! import model
  AppView _view;  //! import View

  BasicAppPresenter(){
    this._model = AppModel(); //! _model chứa đầy AppModel().
    //! nó sẽ yêu cầu dữ liệu mới nhất từ set View. sau đó cập nhật vào model
  }
  //! sau đó cập nhật class
  @override
  void set view(AppView value) {
   _view = value;
   this._view.refreshData(this._model);  //! model này sẽ chứa 1 model mới
  }
  @override
  void buttonClick() {
  int v1 = int.parse(this._model.controller1.text);
  int v2 = int.parse(this._model.controller2.text);
  this._model.result = v1+v2; //! bắt sự kiện
  this._view.refreshData(this._model); //! đẩy dữ liệu lên view và hiện thị ra màn hình
  }


}