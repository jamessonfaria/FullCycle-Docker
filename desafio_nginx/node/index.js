
const express = require('express')
const app = express()
const port = 3000
const config = {
    host: 'db',
    user: 'root',
    password: 'root',
    database: 'nodedb' 
};
const mysql = require('mysql')
const connection = mysql.createConnection(config)

const sql = `INSERT INTO people(id, name) values (uuid(), 'Jamesson Jr')`
connection.query(sql)

var rest = ""

connection.query("SELECT * FROM people", function (err, result, fields) {
    if (err) throw err;

    Object.keys(result).forEach(function(key) {
      var row = result[key];
      rest += "<p>" + row.id + ' ' + row.name + "</p>"
    });
});

connection.end()

app.get('/', (req, res) => {
    res.send(
        '<h1>Full Cycle Rocks!</h1><h3>::: Lista de Nomes Cadastrados</h3><br>' + rest
    )
})

app.listen(port, () =>{
    console.log('Rodando na porta ' + port)
})