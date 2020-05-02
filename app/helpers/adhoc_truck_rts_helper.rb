module AdhocTruckRtsHelper
    
    
  def adhoc_lasttire(truck, index)
    @adhoc_tirelist =  truck.adhocTruckRts.order("created_at")
    if (@adhoc_tirelist.count < index)
        return link_to("--", new_adhoc_truck_rt_path(truck_id: truck), class: "btn btn-success btn-xs text-center",
          data:{toggle:"modal", target:"#modal-example"}, remote:true)
    else
        date = @adhoc_tirelist[index - 1].date
        if (date != nil)
          return link_to(date.strftime("%Y/%m/%d"), edit_adhoc_truck_rt_path(@adhoc_tirelist[index - 1]), remote: true)
        else
          return link_to("---", edit_adhoc_truck_rt_path(@adhoc_tirelist[index - 1]), remote: true)
        end
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
  
  
  def check_replaced(prevtirelist, current_tirelist, tiresn)
    if (current_tirelist) 
      p = prevtirelist
      array = [ p.tire1sn, p.tire2sn, p.tire3sn, p.tire4sn, p.tire5sn, p.tire6sn,
            p.tire7sn, p.tire8sn, p.tire9sn, p.tire10sn, p.tire11sn, p.tire12sn, p.tire13sn ]
      eval("array.include?(current_tirelist.#{tiresn})");
    else
      return true;
    end
  end
  
end
