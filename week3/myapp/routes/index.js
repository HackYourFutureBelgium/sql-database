var express = require('express');
var router = express.Router();

const mysql = require('mysql2');

const con = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "",
  database: "world"
});

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/search/:query', (req, res, next) => {
  con.query(
    `SELECT code, name, population FROM country WHERE name LIKE "%${req.params.query}%" LIMIT 5`,
    (err, results, __) => {
      console.log(results); // results contains rows returned by server
      res.send(results);
    }
  );
})

module.exports = router;
