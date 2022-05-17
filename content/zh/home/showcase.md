+++
widget = "slider"  # Use the Slider widget
headless = true  # This file represents a page section.
weight = 30
# ... Put Your Section Options Here (section position etc.) ...

# Slide interval.
# Use `false` to disable animation or enter a time in ms, e.g. `5000` (5s).
interval = 5000

# Minimum slide height.
# Specify a height to ensure a consistent height for each slide.
height = "700px"

[design.background]
  text_color_light = false


# Slides.
# Duplicate an `[[item]]` block to add more slides.
[[item]]
  title = "数据源"
  content = "方便的数据源定义"
  align = "left"  # Choose `center`, `left`, or `right`.

  # Overlay a color or image (optional).
  #   Deactivate an option by commenting out the line, prefixing it with `#`.
  overlay_color = "#666"  # An HTML color value.
  overlay_img = "show-case/ds-define.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.

  # Call to action button (optional).
  #   Activate the button by specifying a URL and button label below.
  #   Deactivate by commenting out parameters, prefixing lines with `#`.
 # cta_label = "Get Academic"
#  cta_url = "https://sourcethemes.com/academic/"
 # cta_icon_pack = "fas"
 # cta_icon = "graduation-cap"

[[item]]
  title = "宽表"
  content = "可视化宽表定义，强大的批流统一，一次定义宽表，批量、流式处理自动生成"
  align = "left"

  overlay_color = "#555"  # An HTML color value.
  overlay_img = "show-case/df-define.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.

[[item]]
  title = "宽表构建"
  content = "宽表构建进度可视化"
  align = "left"

  overlay_color = "#555"  # An HTML color value.
  overlay_img = "show-case/exec-visual.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.
  
[[item]]
  title = "近实时同步"
  content = "流式处理状态可观测、可控制"
  align = "left"

  overlay_color = "#555"  # An HTML color value.
  overlay_img = "show-case/incr-monitor.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.
  
[[item]]
  title = "强大的查询定义"
  content = "便捷的查询条件定义"
  align = "left"

  overlay_color = "#555"  # An HTML color value.
  overlay_img = "show-case/query-define.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.
  
[[item]]
  title = "Schema映射"
  content = "可视化Schema映射定义，定义灵活强大的索引结构"
  align = "left"

  overlay_color = "#555"  # An HTML color value.
  overlay_img = "show-case/schema-define.jpg"  # Image path relative to your `static/media/` folder.
  overlay_filter = 0  # Darken the image. Value in range 0-1.      
+++
