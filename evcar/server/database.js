const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Connect to MongoDB Atlas cluster
const uri = "mongodb+srv://dbuser:Afaomr2001!@cluster0.qsmru3l.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Create a User schema
const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  // Add other fields as needed
});

// Create a User model
const User = mongoose.model('User', userSchema);

// Middleware to parse incoming JSON requests
app.use(bodyParser.json());

// Route to get all users
app.get('/api/users', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Route to add a new user
app.post('Users/users', async (req, res) => {

  try {
    const { name, email } = req.body;

    // Validate input (add more validation as needed)
    if (!name || !email) {
      return res.status(400).json({ error: 'Name and email are required' });
    }

    // Create a new user instance
    const newUser = new User({
      name,
      email,
      // Add other fields as needed
    });

    // Save the new user to the database
    const savedUser = await newUser.save();

    res.status(201).json(savedUser);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
