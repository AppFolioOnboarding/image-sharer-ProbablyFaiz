import { expect } from 'chai';
import { describe, it } from 'mocha';
import FeedbackStore from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('has actions that set observable values', () => {
    const store = new FeedbackStore();
    expect(store.nameValue).to.equal('');
    expect(store.feedbackValue).to.equal('');
    store.setAttribute('nameValue', 'my_name');
    store.setAttribute('feedbackValue', 'my_feedback');
    expect(store.nameValue).to.equal('my_name');
    expect(store.feedbackValue).to.equal('my_feedback');
  });
});
