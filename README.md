# Seo Sensei

The Seo Sensei gem is a wrapper for [meta-tags](https://github.com/kpumuk/meta-tags) which allows to easily set meta tags inside your Rails application without extra configuration.

## Installation

    gem install seo_sensei

## Usage

Update your layout and in the `head` section render meta tags:

```ruby
= display_meta_tags
```

Update your translations and create `seo` section for your controllers:

```yaml
en:
  seo:
    articles:
      index:
        title: 'This is articles page'
```

Make it happen in your controller:

```ruby
class ArticlesController < ApplicationController
  enable_seo

  def index
    
  end
end
```

## Copyright

Copyright (c) 2019 Paweł Dąbrowski.
See [LICENSE][] for details.

[license]: LICENSE.md
