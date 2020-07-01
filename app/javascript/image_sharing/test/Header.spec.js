import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Header from '../components/Header';

describe('<Header />', () => {
  const wrapper = shallow(<Header title="Send Feedback" />);

  it('should have an h3 with send feedback text', () => {
    expect(wrapper.find('h3').text()).to.equal('Send Feedback');
  });
});
