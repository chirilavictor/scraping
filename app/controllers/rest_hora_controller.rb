require 'open-uri'

class RestHoraController < ApplicationController

  def meniu_rest_hora
  	# deschidem pagina dorita cu metoda open si stocam tot html-ul in variabila @page
		@page = Nokogiri::HTML(open('http://www.restaurantul-hora.ro/meniu-restaurantul-hora/'))

		# acest array va deveni un array de hashuri mai tarziu
		@meniu_restaurant_hora = []
		@tabele_meniu = @page.search('table')# din tot html-ul @page selectam doar partea cu tabele

		# iteram in fiecare tabel si stocam numele categoriei în variabila @categorie
		@tabele_meniu.each do |tabel|
			if tabel.search('tr').search('td').at_css('.menu-category') != nil # e nevoie de conditia asta altfel primim o eroare la un moment dat
				@categorie = tabel.search('tr').search('td').at_css('.menu-category').text

				# din fiecare tabel selectam doar partea cu "tr"(un rand) si acolo iteram iarasi pentru fiecare tr/rand în parte
				tabel_tr = tabel.search('tr')
				tabel_tr.each do |tr|
					if tr.search('td').at_css('.menu-title') != nil # la fel ca mai sus e nevoie de aceasta verificare
						# stocam fiecare camp in variabila corespunzatoare
						@fel_mancare = tr.search('td').at_css('.menu-title').text
						@cantitate = tr.search('td').at_css('.menu-qty').text
						@pret = tr.search('td').at_css('.menu-price').text
					
					# in array-ul nostru impingem un hash pentru fiecare fel de mancare
					@meniu_restaurant_hora.push(
					categorie: @categorie,
					fel_mancare: @fel_mancare,
					cantitate: @cantitate,
					pret: @pret
					)
					end
				end
			end			
		end
  end

  def afisare_rezerva
  end
end
