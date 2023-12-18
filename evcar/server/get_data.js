const { MongoClient } = require('mongodb');

const uri = 'https://eu-west-1.aws.data.mongodb-api.com/app/data-mrmva/endpoint/data/v1';
const dbName = 'Users';
const collectionName = 'users';

async function retrieveData() {
  const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

  try {
    await client.connect();
    console.log('Connected to the database');

    const database = client.db(dbName);
    const collection = database.collection(collectionName);

    // Retrieve data (e.g., find all documents)
    const result = await collection.find({}).toArray();

    console.log('Retrieved data:', result);
  } finally {
    await client.close();
    console.log('Connection closed');
  }
}

retrieveData();
