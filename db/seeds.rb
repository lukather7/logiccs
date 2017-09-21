# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.find_or_create_by(name_j: "タイ日本通運株式会社", name_e: "Nippon Express (Thailand) Co., Ltd.")
Company.find_or_create_by(name_j: "A.N.I. Logisitics", name_e: "A.N.I. Logisitics")
Company.find_or_create_by(name_j: "日本梱包運輸倉庫（タイランド）", name_e: "Thai Nippon Konpo Co., Ltd.")
Company.find_or_create_by(name_j: "山九レムチャバン株式会社", name_e: "Sankyu Leacmchabang")
Company.find_or_create_by(name_j: "山九タイ株式会社", name_e: "Sankyu Thai Co., Ltd.")
Company.find_or_create_by(name_j: "タイバージ コンテナサービス株式会社", name_e: "Thai Berge Container Service Co., Ltd.")
Company.find_or_create_by(name_j: "タイ日新", name_e: "Siam Nistrans Co., Ltd.")
Company.find_or_create_by(name_j: "Honda Logisitcs Asia Co., Ltd.", name_e: "Honda Logisitcs Asia Co., Ltd.")
Company.find_or_create_by(name_j: "AAL Transportation Co., Ltd.", name_e: "AAL Transportation Co., Ltd.")
Company.find_or_create_by(name_j: "Logitem (Thailand) Co., Ltd.", name_e: "Logitem (Thailand) Co., Ltd.")
Company.find_or_create_by(name_j: "西尾レントオール（タイランド）", name_e: "Nishio Rent All (Thailand) Co., Ltd.")
Company.find_or_create_by(name_j: "タイ・マックス・コールドストレージ", name_e: "Thaimax Cold Storage Co., Ltd.")
Company.find_or_create_by(name_j: "Kamekyu Thailand Ltd.", name_e: "Kamekyu Thailand Ltd.")
Company.find_or_create_by(name_j: "Ikeda (Thailand) Co., Ltd.", name_e: "Ikeda (Thailand) Co., Ltd.")
#Company.find_or_create_by(name_j: "", name_e: "")

c_id = Company.find_by(name_e: "Nippon Express (Thailand) Co., Ltd.")

if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Lakrabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Leamchabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Rayong")
	Branch.find_or_create_by(company_id: c_id.id, name: "Ayuthaya")
end

c_id = Company.find_by(name_e: "A.N.I. Logisitics")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Rojana")
	Branch.find_or_create_by(company_id: c_id.id, name: "Prachinburi")
end

c_id = Company.find_by(name_e: "Thai Nippon Konpo Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Wellgrow")
	Branch.find_or_create_by(company_id: c_id.id, name: "Leamchabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Bang-na")
end

c_id = Company.find_by(name_e: "Sankyu Leacmchabang")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Bowin")
	Branch.find_or_create_by(company_id: c_id.id, name: "Leamchabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Rayong")
end

c_id = Company.find_by(name_e: "Sankyu Thai Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Navanakorn")
end

c_id = Company.find_by(name_e: "Thai Berge Container Service Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Pathumthani")
	Branch.find_or_create_by(company_id: c_id.id, name: "Leamchabang")
end

c_id = Company.find_by(name_e: "Siam Nistrans Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Leamchabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Ayuthaya")
	Branch.find_or_create_by(company_id: c_id.id, name: "Chang-mai")
end
	
c_id = Company.find_by(name_e: "Honda Logisitcs Asia Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Rojana")
	Branch.find_or_create_by(company_id: c_id.id, name: "Bang-na")
	Branch.find_or_create_by(company_id: c_id.id, name: "Prachinburi")
end

c_id = Company.find_by(name_e: "AAL Transportation Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Wellgrow")
	Branch.find_or_create_by(company_id: c_id.id, name: "Prachinburi")
end

c_id = Company.find_by(name_e: "Logitem (Thailand) Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Bang-na")
	Branch.find_or_create_by(company_id: c_id.id, name: "Samrong")
	Branch.find_or_create_by(company_id: c_id.id, name: "Lakcy")
end

c_id = Company.find_by(name_e: "Nishio Rent All (Thailand) Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Lakrabang")
	Branch.find_or_create_by(company_id: c_id.id, name: "Rayong")
	Branch.find_or_create_by(company_id: c_id.id, name: "Chombri")
end

c_id = Company.find_by(name_e: "Thaimax Cold Storage Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Bang-na")
end

c_id = Company.find_by(name_e: "Kamekyu Thailand Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Bankadi")
end

c_id = Company.find_by(name_e: "Ikeada (Thailand) Co., Ltd.")
if (c_id != nil)
	Branch.find_or_create_by(company_id: c_id.id, name: "Pathumthani")
end