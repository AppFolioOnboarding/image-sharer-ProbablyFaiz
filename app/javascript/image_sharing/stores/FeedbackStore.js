import { observable, action } from 'mobx';
import PostFeedbackApi from '../api/PostFeedbackApi';

class FeedbackStore {
  @observable feedbackValue = '';
  @observable nameValue = '';
  @observable flashMessage;
  @observable flashMessageColor;

  @action
  setAttribute = (attribute, value) => {
    this[attribute] = value;
  };

  @action
  submitFeedback = () => PostFeedbackApi.postFeedback(this.nameValue, this.feedbackValue).then((r) => {
    this.setAttribute('flashMessage', r.message);
    this.setAttribute('flashMessageColor', 'success');
  }).catch((e) => {
    this.setAttribute('flashMessage', e.data.message);
    this.setAttribute('flashMessageColor', 'danger');
  });
}

export default FeedbackStore;
