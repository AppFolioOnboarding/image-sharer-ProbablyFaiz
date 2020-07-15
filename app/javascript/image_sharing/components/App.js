import React, { Component } from 'react';
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

export default App;
