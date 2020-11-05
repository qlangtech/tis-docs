+++
# Note: use `../` for links to English pages.

# Hero widget.
widget = "hero"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = false  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 10  # Order that this section will appear.

title = "TIS"

# Hero image (optional). Enter filename of an image in the `static/img/` folder.
hero_media = "rocket.png"

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.

  # Background color.1284a9
  # color = "#107393"
  
  # Background gradient.
  # gradient_start = "#FFFFEA"
  # gradient_end = "#FFED66"
  
  # Background image.
  image = "home-background.jpg"  # Name of image in `static/img/`.
  # image_darken = 0.6  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
  #image_size = "contain" 
  # Text color (true=light or false=dark).
  text_color_light = true

# Call to action links (optional).
#   Display link(s) by specifying a URL and label below. Icon is optional for `[cta]`.
#   Remove a link/note by deleting a cta/note block.
[cta]
  url = "../docs/install/"
  label = "开始创建"
  icon_pack = "fas"
  icon = "rocket"
  
[cta_alt]
  url = "../user-stories/"
  label = "成功案例"

# Note. An optional note to show underneath the links.
[cta_note]
  label = '<a class="js-github-release" href="../updates/" data-repo="qlangtech/tis-solr">最新版本<!-- V --></a>'
+++

**基于SOLR的具有高性能、高可靠、高扩展性的企业级、一站式搜索中台产品**

利用TIS快速为您构建企业级搜索服务 <i class="fas fa-film pr-1" aria-hidden="true"></i>[TIS介绍]({{<relref "/docs/#视频">}})

<span style="text-shadow: none;"><a class="github-button" href="https://github.com/qlangtech/tis-solr" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star this on GitHub">Star</a><script async defer src="https://buttons.github.io/buttons.js"></script></span>
