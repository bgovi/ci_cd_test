const express = require('express')
const app = express()
const port = 4000
const jwt  = require('jsonwebtoken') 
const cookieParser = require('cookie-parser')
const api = require('./api')

app.use(cookieParser())


const privateKey = 'abcdefg'

app.get('/select_one', async (req,res) => {
    let x = await api.SelectOne()
    res.send(x)
})

app.get('/select_all', async (req,res) => {
    let x = await api.SelectAll()
    res.send(x)
})

app.get('/', (req, res) => {
  res.send('Hello world')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})