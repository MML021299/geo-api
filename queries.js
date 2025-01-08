const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'GeoDB',
  password: 'assessment123',
  port: 5432,
})

const getUserById = (req, res) => {
  const id = parseInt(req.params.id)

  pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
}

const saveHistory = (req, res) => {
  const { history, userId } = req.body

  pool.query('INSERT INTO history (ip_address, user_id) VALUES ($1, $2)', [history, userId], (error, results) => {
    if (error) {
      throw error
    }
    res.status(201).send(`IP History added with ID: ${results.insertId}`)
  })
}

const deleteHistory = (req, res) => {
  const { ip, userId } = req.body

  pool.query('DELETE FROM history WHERE ip_address = $1 AND user_id =$2', [ip, userId], (error, results) => {
    if (error) {
      throw error
    }
    res.status(201).send(`IP History deleted: ${ip}`)
  })
}

const getHistory = (req, res) => {
  const { userId } = req.body

  pool.query('SELECT * FROM history WHERE user_id = $1', [userId], (error, results) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
}

const login = async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        return res.status(400).json({ error: 'Username and password are required' });
    }

    try {
        const result = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
    
        if (result.rows.length === 0) {
          return res.status(400).send({ message: 'Invalid credentials' });
        }
    
        const user = result.rows[0];
        const passwordMatch = await bcrypt.compare(password, user.password);
    
        if (!passwordMatch) {
          return res.status(400).send({ message: 'Invalid credentials' });
        }

        const token = jwt.sign(
            {
              userId: user.id,
              userName: user.username,
            },
            "RANDOM-TOKEN",
            { expiresIn: "24h" }
        );
    
        res.status(200).json({ message: 'Login successful', userId: user.id, token });
    
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Something went wrong' });
    }
}

const authEndpoint = async (req, res) => {
    res.json({ user: req.user, ip: req.ip });
}

module.exports = {
  getUserById,
  saveHistory,
  deleteHistory,
  getHistory,
  login,
  authEndpoint
}