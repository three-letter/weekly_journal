# -*- encoding : utf-8 -*-
module AutoHelper
  def auto(data,selected_array, global_prefix = UUIDTools::UUID.timestamp_create, &corresponding_rules)
    data_or_url = judge_type(data, global_prefix, &corresponding_rules)
    selected_array_content = selected_array.map{|element| "'#{element}'"}.join(',')
    raw "<div id=\"#{global_prefix}_container\" class=\"_auto_container\"><div id=\"#{global_prefix}_center_container\" class=\"_auto_center_container\"><ul id=\"#{global_prefix}_selected\" class=\"_auto_selected\" ></ul><input type=\"text\" id=\"#{global_prefix}_to_select\" class=\"_auto_to_select\" /></div><ul id=\"#{global_prefix}_tips\" class=\"_auto_tips\"></ul></div><script>new auto(\"#{global_prefix}\", #{data_or_url},[#{selected_array_content}]);</script>"
  end

  private 
  def judge_type(data, global_prefix, &corresponding_rules)
    if data.class == Array
      result = {}
      data.each do |chinese_chars|
        pinyins = block_given? ? yield(chinese_chars) : first_letter_corresponding_rules(chinese_chars)
        result[pinyins].present? ? result[pinyins] << chinese_chars : result[pinyins] = [chinese_chars]
      end
      result.to_json.html_safe
    elsif data.class == Hash
      data.to_json.html_safe
    elsif data.class == String
    	"\"#{data}\""
	  end
  end

  def first_letter_corresponding_rules(chinese_chars)
	  Pinyin.t(chinese_chars, '-').split('-').map{|chinese_char| chinese_char[0]}.join('') 
	end
end

ActionView::Base.send :include, AutoHelper