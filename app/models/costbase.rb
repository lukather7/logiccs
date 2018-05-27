class Costbase < ActiveRecord::Base
    belongs_to :company

    def brake_oil 
        return self.break_oil
    end
    
    def brake_oil=(num)
        self.break_oil = num
    end
    
   def pickupcost(mileage)
       except_array = [
           ["tm_oil", "air_filter", "brake_oil", "clutch_oil", "coolant", "clutch_kit", "battery", "timing_belt_eg", "timing_belt_ac", "wheel_grease" ],   #40000除外   
           ["tm_oil", "brake_oil", "clutch_oil", "coolant", "clutch_kit", "battery", "timing_belt_eg", "timing_belt_ac", "wheel_grease" ],     #80000
           ["air_filter", "coolant", "battery", "wheel_grease" ], #120000
           ["tm_oil", "brake_oil", "clutch_oil", "coolant", "clutch_kit", "battery", "timing_belt_eg", "timing_belt_ac", "wheel_grease" ], #160000
           ["tm_oil", "air_filter", "brake_oil", "clutch_oil", "coolant", "clutch_kit", "battery", "timing_belt_eg", "timing_belt_ac" ], #200000
           ["coolant", "battery", "wheel_grease" ], #240000
       ]
       index = (mileage / 40000) % 6
       except_parts = except_array[index]
        except_parts.each do |e|
           eval("self.#{e} = 0")
        end
        return self
   end    
    
end
