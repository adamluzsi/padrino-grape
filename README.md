padrino-grape
=============

Padrino support gem for make grape mountable 

### Example

```ruby
    class TestApi < Grape::API

      # you can extend alike not really mather
      include PadrinoGrape

      # now it's mountable in padrino

    end
```

## TODO

* make hook for padrino mount method so it will auto exteend grape inherited classes

