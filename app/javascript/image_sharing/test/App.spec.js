import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import App from '../components/App';
import Feedback from '../components/Feedback';
import Header from '../components/Header';

describe('<App />', () => {
  const wrapper = shallow(<App />);

  it('should have a header child', () => {
    expect(wrapper.find(Header)).to.have.lengthOf(1);
  });

  it('should have a feedback form child', () => {
    expect(wrapper.find(Feedback)).to.have.lengthOf(1);
  });
});
