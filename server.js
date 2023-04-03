const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'));

// 로그인 페이지
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/login.html');
  });

app.post('/login', (req, res) => {
  const { username, password } = req.body;
  
  // 로그인 로직 처리

  res.send('Logged in!');
});

app.listen(port, () => {
  console.log('Server is running on port ${port}');
});