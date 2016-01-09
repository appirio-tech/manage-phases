'use strict'

require './ExampleNav.scss'

React      = require 'react'
classNames = require 'classnames'

{ Link } = require 'react-router'

component = ({data, state}) ->
  <ul className="ExampleNav">
    <li>
      <Link to="/">ManagePhases</Link>
    </li>

    <li>
      <Link to="/PhaseRowExamples">PhaseRowExamples</Link>
    </li>
  </ul>

module.exports = component