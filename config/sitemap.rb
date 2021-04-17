# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://shopping.sleepinglion.pe.kr"
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #

  add intro_path, :changefreq => 'monthly'
  add location_path, :changefreq => 'monthly'
  add info_path, :changefreq => 'monthly'

  add boards_path, :changefreq => 'weekly'
  Board.find_each do |board|
    add board_path(board), :lastmod => board.updated_at
  end

  add notices_path, :changefreq => 'monthly'
  Notice.find_each do |notice|
    add notice_path(notice), :lastmod => notice.updated_at
  end

  add products_path, :changefreq => 'daily'
  Product.find_each do |product|
    add product_path(product), :lastmod => product.updated_at
  end

  add faqs_path, :changefreq => 'monthly'
  Faq.find_each do |faq|
    add faq_path(faq), :lastmod => faq.updated_at
  end

  #add sitemap_index_path, :changefreq => 'monthly'
end
