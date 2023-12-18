const express = require('express');
const newLocal = './database';
const Database = require(newLocal); // Assuming database.js is in the same directory

const app = express();
const port = 3000;
const host = '0.0.0.0';

// Replace these with your MongoDB connection details
const mongoURI = 'mongodb://localhost:27017';
const dbName = 'your_database_name';
const collectionName = 'your_collection_name';

const database = new Database(mongoURI, dbName, collectionName);

app.get('/', async (req, res) => {
  try {
    await database.connect();

    // Insert a document into the collection
    await database.insertDocument({ message: 'Hello from MongoDB!' });

    // Fetch the inserted document
    const result = await database.findOne({ message: 'Hello from MongoDB!' });

    res.send(`Message from MongoDB: ${result.message}`);
  } finally {
    // Close the connection when done
    await database.close();
  }
});

app.listen(port, host, () => {
  console.log(`Server is listening at http://${host}:${port}`);
});
