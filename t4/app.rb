# frozen_string_literal: true

require_relative './env'
require_relative './generator'
require_relative './data_structures'
prompt = TTY::Prompt.new

gen = Generator.new do
  header 'Hello title'
  text 'Some text'
  section 'Section Title', 'Section Text'
  link 'Link text', 'http://url.com'
  image 'alt text', 'https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png'
end

path = prompt.ask("Input file path and name(will be created if not exists)", default: "build/README",convert: :filepath) do |q|
  q.required true
  q.convert(:filepath, "Not a valid filepath")
end

type = prompt.select("Select file format:", {md: :md, html: :html})

gen.generate(path, type)

