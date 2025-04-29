class MacrosController < ApplicationController
  def display_form
    render({:template=>"macro_templates/new_form"})
  end

  def do_magic
    @desc = params.fetch("desc_param")
    @image = params.fetch("image_param")
    @image_conv = DataURI.convert(@image)
    render({:template=>"macro_templates/process_inputs"})
  end
end
