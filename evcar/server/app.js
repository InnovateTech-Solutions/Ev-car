const express = require('express');
const newLocal = './database';
const Database = require(newLocal); // Assuming database.js is in the same directory

const app = express();
const port = 3000;
const host = '0.0.0.0';

// Replace these with your MongoDB connection details
const mongoURI = 'mongodb+srv://dbuser:Afaomr2001!@cluster0.qsmru3l.mongodb.net/?retryWrites=true&w=majority';
const dbName = 'Ev-Car';
const collectionName = 'Admin';

// const database = new Database(mongoURI, dbName, collectionName);

app.get('/', async (req, res) => {
  try {
    await client.connect();

    // Insert a document into the collection
    await client.insertDocument({ message: 'Abdullah sa8t!' });

    // Fetch the inserted document
    const result = await database.findOne({ message: 'Abdullah sa8t!' });

    res.send(`Message from MongoDB: ${result.message}`);
  } finally {
    // Close the connection when done
    await client.close();
  }
});

app.listen(port, host, () => {
  console.log(`Server is listening at http://${host}:${port}`);
});
