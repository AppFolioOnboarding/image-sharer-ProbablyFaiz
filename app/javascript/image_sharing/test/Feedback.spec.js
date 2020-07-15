import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Feedback from '../components/Feedback';
import FeedbackStore from '../stores/FeedbackStore';

describe('<Feedback />', () => {
  const feedbackStore = new FeedbackStore();
  const wrapper = shallow(<Feedback.wrappedComponent feedbackStore={feedbackStore} />);

  it('should have a feedback form container div', () => {
    expect(wrapper.find('div#feedback-form-container')).to.have.lengthOf(1);
  });

  it('should have a max width of 500px', () => {
    expect(wrapper.find('div#feedback-form-container').prop('style'))
      .to.have.property('maxWidth', '500px');
  });

  it('should have name and message inputs', () => {
    expect(wrapper.find('Input#nameField')).to.have.lengthOf(1);
    expect(wrapper.find('Input#feedbackField')).to.have.lengthOf(1);
  });

  it('should have correct input values when feedback store is changed', () => {
    feedbackStore.setAttribute('nameValue', 'Faiz');
    feedbackStore.setAttribute('feedbackValue', 'SAD!');
    expect(wrapper.find('Input#nameField').prop('value')).to.equal('Faiz');
    expect(wrapper.find('Input#feedbackField').prop('value')).to.equal('SAD!');
  });

  it('should not show an alert when no flash message is present', () => {
    expect(wrapper.find('Alert#flash-message-alert')).to.have.lengthOf(0);
  });

  it('should show an alert when a flash message is present', () => {
    feedbackStore.setAttribute('flashMessage', 'Hello, world!');
    feedbackStore.setAttribute('flashMessageColor', 'success');
    expect(wrapper.find('Alert#flash-message-alert')).to.have.lengthOf(1);
  });
});
