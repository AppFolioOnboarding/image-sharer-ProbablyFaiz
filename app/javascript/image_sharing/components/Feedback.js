import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { observer, inject } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button, Alert } from 'reactstrap';
import FeedbackStore from '../stores/FeedbackStore';

@inject('feedbackStore')
@observer
class Feedback extends Component {
  static propTypes = {
    feedbackStore: PropTypes.instanceOf(FeedbackStore).isRequired
  };

  render() {
    const fStore = this.props.feedbackStore;
    return (
      <div id="feedback-form-container" style={{ maxWidth: '500px' }}>
        {fStore.flashMessage &&
        // eslint-disable-next-line max-len
        <Alert id="flash-message-alert" color={fStore.flashMessageColor}>{fStore.flashMessage}</Alert>}
        <Form>
          <FormGroup>
            <Label for="nameField">Name</Label>
            <Input
              type="text"
              name="name"
              id="nameField"
              placeholder="Your Name"
              value={fStore.nameValue}
              onChange={event => fStore.setAttribute('nameValue', event.target.value)}
            />
          </FormGroup>
          <FormGroup>
            <Label for="feedbackField">Feedback</Label>
            <Input
              type="textarea"
              name="feedback"
              id="feedbackField"
              value={fStore.feedbackValue}
              onChange={event => fStore.setAttribute('feedbackValue', event.target.value)}
            />
          </FormGroup>
          <Button color="primary" onClick={() => fStore.submitFeedback()}>Submit</Button>
        </Form>
      </div>
    );
  }
}

export default Feedback;
