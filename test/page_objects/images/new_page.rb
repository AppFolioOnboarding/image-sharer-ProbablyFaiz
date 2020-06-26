module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :url
        element :tag_list
      end

      def create_image!(url: nil, tags: nil)
        self.url.set url unless url.nil?
        tag_list.set tags unless tags.nil?
        node.click_on('Create Image')
        window.change_to(NewPage, ShowPage)
      end
    end
  end
end
