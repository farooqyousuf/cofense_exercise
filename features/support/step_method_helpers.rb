module StepDefMethods
  def fanatics_lightbox(brand)
    case brand

      when "FAN"
        click_link('lightboxSaleCloseLink')

      else fail("No Lightbox!")
    end
  end

end
