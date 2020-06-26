require 'page_objects/images/image_card'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '.image-list', item_locator: '.image-link', contains: ImageCard do
        def view!
          node.click
          window.change_to(ShowPage)
        end
      end

      def click_tag!(tag_name)
        node.find('.tag-filters').click_on(tag_name)
        window.change_to(IndexPage)
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:)
        images.any? { |im| im.url == url }
      end

      def clear_tag_filter!
        node.find('.tag-filters').click_on('All')
        window.change_to(IndexPage)
      end
    end
  end
end
