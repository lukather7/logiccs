

rails g model trailer company:references branch:references wheels:integer vehicleid:string number:string tire:string purchase:date image:string dealercompany:references


    t.integer  "company_id"
    t.integer  "branch_id"
 
    t.integer  "wheels"
    t.string   "vehicleid"
    t.string   "number"
 
    t.string   "tire"
 

    t.date     "purchase"
    t.string   "image"
    t.integer  "dealercompany_id"
    
    
   t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false