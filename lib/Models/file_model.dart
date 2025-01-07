class FileModel {
  final String name;
  final String path;
  final int size;
  final bool isImage;

  FileModel({
    required this.name,
    required this.path,
    required this.size,
    required this.isImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'size': size,
      'isImage': isImage,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      name: map['name'],
      path: map['path'],
      size: map['size'],
      isImage: map['isImage'],
    );
  }
}
