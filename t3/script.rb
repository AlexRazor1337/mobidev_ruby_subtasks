class MDHtml
    def initialize(&block)
        @html = ''
        @level = 0
        self.define_methods()
        instance_eval &block
    end

    def to_s
        return @html
    end

    def add_spaces(count)
        _spaces = ''
        for i in 0..count
            _spaces += '    '
        end

        return _spaces
    end

    def define_methods()
        ["head", "body"].each { |name| self.class.define_method(name) do |&block| 
                @html << add_spaces(@level) + "<#{name}>\n"
                @level += 1
                instance_eval &block
                @level -= 1
                @html << add_spaces(@level) + "</#{name}>\n"
            end
        }
    end

    def html(&block)
        @html << "<!doctype html>\n\n<html>\n"
        instance_eval &block
        @html << '</html>'
    end

    def title(data)
        @html << add_spaces(@level) + "<title>#{data}</title>\n"
    end

    def meta(**data)
        @html << add_spaces(@level) + "<meta name=\"#{data.keys.first}\" content=\"#{data.values.first}\">\n"
    end

    def link(**data)
        @html << add_spaces(@level) + "<link rel=\"#{data.keys.first}\" href=\"#{data.values.first}\">\n"
    end

    def script(**data)
        @html << add_spaces(@level) + "<script #{data.keys.first}=\"#{data.values.first}\"></script>\n"
    end

    def div(&block)
        @html << add_spaces(@level) + "<div>#{block.call}</div>\n"
    end
end
  
print (MDHtml.new do
    html do
        head do
            meta charset: "utf-8"
            title "The HTML5 Template"
            meta description: "The HTML5 Template"
            
            meta author: "MobiDev"
            link stylesheet: "css/styles.css?v=1.0"
        end
    
        body do
            div do
                "Hello World"
            end
            script src:"js/scripts.js"
        end
    end
end.to_s)
