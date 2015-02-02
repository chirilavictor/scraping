require 'json'
require 'nokogiri'
require 'open-uri'

url = 'http://www.restaurantul-hora.ro/meniu-restaurantul-hora/'
html = open(url)
doc = Nokogiri::HTML(html)

meniu_restaurant_hora = []

tabele_meniu = doc.search('table')

tabele_meniu.each do |tabel|
	if tabel.search('tr').search('td').at_css('.menu-category') != nil
		categorie = tabel.search('tr').search('td').at_css('.menu-category').text
		fel_mancare = tabel.search('tr').search('td').at_css('.menu-title').text
		cantitate = tabel.search('tr').search('td').at_css('.menu-qty').text
		pret = tabel.search('tr').search('td').at_css('.menu-price').text
	end
	meniu_restaurant_hora.push(
		categorie: categorie,
		fel_mancare: fel_mancare,
		cantitate: cantitate,
		pret: pret
		)
end

print meniu_restaurant_hora








