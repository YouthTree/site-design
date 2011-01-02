module ViewHelpers
  
  def ie_html(attrs={}, &block)
    name = :html
    attrs.symbolize_keys!
    haml_concat("<!--[if lt IE 7 ]> #{ tag(name, css_class('ie6', attrs)) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 7 ]>    #{ tag(name, css_class('ie7', attrs)) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 8 ]>    #{ tag(name, css_class('ie8', attrs)) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 9 ]>    #{ tag(name, css_class('ie9', attrs)) } <![endif]-->".html_safe)
    haml_concat("<!--[if (gt IE 9)|!(IE)]><!-->".html_safe)
    haml_tag name, attrs do
      haml_concat("<!--<![endif]-->".html_safe)
      block.call
    end
  end

  def css_class(klass, options)
    options.merge :class => [options[:class], klass].join(' ').strip
  end
  
  def ml(text)
    content_tag :li, content_tag(:a, text, :href => '#')
  end
  
  def social_media(name, text = "Find us on #{name}", type = name.to_s.downcase)
    content_tag :li, content_tag(:a, text, :title => text, :id => "#{type}-link", :href => '#')
  end
  
end
