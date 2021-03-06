Spree::Admin::NavigationHelper.class_eval do

  def link_to_clone(resource, options={})
    options[:data] = {:action => 'clone'}
    link_to_with_icon('icon-retweet', Spree.t(:clone), clone_object_url(resource), options)  
  end

  def button_link_to(text, url, html_options = {})
    if (html_options[:method] &&
        html_options[:method].to_s.downcase != 'get' &&
        !html_options[:remote])
      form_tag(url, :method => html_options.delete(:method)) do
        button(text, html_options.delete(:icon), nil, html_options)
      end
    else
      if html_options['data-update'].nil? && html_options[:remote]
        object_name, action = url.split('/')[-2..-1]
        html_options['data-update'] = [action, object_name.singularize].join('_')
      end

      html_options.delete('data-update') unless html_options['data-update']

      html_options[:class] = 'btn'

      if html_options[:icon]
        html_options[:class] += " spree#{html_options[:icon]}"
      end
      link_to(text_for_button_link(raw('<i class="'+html_options[:icon]+'"></i> '+text), html_options), url, html_options)
    end
  end

  def button(text, icon_name = nil, button_type = 'submit', options={})
    button_tag(text, options.merge(:type => button_type, :class => "spree#{icon_name} btn"))
  end

end
