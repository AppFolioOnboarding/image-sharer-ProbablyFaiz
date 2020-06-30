import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Footer from '../components/Footer';

describe('<Footer />', () => {
  const wrapper = shallow(<Footer />);

  it('should have a footer-text div', () => {
    expect(wrapper.find('div.footer-text')).to.have.lengthOf(1);
  });

  it('should be centered and have 10px font', () => {
    expect(wrapper.find('div.footer-text').prop('style')).to.have.property('textAlign', 'center');
    expect(wrapper.find('div.footer-text').prop('style')).to.have.property('fontSize', '10px');
  });

  it('has a copyright notice', () => {
    expect(wrapper.find('div.footer-text').text()).to.equal('Copyright: AppFolio Inc. Onboarding');
  });
});
