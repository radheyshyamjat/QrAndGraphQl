class Repository {
  Viewer viewer;
  bool isSuccess;
  String message;

  Repository({this.viewer,this.isSuccess,this.message});

  Repository.fromJson(Map<String, dynamic> json) {
    viewer = json['viewer'] != null ? new Viewer.fromJson(json['viewer']) : null;
    isSuccess = json['is_success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viewer != null) {
      data['viewer'] = this.viewer.toJson();
    }
    data['is_success'] = isSuccess;
    data['message'] = this.message;
    return data;
  }
}

class Viewer {
  String name;
  Repositories repositories;

  Viewer({this.name, this.repositories});

  Viewer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    repositories = json['repositories'] != null
        ? new Repositories.fromJson(json['repositories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.repositories != null) {
      data['repositories'] = this.repositories.toJson();
    }
    return data;
  }
}

class Repositories {
  List<Nodes> nodes;

  Repositories({this.nodes});

  Repositories.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = new List<Nodes>();
      json['nodes'].forEach((v) {
        nodes.add(new Nodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodes != null) {
      data['nodes'] = this.nodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nodes {
  String id;
  String name;
  bool viewerHasStarred;

  Nodes({this.id,this.name,this.viewerHasStarred});

  Nodes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    viewerHasStarred = json['viewerHasStarred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['viewerHasStarred'] = this.viewerHasStarred;
    return data;
  }
}