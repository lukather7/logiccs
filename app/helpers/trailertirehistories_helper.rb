module TrailertirehistoriesHelper

  def trailertire_sn(tirelast)
      tirelast != nil ? tirelast.serialno : "--"
  end

  def trailerlasttire(tirelast, trailer, index)
    last_t = trailertire_sn(tirelast)
    if (tirelast == nil)
        return link_to(last_t, new_trailertirehistory_path(trailer_id: trailer, index: index), class: "btn btn-success btn-xs",
          data:{toggle:"modal", target:"#modal-example"}, remote:true)
    else
        tirehistory = Trailer.find(trailer.id).tirehistories.where(index: index).last
        return link_to(last_t, edit_trailertirehistory_path(tirehistory.id), class: "btn btn-success btn-xs",
           data:{toggle:"modal", target:"#modal-example"}, remote:true)
    end
  end
  
  def lasttrailertiredate(tirehist)
    tirehist != nil && tirehist.purchasedate != nil ? tirehist.purchasedate.strftime("%Y/%m/%d") : "--"
  end

  def makearray_trailertire(trailer, histarray)
    h = histarray
    if (trailer.wheels == "12")
        rot_table = [
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8], h[9], h[10], h[11], h[12]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7], h[10], h[9], h[12], h[11]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8], h[9], h[10], h[11], h[12]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7], h[10], h[9], h[12], h[11]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8], h[9], h[10], h[11], h[12]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7], h[10], h[9], h[12], h[11]],
        ]
        rot_table[0]

    elsif (trailer.wheels == "8")
        rot_table = [
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
        ]
        rot_table[0]
    elsif (trailer.wheels == "FULL")
        rot_table = [
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
            [h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]],
            [h[0], h[2], h[1], h[4], h[3], h[6], h[5], h[8], h[7]],
        ]
        rot_table[0]
    end
          
  end

end
