#
# =>    posts_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module PostsHelper
                def link_to_post(post, title = post.title)
                        link_to(title,
                                url_for_post(post),
                                :title => "View the full '#{post.title}' post.",
                                :class => 'title'
                        )
                end
                
                def post_date(post)
                        "#{post.created_month_short_name} #{post.created_day}"
                end
                
                def link_to_post_categories(post)
                        post.categories.collect do |category|
                                if category.slug == params[:category]
                                        category.name
                                else
                                        link_to(category.name,
                                                url(:post_category, :category => category.slug),
                                                :title => "View all posts filed under '#{category.name}'.",
                                                :class => 'tag'
                                        )                                
                                end
                        end.join(', ')
                end

                def url_for_post_year(post)
                        "/archives/#{post.created_year}"
                end

                def url_for_post_month(post)
                        url_for_post_year(post) + "/#{post.created_month}"
                end
                
                def url_for_post_day(post)
                        url_for_post_month(post) + "/#{post.created_day}"
                end
                
                def url_for_post(post)
                        url_for_post_day(post) + "/#{post.slug}"
                end
        end
end
