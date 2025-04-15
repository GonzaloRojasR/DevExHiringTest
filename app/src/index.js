const express = require("express");
const app = express();

app.get("/desafio", (req, res) => {
  res.send("¡Hola Mundo!");
});

if (require.main === module) {
  const port = process.env.PORT || 3000;
  app.listen(port, () => {
    console.log("Servidor corriendo en http://localhost:${port}");
  });
}

module.exports = app;