import { expect } from 'chai';
import { describe, it } from 'mocha';
import sinon from 'sinon';
import PostFeedbackApi from '../api/PostFeedbackApi';

describe('PostFeedbackApi', () => {
  let sandbox;

  // eslint-disable-next-line no-undef
  before(() => {
    sandbox = sinon.createSandbox();
  });

  // eslint-disable-next-line no-undef
  afterEach(() => {
    sandbox.restore();
  });

  it('should resolve with data correctly', () => {
    const postFunc = sandbox.stub().resolves({ message: 'dummy' });
    PostFeedbackApi.postFeedback('hello', 'world', postFunc).then((r) => {
      sandbox.assert.calledOnce(postFunc);
      sandbox.assert.calledWith(postFunc, '/api/feedbacks', { name: 'hello', message: 'world' });
      expect(r.message).to.equal('dummy');
    });
  });

  it('should reject with data correctly', () => {
    const postFunc = sandbox.stub().rejects({ data: { message: 'dummy' } });
    PostFeedbackApi.postFeedback('hello', 'world', postFunc).catch((r) => {
      sandbox.assert.calledOnce(postFunc);
      sandbox.assert.calledWith(postFunc, '/api/feedbacks', { name: 'hello', message: 'world' });
      expect(r.data.message).to.equal('dummy');
    });
  });
});
