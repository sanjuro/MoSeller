
i = 0

prawn_document(:page_layout => :portrait)  do |pdf|

   pdf.define_grid(:columns => 2, :rows => 5)
   
   @order.order_items.each do |order_item|
		order_item.packages.each do |package|
		
			voucher_data = package.get_voucher
          	pos = i % 10                    # pos = label's position on the page (0-39) 
          	box = pdf.grid(pos / 2, pos % 2)    # lay labels out in 4 columns
          	pdf.start_new_page if pos == 0 && i != 0
          	
          	pdf.bounding_box box.top_left, :width => box.width, :height => box.height do     
            
            	pdf.image voucher_data[:image], :width => 110, :height => 80           
            	pdf.draw_text order_item.presentation , :at => [120,120], :size => 12, :style => :bold            
            	pdf.draw_text "To recharge, Dial" , :at => [120,100], :size => 7, :style => :bold            
            	pdf.draw_text voucher_data[:text], :at => [120,90], :size => 9           
            	pdf.draw_text package.payload, :at => [120,70], :size => 10, :style => :bold 
            
            	pdf.stroke do
              		pdf.rectangle(pdf.bounds.top_left, box.width, box.height)
            	end   
          	end
           
          	i += 1
		
		end
   end
end