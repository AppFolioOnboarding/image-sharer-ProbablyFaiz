import { expect } from 'chai';
import { describe, it } from 'mocha';
import sinon from 'sinon';
import FeedbackStore from '../stores/FeedbackStore';
import PostFeedbackApi from '../api/PostFeedbackApi';

describe('FeedbackStore', () => {
  let store;
  let sandbox;

  // eslint-disable-next-line no-undef
  beforeEach(() => {
    sandbox = sinon.createSandbox();
    store = new FeedbackStore();
  });

  // eslint-disable-next-line no-undef
  afterEach(() => {
    sandbox.restore();
  });

  it('has actions that set observable values', () => {
    expect(store.nameValue).to.equal('');
    expect(store.feedbackValue).to.equal('');
    store.setAttribute('nameValue', 'my_name');
    store.setAttribute('feedbackValue', 'my_feedback');
    expect(store.nameValue).to.equal('my_name');
    expect(store.feedbackValue).to.equal('my_feedback');
  });

  it('should update the flash message and color on successful submitFeedback call', () => {
    store.flashMessage = null;
    store.flashMessageColor = null;
    sandbox.stub(PostFeedbackApi, 'postFeedback').resolves({ message: 'dummy' });
    store.submitFeedback().then(() => {
      sandbox.assert.calledOnce(PostFeedbackApi.postFeedback);
      expect(store.flashMessage).to.equal('dummy');
      expect(store.flashMessageColor).to.equal('success');
    });
  });

  it('should update the flash message and color on failed submitFeedback call', () => {
    store.flashMessage = null;
    store.flashMessageColor = null;
    sandbox.stub(PostFeedbackApi, 'postFeedback').rejects({ data: { message: 'whoops' } });
    store.submitFeedback().then(() => {
      sandbox.assert.calledOnce(PostFeedbackApi.postFeedback);
      expect(store.flashMessage).to.equal('whoops');
      expect(store.flashMessageColor).to.equal('danger');
    });
  });
});
