# #4 Ruby advanced syntax

HTML and Markdown from DSL generator.

## Usage

Write needed DSL content in `app.rb`, supported types are *Header*, *Section*, *Text*, *Link*, *Image*.
```ruby
gen = Generator.new do
  header 'Hello world'
end
```

After that you can call the script with
```
ruby app.rb
```

The prompt will ask you about resulting file folder and type. If folder doesn't exist it will create it.

To clean up files rakefile can be used:
```
rake "cleanup[./]"
```
By default it will clean `build` folder and remove all **.md** and all **.html** files.