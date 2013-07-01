module ApplicationHelper

  def combine_highlight(selected_text, surrounding_text)
    if surrounding_text.include? selected_text
      split_text_array = surrounding_text.split(selected_text)
      content_tag(:p, split_text_array[0].html_safe + content_tag(:span, selected_text, class:"selected") + split_text_array[1].html_safe)
    else
      content_tag(:p, surrounding_text, class:"selected")
    end
  end

end
