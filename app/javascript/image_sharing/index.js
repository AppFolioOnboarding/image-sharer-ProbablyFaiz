import { Provider } from 'mobx-react';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import FeedbackStore from './stores/FeedbackStore';
import Footer from './components/Footer';

const stores = {
  feedbackStore: new FeedbackStore()
};

/* Initialize your store here*/


ReactDOM.render(
  <Provider {...stores}>
    <Footer />
  </Provider>,
  document.getElementById('footer-root')
);


ReactDOM.render(
  <Provider {...stores}>
    <App />
  </Provider>,
  document.getElementById('feedback-root')
);
