const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const bcrypt = require('bcrypt');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// Create connection to MySQL database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // use your MySQL username
  password: 'shiper', // use your MySQL password
  database: 'flutter_auth'
});

// Connect to the database
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});

// Register user
app.post('/register', (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  const confirmPassword = req.body.confirmPassword;

  if (password !== confirmPassword) {
    return res.status(400).send('Passwords do not match');
  }

  bcrypt.hash(password, 10, (err, hash) => {
    if (err) {
      return res.status(500).send('Server error');
    }

    const sql = 'INSERT INTO users (email, password) VALUES (?, ?)';
    db.query(sql, [email, hash], (err, result) => {
      if (err) {
        return res.status(500).send('Server error');
      }
      res.status(200).send('User registered');
    });
  });
});

// Login user
app.post('/login', (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  const sql = 'SELECT * FROM users WHERE email = ?';
  db.query(sql, [email], (err, result) => {
    if (err) {
      return res.status(500).send('Server error');
    }

    if (result.length === 0) {
      return res.status(400).send('User not found');
    }

    const user = result[0];

    bcrypt.compare(password, user.password, (err, isMatch) => {
      if (err) {
        return res.status(500).send('Server error');
      }

      if (!isMatch) {
        return res.status(400).send('Invalid credentials');
      }

      res.status(200).send('User logged in');
    });
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
