const express = require('express');
const mysql = require('mysql2');

// Create a connection to the database
const connection = mysql.createConnection({
  host: 'localhost',        // Use your MySQL server host
  user: 'root',             // Your MySQL username
  password: 'Sthuthi@9031',     // Your MySQL password
  database: 'ingredient_db' // Your database name
});

const app = express();
app.use(express.json()); // Middleware to parse JSON

// Get all ingredients from the database
app.get('/ingredients', (req, res) => {
  connection.query('SELECT * FROM ingredients', (err, results) => {
    if (err) {
      res.status(500).send('Error fetching ingredients');
      return;
    }
    res.json(results); // Respond with JSON data
  });
});

// Add a new ingredient to the database
app.post('/ingredients', (req, res) => {
  const { type, ingredient_name } = req.body;

  if (!type || !ingredient_name) {
    return res.status(400).send('Missing ingredient type or name');
  }

  const query = 'INSERT INTO ingredients (type, ingredient_name) VALUES (?, ?)';
  connection.query(query, [type, ingredient_name], (err, result) => {
    if (err) {
      res.status(500).send('Error adding ingredient');
      return;
    }
    res.status(201).json({ id: result.insertId, type, ingredient_name });
  });
});

// Update an ingredient
app.put('/ingredients/:id', (req, res) => {
  const { id } = req.params;
  const { type, ingredient_name } = req.body;

  const query = 'UPDATE ingredients SET type = ?, ingredient_name = ? WHERE id = ?';
  connection.query(query, [type, ingredient_name, id], (err, result) => {
    if (err) {
      res.status(500).send('Error updating ingredient');
      return;
    }
    if (result.affectedRows === 0) {
      return res.status(404).send('Ingredient not found');
    }
    res.json({ id, type, ingredient_name });
  });
});

// Delete an ingredient
app.delete('/ingredients/:id', (req, res) => {
  const { id } = req.params;

  const query = 'DELETE FROM ingredients WHERE id = ?';
  connection.query(query, [id], (err, result) => {
    if (err) {
      res.status(500).send('Error deleting ingredient');
      return;
    }
    if (result.affectedRows === 0) {
      return res.status(404).send('Ingredient not found');
    }
    res.status(204).send(); // No content to send in response
  });
});

// Start the server
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
