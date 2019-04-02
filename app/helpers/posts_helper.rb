# frozen_string_literal: true

module PostsHelper
    def render_with_hashtags(description) 
        description.gsub(/#[A-Za-z0-9А-Яа-я]*/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}", class: "hashtag" }.html_safe
    end
end
 