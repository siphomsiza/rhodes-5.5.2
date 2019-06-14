module BrowserHelper
  ESCAPE_TABLE = { '&'=>'&amp;', '<'=>'&lt;', '>'=>'&gt;', '"'=>'&quot;', "'"=>'&#039;', }
  HTML_ESCAPE = { '&' => '&amp;',  '>' => '&gt;',   '<' => '&lt;', '"' => '&quot;' }
  JSON_ESCAPE = { '&' => '\u0026', '>' => '\u003E', '<' => '\u003C' }

  BOOLEAN_ATTRIBUTES = %w(disabled readonly multiple checked required)

  def placeholder(label=nil)
    "placeholder='#{label}'" if platform == 'apple'
  end

  def platform
    System::get_property('platform').downcase
  end

  def html_escape(s)
    s = s.to_s
    s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }
  end

  def h(value)
    value.to_s.gsub(/[&<>"]/) {|s| ESCAPE_TABLE[s] }
  end

  def tag(name, options = nil, open = false, escape = false)
    "<#{name}#{tag_options(options, escape) if options}#{open ? ">" : " />"}"
  end

  def content_tag(name, content_or_options_with_block = nil, options = nil, escape = false, &block)
    if block_given?
      options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      content_tag_string(name, yield, options, escape)
    else
      content_tag_string(name, content_or_options_with_block, options, escape)
    end
  end

  def image_tag(source, options = {})
    #options.symbolize_keys!

    options[:src] = "/public/images/#{source}"

    if size = options.delete(:size)
      options[:width], options[:height] = size.split("x") if size =~ %r{^\d+x\d+$}
    end

    tag("img", options)
  end

  def bb(*args)
    unless args.empty?
      content_tag :table, {:class=>'bb'} do
        content_tag :tr do
          args.inject("") do |txt,arg|
            txt << content_tag(:td, arg)
          end
        end
      end
    end
  end

  def link_with_image(url,src,image_options={})
    content_tag(:a,image_tag(src,image_options),{:href=>url})
  end

  def selected(option_value,object_value)
    "selected=\"yes\"" if option_value == object_value
  end

  def checked(option_value,object_value)
    "checked=\"yes\"" if option_value == object_value
  end

  def options_for_select(container, selected_value = nil)
    container.inject('') do |html,option|
      html + "<option value=\"#{option[1]}\" #{selected(selected_value,option[1])}>#{option[0]}</option>"
    end
  end

  def options_for_select_grouped(container, selected_value = nil)
    container.sort.inject('') do |html,optgroup|
      html + "<optgroup label=\"#{optgroup[0]}\">#{options_for_select(optgroup[1],selected_value)}</optgroup>"
    end
  end

  def select(name,container,selected_value = nil,options={})
    #blank_option = options[:include_blank] ? '<option value></option>' : ''
    "<select name=\"#{name}\">#{'<option value></option>' if options[:include_blank]}#{container[0] ? options_for_select(container[0],selected_value) : options_for_select_grouped(container,selected_value) }</select>"
  end

  def submit(obj)
    "<input type=\"submit\" value=\"#{obj.can_modify ? 'Save' : 'Sync Required' }\" data-inline=\"true\" #{obj.can_modify ? '' : 'disabled="\true\"'} />"
  end

  def show_error(errors,attr)
    if errors
    "<strong style='color:red;font-size:12px;'>#{errors[attr]}</strong>" if errors[attr]
    end
  end

  def markers_string(arr,current=nil)
    markers_array = arr.inject([]) {|a,point| point.latitude.nil? || point.longitude.nil? ? a : a << "#{point.latitude.to_s},#{point.longitude.to_s},red#{point.position.to_i}"}
    markers_array << "#{current[0].to_s},#{current[1].to_s},greenc" if current
    markers_array.join('|')
  end

  def empty_position?(latitude,longitude)
    latitude.nil? || latitude.empty? || longitude.nil? || longitude.empty?
  end

  private

    def content_tag_string(name, content, options, escape = true)
      tag_options = tag_options(options, escape) if options
      "<#{name}#{tag_options}>#{escape ? h(content) : content}</#{name}>"
    end

    def tag_options(options, escape = true)
      unless options.empty? #blank
        attrs = []
        options.each_pair do |key, value|
          if BOOLEAN_ATTRIBUTES.include?(key)
            attrs << %(#{key}="#{key}") if value
          elsif !value.nil?
            final_value = value.is_a?(Array) ? value.join(" ") : value
            final_value = html_escape(final_value) if escape
            attrs << %(#{key}="#{final_value}")
          end
        end
        " #{attrs.sort * ' '}" unless attrs.empty?
      end
    end

end