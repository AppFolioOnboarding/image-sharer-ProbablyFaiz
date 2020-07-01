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
});
