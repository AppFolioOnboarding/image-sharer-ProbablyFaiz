module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      element :img, locator: '#image-display'
      element :tag_list, locator: '#tags-string'

      def image_url
        node.find('#image-display')[:src]
      end

      def tags
        node.find('#tags-string').text.split(', ')
      end

      def delete
        node.click_on('Delete')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        delete(&:accept)
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('Back')
        window.change_to(IndexPage)
      end
    end
  end
end
