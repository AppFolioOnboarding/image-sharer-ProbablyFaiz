import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { observer, inject } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';
import FeedbackStore from '../stores/FeedbackStore';

@inject((stores) => {
  return {
    feedbackStore: stores.feedbackStore
  };
})
@observer
class Feedback extends Component {
  static propTypes = {
    feedbackStore: PropTypes.instanceOf(FeedbackStore).isRequired
  };

  render() {
    const fStore = this.props.feedbackStore;
    return (
      <div id="feedback-form-container" style={{ maxWidth: '500px' }}>
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
              onChange={event => fStore.setAttribute('nameValue', event.target.value)}
            />
          </FormGroup>
          <Button color="primary">Submit</Button>
        </Form>
      </div>
    );
  }
}

export default Feedback;
