const express = require('express')
const bodyParser = require('body-parser')
const cors = require("cors");
const app = express()
const port = 3010

const db = require('./queries')
const auth = require("./auth");

app.use(cors())

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/auth-endpoint', auth, db.authEndpoint)
app.post('/save-history', db.saveHistory)
app.post('/login', db.login)

app.get('/', (request, response) => {
    response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})

app.use((req, res, next) => {
    const error = new Error('Something went wrong');
    next(error);
});
// Error-handling Middleware
app.use((err, req, res, next) => {
    console.error('Error:', err.message);
    res.status(500).send('Internal Server Error');
});