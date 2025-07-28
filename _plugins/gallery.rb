module Jekyll
  class GalleryTag < Liquid::Block
    
    def initialize(tag_name, markup, tokens)
      super
      @attributes = {}
      
      # Parse optional attributes
      markup.scan(/(\w+):\s*['"]([^'"]*?)['"]/) do |key, value|
        @attributes[key] = value
      end
    end

    def render(context)
      content = super.strip
      return '' if content.empty?
      
      # Parse gallery items
      images = []
      content.split("\n").each do |line|
        line = line.strip
        next if line.empty?
        
        if line.include?('|')
          path, caption = line.split('|', 2).map(&:strip)
        else
          path = line.strip
          caption = ''
        end
        
        # Generate alt text from filename if no caption
        if caption.empty?
          filename = File.basename(path, File.extname(path))
          caption = filename.gsub(/[-_]/, ' ').split.map(&:capitalize).join(' ')
        end
        
        images << {
          path: path,
          caption: caption,
          filename: File.basename(path)
        }
      end
      
      return '' if images.empty?
      
      # Generate unique gallery ID
      gallery_id = "gallery-#{SecureRandom.hex(4)}"
      
      # Build HTML
      html = []
      html << "<div class=\"image-gallery\" data-gallery-id=\"#{gallery_id}\">"
      
      images.each_with_index do |img, index|
        html << "  <div class=\"gallery-item\" data-index=\"#{index}\">"
        html << "    <img src=\"#{img[:path]}\" alt=\"#{img[:caption]}\" "
        html << "         data-caption=\"#{img[:caption]}\" "
        html << "         data-gallery=\"#{gallery_id}\" "
        html << "         loading=\"lazy\" "
        html << "         class=\"gallery-thumbnail\">"
        html << "    <div class=\"gallery-overlay\">"
        html << "      <span class=\"gallery-zoom-icon\">🔍</span>"
        html << "    </div>"
        html << "  </div>"
      end
      
      html << "</div>"
      
      html.join("\n")
    end
  end
end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)