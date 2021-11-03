require_relative './base'

class GeneratorMd < GeneratorBase
  def apply_mapping line
    if line.is_a? Header
      "# #{line.text}"
    elsif line.is_a? Section
      "# #{line.title}
      #{line.text}"
    elsif line.is_a? Text
      line.text
    elsif line.is_a? Link
      "[#{line.text}](#{line.url})"
    elsif line.is_a? Image
      "![#{line.text}](#{line.url})"
    else
      "UNKNOWN"
    end
  end
end
