module Admin::ProductsHelper
  def option_type_select(so)
    select(:new_variant, 
           so.option_type.presentation, 
           so.option_type.option_values.collect {|ov| [ ov.presentation, ov.id ] })
  end

  def pv_tag_id(product_value)
    "product-property-value-#{product_value.id}"
  end

  def exclusive_properties(product, properties)
    product.property_values.each do |pv|
      properties.delete(pv.property)
    end
    properties
  end

  def use_tinymce
    @content_for_tinymce = "" 
    content_for :tinymce do
      javascript_include_tag "tiny_mce/tiny_mce"
    end
    @content_for_tinymce_init = "" 
    content_for :tinymce_init do
      javascript_include_tag "mce_editor"
    end
  end

end
