module Merb
        module CategoriesHelper
                def link_to_category(category, title = category.name)
                        link_to title, "/archives/#{category.slug}"
                end
        end
end