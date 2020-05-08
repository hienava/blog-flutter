import 'package:blog/src/models/blog_model.dart';
import 'package:blog/src/providers/blog_provider.dart';
import 'package:rxdart/rxdart.dart';




class BlogsBloc {

  final _blogsController = new BehaviorSubject<List<BlogModel>>();
  final _cargandoController  = new BehaviorSubject<bool>();

  final _blogProvider   = new BlogProvider();


  Stream<List<BlogModel>> get blogsStream => _blogsController.stream;
  Stream<bool> get cargando => _cargandoController.stream;



  void cargarBlogs() async {

    final blogs = await _blogProvider.cargarBlogs();
    _blogsController.sink.add( blogs );
  }




  dispose() {
    _blogsController?.close();
    _cargandoController?.close();
  }

}