async function myFunc() {
const a =  await import ('./model.mjs')
const util = require('util')
//console.log(util.inspect(a.u, {showHidden: false, depth: null}))
console.log(JSON.stringify(a, null, 2))
  }
myFunc()

