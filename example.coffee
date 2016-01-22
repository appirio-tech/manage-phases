require 'appirio-tech-api-schemas'

React    = require 'react'
ReactDOM = require 'react-dom'
Router   = require './components/Router/Router.cjsx'

AUTH0_TOKEN_NAME = process.env.AUTH0_TOKEN_NAME || 'userJWTToken'

if process.env.TOKEN
  localStorage.setItem(AUTH0_TOKEN_NAME, '"' + process.env.TOKEN + '"')

ReactDOM.render Router(), document.getElementById('root')

