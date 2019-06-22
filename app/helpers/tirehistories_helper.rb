module TirehistoriesHelper

  def tire_sn(tirelast)
      tirelast != nil ? tirelast.serialno : "--"
  end

  def lasttire(tirelast, truck, index)
    last_t = tire_sn(tirelast)
    if (tirelast == nil)
        return link_to(last_t, new_tirehistory_path(truck_id: truck, index: index), class: "btn btn-success btn-xs",
          data:{toggle:"modal", target:"#modal-example"}, remote:true)
    else
        tirehistory = Truck.find(truck.id).tirehistories.where(index: index).last
        return link_to(last_t, edit_tirehistory_path(tirehistory.id), class: "btn btn-success btn-xs",
           data:{toggle:"modal", target:"#modal-example"}, remote:true)
    end
  end
  
  def lasttiredate(tirehist)
    tirehist != nil && tirehist.purchasedate != nil ? tirehist.purchasedate.strftime("%Y/%m/%d") : "--"
  end

  def makearray_tire(truck, histarray)
    h = histarray
    if (truck.wheels == 10)
        rot_table = [
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8], h[9], h[10]],
            [h[0], h[5], h[6], h[9], h[10], h[1], h[2], h[7], h[8], h[3], h[4]],
            [h[0], h[7], h[8], h[9], h[10], h[3], h[4], h[5], h[6], h[1], h[2]],
            [h[0], h[7], h[8], h[3], h[4], h[9], h[10], h[1], h[2], h[5], h[6]],
            [h[0], h[5], h[6], h[1], h[2], h[9], h[10], h[3], h[4], h[7], h[8]],
        ]
        rot_table[0]

    elsif (truck.wheels == 6)
        rot_table = [
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6]],
            [h[0], h[3], h[4], h[1], h[2], h[5], h[6]],
            [h[0], h[3], h[4], h[5], h[6], h[1], h[2]],
            [h[0], h[1], h[2], h[5], h[6], h[3], h[4]],
            [h[0], h[5], h[6], h[1], h[2], h[3], h[4]],
        ]
        rot_table[0]
    elsif (truck.wheels == 4)
        rot_table = [
            # S     A     B     C    D
            [h[0], h[1], h[2], h[3], h[4]],
            [h[2], h[3], h[4], h[0], h[1]],
            [h[4], h[0], h[1], h[2], h[3]],
            [h[1], h[2], h[3], h[4], h[0]],
            [h[3], h[4], h[0], h[1], h[2]],
        ]
        rot_table[0]
    end
          
  end

end
