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

### Custom information

If you want to display unique title for your article you can do this using the following code:

```ruby
class ArticlesController < ApplicationController
  def show
    seo_tags_with(@article)
  end
end
```

then update translations:

```yaml
en:
  seo:
    articles:
      show:
        title: 'This is article page - %{title}'
```

## TODO

* Make it easier to include assocation with soeable model in a Rails model

## Copyright

Copyright (c) 2019 Paweł Dąbrowski.
See [LICENSE][] for details.

[license]: LICENSE.md
