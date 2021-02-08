class GQLMutation {
  static final String starMarkRepo = """
    mutation AddStarMutation(\$input: AddStarInput!) {
      addStar(input: \$input) {
        clientMutationId
      }
    }
""";

  static final String removeStarMarkRepo = """
    mutation RemoveStarMutation(\$input: RemoveStarInput!) {
      removeStar(input: \$input) {
        clientMutationId
      }
    }
""";
}
