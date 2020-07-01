import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Feedback from './Feedback';
import Header from './Header';

class App extends Component {
  render() {
    return (
      <div>
        <Header title="Send Feedback" />
        <Feedback />
      </div>
    );
  }
}

export default inject('stores')(App);
