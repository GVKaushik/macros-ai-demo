class MacrosController < ApplicationController
  def display_form
    render({:template=>"macro_templates/new_form"})
  end

  def do_magic
    @desc = params.fetch("desc_param")
    render({:template=>"macro_templates/process_inputs"})
  end
end
