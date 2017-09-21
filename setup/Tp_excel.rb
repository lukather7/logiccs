require 'spreadsheet'


hash = {"company" => 0, "branch" => 1, "maker" => 2, "model_name" => 3, "category" => 4, "number_tire" => 5,
	"engine" => 6, "Company_ID" => 7, "number_vehicle" => 8, "Engine_oil" => 9, "Oil_filer" => 10,
	"Oil_filter_s" => 11, "Fuel_filter" => 12, "P.S_Oil" => 13, "T/M_oil" => 14, "Def_oil" => 15,
	"Air_cleaner" => 16, "Outer" => 17, "Air" => 18, "Cleanner_Inner" => 19, "Air_drier" => 20,
	"G.Wheel_oil" => 21, "Brake_oil" => 22, "Grease" => 23, "Coolant" => 24, "Grease" => 25,
	"CNG_filter" => 26, "Spark_plug" => 27, "Clutch_kit" => 28, "Battery" => 29, "Tire" => 30,
	"Filter" => 31, "P.S" => 32, "Oil" => 33 }

#p str
filepath =  "LgTruckProgram.xls"
book = Spreadsheet.open(filepath)                                                                  
sheet = book.worksheet('Model Truck ISUZU')                                                                              
sheet.each do |row|                                                                                          
    # 数式が入っているセルは .value で値を取得                                                                                  
  	# puts "#{row[0]} #{row[1]} #{row[2]} #{row[3].instance_of?(Spreadsheet::Formula) ? row[3].value : row[3]}"
	str = "#{row[0]} #{row[1]} #{row[2]} #{row[3]} #{row[4]} #{row[5]} #{row[6]} #{row[7]} #{row[8]} #{row[9]} "
	str += "#{row[10]} #{row[11]} #{row[12]} #{row[13]} #{row[14]} #{row[15]} #{row[16]} #{row[17]} #{row[18]} #{row[19]} "
	str += "#{row[20]} #{row[23]} #{row[22]} #{row[23]} #{row[24]} #{row[25]} #{row[26]} #{row[27]} #{row[28]} #{row[29]} "
	puts str

end  

p hash
