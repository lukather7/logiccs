module AdhocTruckRtsHelper
    
    
  def adhoc_lasttire(truck, index)
    @adhoc_tirelist =  truck.adhocTruckRts.order("created_at")
    if (@adhoc_tirelist.count < index)
        return link_to("--", new_adhoc_truck_rt_path(truck_id: truck), class: "btn btn-success btn-xs text-center",
          data:{toggle:"modal", target:"#modal-example"}, remote:true)
    else
        date = @adhoc_tirelist[index - 1].created_at
        date.strftime("%Y/%m/%d")
    end
  end
  
  def get_adhoctire_data(truck, index)
    @adhoc_tirelist =  truck.adhocTruckRts.order("created_at")
    if (@adhoc_tirelist.count < index)
      return nil
    else
      @adhoc_tirelist[index - 1]
    end
    
  end
  
  
  def not_nill(parent, data)
    
    if parent == nil
      return " -- "
    elsif data != nil
      realdata =  eval "parent.#{data}"
      if (realdata != nil)
        return realdata
      else 
        return " -- "
      end
    else
      return " -- "
    end
  end
  
end
