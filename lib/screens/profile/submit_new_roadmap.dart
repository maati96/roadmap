// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SubmitNewRoadmap extends StatefulWidget {
//   @override
//   _SubmitNewRoadmapState createState() => _SubmitNewRoadmapState();
// }

// class _SubmitNewRoadmapState extends State<SubmitNewRoadmap> {
//   final submitController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String _fileName;
//   List<PlatformFile> _paths;
//   String _directoryPath;
//   String _extension;
//   bool _loadingPath = false;
//   bool _multiPick = false;
//   FileType _pickingType = FileType.any;

//   List<String> _items = [];
//   void _addItem(value) {
//     setState(() {
//       _items.add(value);
//     });
//   }

//   void _removeItem(index) {
//     setState(() {
//       _items.removeAt(index);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     submitController.addListener(() => _extension = submitController.text);
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     submitController.dispose();
//     super.dispose();
//   }

//   void _openFileExplorer() async {
//     setState(() => _loadingPath = true);
//     try {
//       _directoryPath = null;
//       _paths = (await FilePicker.platform.pickFiles(
//         type: _pickingType,
//         allowMultiple: _multiPick,
//         allowedExtensions: (_extension?.isNotEmpty ?? false)
//             ? _extension?.replaceAll(' ', '')?.split(',')
//             : null,
//       ))
//           ?.files;
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     } catch (ex) {
//       print(ex);
//     }
//     if (!mounted) return;
//     setState(() {
//       _loadingPath = false;
//       _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text("Submit New Roadmap"),
//       ),
//       body: _buildList(),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Add Roadmap',
//         onPressed: _pushAddItemScreen,
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildNoItem() {
//     return Center(
//       child: Text(
//         "Nothing here yet!",
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }

//   Widget _buildList() {
//     if (_items.length == 0) {
//       return _buildNoItem();
//     }

//     return ListView.builder(
//       // ignore: missing_return
//       itemBuilder: (context, index) {
//         if (index < _items.length) {
//           var item = _items[index];
//           return _buildItem(item, index);
//         }
//       },
//     );
//   }

//   Widget _buildItem(String text, int index) {
//     return Container(
//       height: 150,
//       child: Card(
//         color: Colors.green,
//         child: Row(
//           children: [
//             Expanded(
//               flex: 66,
//               child: Row(
//                 children: [
//                   Expanded(flex: 30, child: Text(text)),
//                   Expanded(
//                     flex: 20,
//                     child: ListTile(
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           _removeItem(index);
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _pushAddItemScreen() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text("add an roadmap"),
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: submitController,
//                       autofocus: true,
//                       decoration: InputDecoration(
//                         icon: IconButton(
//                           icon: Icon(Icons.image),
//                           onPressed: () => _openFileExplorer(),
//                         ),
//                         hintText: 'add roadmap name',
//                         contentPadding: EdgeInsets.all(15),
//                       ),
//                       onSubmitted: (value) {
//                         _addItem(value);
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   DropdownButton(
//                     hint: Text('LOAD PATH FROM'),
//                     value: _pickingType,
//                     items: <DropdownMenuItem>[
//                       DropdownMenuItem(
//                         child: Text('FROM AUDIO'),
//                         value: FileType.audio,
//                       ),
//                       DropdownMenuItem(
//                         child: Text('FROM IMAGE'),
//                         value: FileType.image,
//                       ),
//                       DropdownMenuItem(
//                         child: Text('FROM VIDEO'),
//                         value: FileType.video,
//                       ),
//                       DropdownMenuItem(
//                         child: Text('FROM MEDIA'),
//                         value: FileType.media,
//                       ),
//                       DropdownMenuItem(
//                         child: Text('FROM ANY'),
//                         value: FileType.any,
//                       ),
//                       DropdownMenuItem(
//                         child: Text('CUSTOM FORMAT'),
//                         value: FileType.custom,
//                       ),
//                     ],
//                     onChanged: (value) => setState(() {
//                       _pickingType = value;
//                       if (_pickingType != FileType.custom) {
//                         submitController.text = _extension = '';
//                       }
//                     }),
//                   ),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints.tightFor(width: 100.0),
//                     child: _pickingType == FileType.custom
//                         ? TextFormField(
//                             maxLength: 15,
//                             autovalidateMode: AutovalidateMode.always,
//                             controller: submitController,
//                             decoration:
//                                 InputDecoration(labelText: 'File extension'),
//                             keyboardType: TextInputType.text,
//                             textCapitalization: TextCapitalization.none,
//                           )
//                         : const SizedBox(),
//                   ),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints.tightFor(width: 200.0),
//                     child: SwitchListTile.adaptive(
//                       title: Text('Pick multiple files',
//                           textAlign: TextAlign.right),
//                       onChanged: (bool value) =>
//                           setState(() => _multiPick = value),
//                       value: _multiPick,
//                     ),
//                   ),
//                   Builder(
//                     builder: (BuildContext context) => _loadingPath
//                         ? Padding(
//                             padding: const EdgeInsets.only(bottom: 10.0),
//                             child: const CircularProgressIndicator(),
//                           )
//                         : _directoryPath != null
//                             ? ListTile(
//                                 title: Text('Directory path'),
//                                 subtitle: Text(_directoryPath),
//                               )
//                             : _paths != null
//                                 ? Container(
//                                     padding:
//                                         const EdgeInsets.only(bottom: 30.0),
//                                     height: MediaQuery.of(context).size.height *
//                                         0.50,
//                                     child: Scrollbar(
//                                         child: ListView.separated(
//                                       itemCount:
//                                           _paths != null && _paths.isNotEmpty
//                                               ? _paths.length
//                                               : 1,
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         final bool isMultiPath =
//                                             _paths != null && _paths.isNotEmpty;
//                                         final String name = 'File $index: ' +
//                                             (isMultiPath
//                                                 ? _paths
//                                                     .map((e) => e.name)
//                                                     .toList()[index]
//                                                 : _fileName ?? '...');
//                                         final path = _paths
//                                             .map((e) => e.path)
//                                             .toList()[index]
//                                             .toString();

//                                         return ListTile(
//                                           title: Text(
//                                             name,
//                                           ),
//                                           subtitle: Text(path),
//                                         );
//                                       },
//                                       separatorBuilder:
//                                           (BuildContext context, int index) =>
//                                               const Divider(),
//                                     )),
//                                   )
//                                 : const SizedBox(),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
