import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Header from './Header';

class App extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div>
        <Header title="Send Feedback" />
      </div>
    );
  }
}

export default inject('stores')(App);
