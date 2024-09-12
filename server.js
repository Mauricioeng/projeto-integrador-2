const express = require('express');
const app = express();

app.use(express.static('public')); //  (HTML, CSS, JS)

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});
