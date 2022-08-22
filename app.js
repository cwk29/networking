const express = require("express");
const { graphqlHTTP } = require("express-graphql");
const app = express();

app.use(
  "/graphql",
  graphqlHTTP({
    schema: MyGraphQLSchema,
    graphiql: true,
  })
);
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
