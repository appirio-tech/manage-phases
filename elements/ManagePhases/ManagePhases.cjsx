'use strict'

require './ManagePhases.scss'

React      = require 'react'
classNames = require 'classnames'

component = ({data, state}) ->
  <h1>Hello World</h1>

component.propTypes =
  data : React.PropTypes.object

module.exports = component