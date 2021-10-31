# #4 Ruby advanced syntax

Pseudo HTML page generator DSL.

## Usage


Instantiate, pass DSL block and call **to_s** method, this will return HTML string:
```ruby
test = MDHtml.new do
    html do
         body do
            div do
                "Hello World"
            end
        end
    end
end

print(test.to_s)
```

The result will be this HTML:
```html
<!doctype html>

<html>
    <body>
        <div>Hello World</div>
    </body>
</html>                   
```