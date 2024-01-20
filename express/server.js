const express = require('express')
const app = express()

app.get('/fibonacci', (req, res) => {
  const n = parseInt(req.query.n) || 10
  const fibonacciSeq = [0, 1]

  for (let i = 2; i < n; i++) {
    fibonacciSeq.push(fibonacciSeq[i - 1] + fibonacciSeq[i - 2])
  }

  res.json(fibonacciSeq)
})

const port = process.env.PORT || 3000
app.listen(port, () => {
  console.log(`Server is running on port ${port}`)
})
