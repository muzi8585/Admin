enum SearchOption {
  projects,
  tasks,
  files,
}

extension SearchOptionExtension on SearchOption {
  String get label {
    switch (this) {
      case SearchOption.projects:
        return 'Projects';
      case SearchOption.tasks:
        return 'Tasks';
      case SearchOption.files:
        return 'Files';
    }
  }
}