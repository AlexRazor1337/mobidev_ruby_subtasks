class GeneratorDsl
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def header str
    @lines << Header.new(str)
  end

  def section header, text
    @lines << Section.new(header, text)
  end

  def text text
    @lines << Text.new(text)
  end

  def link text, url
    @lines << Link.new(text, url)
  end

  def image text, url
    @lines << Image.new(text, url)
  end
end
