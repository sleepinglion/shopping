xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @application_name
    xml.author 'Sleeping-Lion'
    xml.description @meta_description
    xml.link t(:site_full_url)
    xml.language I18n.locale.to_s


    for article in @notices
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link t(:site_full_url)+ '/notices/' + article.id.to_s
        xml.guid article.id

        text = article.notice_content.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end

    for article in @boards
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link t(:site_full_url)+ '/boards/' + article.id.to_s
        xml.guid article.id

        text = article.board_content.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end

    for article in @faqs
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link t(:site_full_url)+ '/faqs/' + article.id.to_s
        xml.guid article.id

        text = article.faq_content.content
        # if you like, do something with your content text here e.g. insert image tags.
        # Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end


    for article in @products
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ''
        end
        xml.author 'SleepingLion'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link t(:site_full_url)+ '/products/' + article.id.to_s
        xml.guid article.id

        text = article.product_content.content
        # if you like, do something with your content text here e.g. insert image tags.
        # Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end


  end
end
