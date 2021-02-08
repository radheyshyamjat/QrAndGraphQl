import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qr_based/graphql/mutation.dart';
import 'package:qr_based/graphql/queries.dart';
import 'package:qr_based/models/inputstar.dart';
import 'package:qr_based/models/repository.dart';
import 'package:qr_based/utils/size_config.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MyHomePage extends StatefulWidget {
  static double widthbl = SizeConfig.blockSizeWidth;
  static double heightbl = SizeConfig.blockSizeHeight;
  static double textSize = SizeConfig.textMultiplier;

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  double height(double height) {
    double finalHeight = (height / 6.8) * heightbl;
    return finalHeight;
  }

  double width(double width) {
    double finalWidth = (width / 4.1) * widthbl;
    return finalWidth;
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double setHeight(double height) {
    double finalHeight = (height / 6.8) * SizeConfig.blockSizeHeight;
    return finalHeight;
  }

  double setWidth(double width) {
    double finalWidth = (width / 4.1) * SizeConfig.blockSizeWidth;
    return finalWidth;
  }

  Repository repoResponse;
  String viewerName = "";
  bool _isLoading = false;

  String cameraScanResult = "";

  Future<void> _openCamera() async {
    cameraScanResult = await scanner.scan();
    setState(() {
      print("Result is$cameraScanResult");
    });
  }

  Future<void> _getRepoInfo() async {
    setState(() {
      _isLoading = true;
    });
    Repository response = await getFilms();
    print(response.message);
    print(response.isSuccess);
    setState(() {
      repoResponse = response;
      if (repoResponse != null &&
          repoResponse.isSuccess != null &&
          repoResponse.isSuccess) {
        viewerName = repoResponse.viewer.name;
      }
      if (repoResponse != null && repoResponse.isSuccess != null) {
        _isLoading = !repoResponse.isSuccess;
      } else
        _isLoading = false;
    });
  }

  Future<void> _starMarkRepo(String id, bool viewerHasStarred) async {
    setState(() {
      _isLoading = true;
    });
    StarMutation response = await starMarkMutation(id, viewerHasStarred);
    print(response.message);
    print(response.isSuccess);
    setState(() {
      if (response != null &&
          response.isSuccess != null &&
          response.isSuccess) {
        if(repoResponse!=null){
          for (var value in repoResponse.viewer.repositories.nodes) {
            if(value.id == id){
              setState(() {
                value.viewerHasStarred = !viewerHasStarred;
              });
            }
          }
        }
      }
      if (response != null && response.isSuccess != null) {
        _isLoading = !response.isSuccess;
      } else
        _isLoading = false;
    });
  }

  static Link getLink() {
    final HttpLink httpLink = HttpLink(uri: 'https://api.github.com/graphql');
    final AuthLink authLink = AuthLink(
        getToken: () => "bearer ff8f453b8ac7b9775d1723a0db85840e0221d5c8");
    return authLink.concat(httpLink);
  }

  static Future<Repository> getFilms() async {
    // final HttpLink httpLink = HttpLink(uri: 'https://graphql.org/swapi-graphql');
    Duration timeoutDuration = Duration(seconds: 30);
    Repository response = new Repository();
    GraphQLClient client = GraphQLClient(
      cache: InMemoryCache(),
      link: getLink(),
    );
    try {
      bool timeout = false;

      QueryResult result = await client
          .query(
        QueryOptions(
          documentNode: gql(GQLQuery.readFilms),
          variables: {"number_of_repos": 3},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      )
          .timeout(
        timeoutDuration,
        onTimeout: () {
          timeout = true;
          return QueryResult();
        },
      );

      if (timeout) {
        response.message = "Timed out while fetching user.";
        response.isSuccess = false;
        return response;
      }

      // Error check
      if (result.hasException || result.data == null) {
        print("Result ${result.exception.toString()}");
        if (result.exception.graphqlErrors.length == 0) return response;
        response.message = result.exception.graphqlErrors[0].message;
        response.isSuccess = false;
        return response;
      }

      print("result.data[] ${result.data.toString()}");
      Repository repo = Repository.fromJson(result.data);
      if (repo != null) {
        print("${repo?.viewer}");
        print("${repo?.viewer?.name}");
      } else
        print("Repository is null");
      response = repo;
      response.isSuccess = true;
      response.message = "Success";
      return repo;
    } catch (e) {
      response.isSuccess = false;
      print(e.toString());
    }

    return response;
  }

  static Future<StarMutation> starMarkMutation(
      String starrId, bool viewerHasStarred) async {
    Duration timeoutDuration = Duration(seconds: 30);
    StarMutation response = new StarMutation();
    GraphQLClient client = GraphQLClient(
      cache: InMemoryCache(),
      link: getLink(),
    );
    try {
      bool timeout = false;

      MutationOptions options = viewerHasStarred
          ? MutationOptions(
        documentNode: gql(GQLMutation.removeStarMarkRepo),
        variables: {
          'input': {'starrableId': starrId, 'clientMutationId': "54321"}
        },
        fetchPolicy: FetchPolicy.networkOnly,
      )
          : MutationOptions(
        documentNode: gql(GQLMutation.starMarkRepo),
        variables: {
          'input': {'starrableId': starrId, 'clientMutationId': "12345"}
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      QueryResult result = await client.mutate(options).timeout(
        timeoutDuration,
        onTimeout: () {
          timeout = true;
          return QueryResult();
        },
      );

      if (timeout) {
        response.message = "Timed out while fetching user.";
        response.isSuccess = false;
        return response;
      }

      // Error check
      if (result.hasException || result.data == null) {
        print("Result ${result.exception.toString()}");
        if (result.exception.graphqlErrors.length == 0) return response;
        response.message = result.exception.graphqlErrors[0].message;
        response.isSuccess = false;
        return response;
      }
      response = StarMutation.fromJson(result.data);
      response.isSuccess = true;
      response.message = "Success";
      return response;
    } catch (e) {
      response.isSuccess = false;
      print(e.toString());
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ModalProgressHUD(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("$cameraScanResult"),
              RaisedButton(
                onPressed: _openCamera,
                child: Text('Scan', style: TextStyle(fontSize: 20)),
              ),
              RaisedButton(
                onPressed: _getRepoInfo,
                child: Text('Get Repo Info', style: TextStyle(fontSize: 20)),
              ),
              Text('Viewer: $viewerName', style: TextStyle(fontSize: 20)),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: repoResponse != null &&
                      repoResponse.isSuccess != null &&
                      repoResponse.isSuccess &&
                      repoResponse.viewer != null &&
                      repoResponse.viewer.repositories != null &&
                      repoResponse.viewer.repositories.nodes != null &&
                      repoResponse.viewer.repositories.nodes.length > 0
                      ? repoResponse.viewer.repositories.nodes.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return repoResponse != null &&
                        repoResponse.isSuccess != null &&
                        repoResponse.isSuccess &&
                        repoResponse.viewer != null &&
                        repoResponse.viewer.repositories != null &&
                        repoResponse.viewer.repositories.nodes != null &&
                        repoResponse.viewer.repositories.nodes.length > 0
                        ? buildScreenList(
                        repoResponse.viewer.repositories.nodes[index],
                        context)
                    // ? ListTile(title: Text("Text titile"))
                        : Container(height: 0, width: 0, child: Text("Empty"));
                  },
                ),
              )
            ],
          ),
        ),
        inAsyncCall: _isLoading,
      ),
    );
  }

  Widget buildScreenList(Nodes nod, BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 24, top: 24, bottom: 24),
              child: Text(nod.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Regular',
                      color: Colors.lightBlue))),
          Spacer(),
          InkWell(
            onTap: () {
              _starMarkRepo(nod.id, nod.viewerHasStarred);
              print("Clicked on star");
            },
            child: Container(
                margin:
                EdgeInsets.only(right: 24, top: 24, bottom: 24, left: 24),
                child: nod.viewerHasStarred
                    ? new Icon(Icons.star, color: Colors.green)
                    : new Icon(Icons.star)),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.only(
    //       top: 0, bottom: 15, left: setWidth(20), right: setHeight(20)),
    //   child: GestureDetector(
    //     onTap: () {
    //       // toNavigate(context,serviceDto);
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.all(Radius.circular(8)),
    //           boxShadow: [
    //             BoxShadow(color: Colors.grey[350], blurRadius: 10.0)
    //           ]),
    //       child: Container(
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               width: setWidth(190),
    //               height: setHeight(120),
    //               child: Column(
    //                 children: <Widget>[
    //                   Align(
    //                     alignment: Alignment.topLeft,
    //                     child: Container(
    //                       padding: EdgeInsets.only(top: 5),
    //                       child: Text(
    //                         title,
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontFamily: 'Roboto-Regular',
    //                             fontSize: setHeight(16),
    //                             color: Colors.lightBlue),
    //                       ),
    //                     ),
    //                   ),
    //                   Spacer(),
    //                   Container(
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: <Widget>[
    //                         Align(
    //                           alignment: Alignment.centerLeft,
    //                           child: Container(
    //                             margin: EdgeInsets.only(top: setHeight(5)),
    //                             child: Text(address,
    //                                 style: TextStyle(
    //                                     fontWeight: FontWeight.w400,
    //                                     fontFamily: 'Roboto-Regular',
    //                                     fontSize: setHeight(12),
    //                                     color: const Color(0xff757575))),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget listViewInfo(String title, String likeText) {
    return Container(
        width: setWidth(190),
        height: setHeight(120),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Regular',
                      fontSize: setHeight(16)),
                ),
              ),
            ),
            Spacer(),
            Text(likeText)
          ],
        ));
  }
}