module ApplicationHelper

  def inclination(count, one, few, many)
    many if (count % 100).between?(11, 14)

    case count % 10
    when 1 then one
    when 2..4 then few
    else
      many
    end
  end

  # redcarpet markdown
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }
    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
      lax_spacing: true

    }

    renderer = ::Redcarpet::Render::HTML.new(options)
    markdown = ::Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
