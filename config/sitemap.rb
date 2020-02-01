# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://f9-shop.jp"

SitemapGenerator::Sitemap.create do

    Top.find_each do |top|
      add top_path(top), :lastmod => top.updated_at
    end

    Area.find_each do |area|
      add area_path(area), :lastmod => area.updated_at
    end

end
