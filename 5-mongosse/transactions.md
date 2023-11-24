# Transactions in Mongoose

Mongoose is a powerful ODM (Object Data Modeling) library for MongoDB and provides support for transactions. Transactions ensure that a series of database operations are executed atomically, meaning they all succeed or fail together. This helps maintain data integrity in complex operations.

## `index.js`

```javascript
import express from 'express';
import mongoose from './db';

const app = express();
const port = 3000;

app.use(express.json());

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

// Import the Book model
import Book from './models/book';

app.post('/create-book', async (req, res) => {
  const { title, author, price } = req.body;

  const session = await mongoose.startSession();

  try {
    session.startTransaction();

    const newBook = new Book({ title, author, price });
    await newBook.save({ session });

    // Additional operations...
    

    await session.commitTransaction();
    session.endSession();

    res.status(201).json({ message: 'Book created successfully' });
  } catch (error) {
    await session.abortTransaction();
    session.endSession();

    console.error('Transaction aborted:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
```
