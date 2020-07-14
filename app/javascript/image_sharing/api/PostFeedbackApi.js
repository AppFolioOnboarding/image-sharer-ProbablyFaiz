// eslint-disable-next-line no-unused-vars
import { post } from '../utils/helper';

export class PostFeedbackApi {
  static postFeedback(name, message, postFunction = post) {
    const params = { name, message };
    return postFunction('/api/feedbacks', params);
  }
}

export default PostFeedbackApi;
