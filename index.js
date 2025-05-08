const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('YEAH!');
});

app.listen(8080, () => console.log('server start'));
