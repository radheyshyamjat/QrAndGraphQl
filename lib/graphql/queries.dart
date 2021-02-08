class GQLQuery {
  static final String readFilms = """
    query(\$number_of_repos:Int!) {
      viewer {
        name
          repositories(last: \$number_of_repos) {
            nodes {
              name
              id
              viewerHasStarred
            }
          }
      }
    }
""";
}
