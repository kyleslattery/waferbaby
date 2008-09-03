#
# =>    posts_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module PostsHelper
                def link_to_post_categories(post)
                        post.categories.collect do |category|
                                if category.slug == params[:category]
                                        category.name
                                else
                                        link_to(category.name,
                                                url(:posts, :category => category.slug),
                                                :title  => "View all posts filed under '#{category.name}'.",
                                                :class  => 'category',
                                                :rel    => 'tag'
                                        )                                
                                end
                        end.join(', ')
                end
        end
end
