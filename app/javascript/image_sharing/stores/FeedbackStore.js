import { observable, action } from 'mobx';

class FeedbackStore {
  @observable feedbackValue = '';
  @observable nameValue = '';

  @action
  setAttribute = (attribute, value) => {
    this[attribute] = value;
  }
}

export default FeedbackStore;
