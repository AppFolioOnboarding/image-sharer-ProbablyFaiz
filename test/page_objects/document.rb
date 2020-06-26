module PageObjects
  class Document < AePageObjects::Document
    def flash_message(_message_type)
      node.find('#notice').text
    end
  end
end
