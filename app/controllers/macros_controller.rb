class MacrosController < ApplicationController
  def display_form
    render({:template=>"macro_templates/new_form"})
  end

  def do_magic
    @desc = params.fetch("desc_param")
    @image = params.fetch("image_param")
    @image_conv = DataURI.convert(@image)
    c = OpenAI::Chat.new
    c.system("You are an expert nutritionist. Estimate the macronutrients (carbohydrates, protein and fat) in grams, as well as in total calories in kcal.")
    c.user(@desc,image:@image)
    @result = c.assistant!



    render({:template=>"macro_templates/process_inputs"})
  end
end
