#!/bin/bash

#rails g model company name_j name_e
#rails g model branch company:references name:string
#rails g model user company:references name:string email:string authorizer:boolean branch:references
rails g model truck company:references branch:references maker:string model:string body:string wheels:integer engine:string vehicleid:string number:string e_oil:integer tm_oil:integer tire:string
