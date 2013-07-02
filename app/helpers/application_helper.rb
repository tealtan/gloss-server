module ApplicationHelper

  def combine_highlight(selected_text, surrounding_text)
    if surrounding_text.include? selected_text
      split_text_array = surrounding_text.split(selected_text)

      if split_text_array[0].blank?
        if split_text_array[1].blank?
          content_tag(:p, content_tag(:span, selected_text, class:"selected"))
        else
          content_tag(:p, content_tag(:span, selected_text, class:"selected") + split_text_array[1].html_safe)
        end        
      else
        if split_text_array[1].blank?
          content_tag(:p, split_text_array[0].html_safe + content_tag(:span, selected_text, class:"selected"))
        else
          content_tag(:p, split_text_array[0].html_safe + content_tag(:span, selected_text, class:"selected") + split_text_array[1].html_safe)
        end
      end
    else
      content_tag(:p, surrounding_text, class:"selected")
    end
  end

end
