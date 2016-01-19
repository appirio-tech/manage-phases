'use strict'

require './ExampleNav.scss'

React      = require 'react'
classNames = require 'classnames'

{ Link } = require 'react-router'

component = ({data, state}) ->
  <ul className="ExampleNav">
    <li>
      <Link to="/">ManageSteps Examples</Link>
    </li>

    <li>
      <Link to="/StepRowExamples">StepRow Examples</Link>
    </li>
  </ul>

module.exports = component