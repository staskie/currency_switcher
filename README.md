# Currency Switcher

## Description

This is a small library that converts currencies using exchange rates from http://exchange-rates.org web site.

## Installation

$ gem install currency_switcher

## Usage

From the available list of currencies you can create methods in a format specified below and call them on Fixnums:

	'from_currency'_to_'to_currency'

For example:

	require 'currency_switcher'
	3.usd_to_gbp # => converts 3 American Dollars to British Pounds
	15.eur_to_aud # => converts 15 Euros to Australian Dollars
	
## Available Currencies

	aed => United Arab Emirates Dirham
	amd => Armenian Dram
	ang => Netherlands Antillian Guilder
	ars => Argentine Peso
	aud => Australian Dollar
	bbd => Barbados Dollar
	bdt => Bangladeshi Taka
	bgn => Bulgarian Lev
	bhd => Bahraini Dinar
	bif => Burundi Franc
	bmd => Bermudian Dollar
	bnd => Brunei Dollar
	bob => Bolivian Boliviano
	brl => Brazilian Real
	bsd => Bahamian Dollar
	bwp => Botswana Pula
	byr => Belarusian Ruble
	bzd => Belize Dollar
	cad => Canadian Dollar
	chf => Swiss Franc
	clp => Chilean Peso
	cny => Chinese Yuan Renminbi
	cop => Colombian Peso
	crc => Costa Rican Colon
	cup => Cuban Peso
	cve => Cape Verde Escudo
	czk => Czech Koruna
	djf => Djibouti Franc
	dkk => Danish Krone
	dop => Dominican Peso
	dzd => Algerian Dinar
	eek => Estonian Kroon
	egp => Egyptian Pound
	etb => Ethiopian Birr
	eur => Euro
	fjd => Fiji Dollar
	gbp => British Pound
	ghs => Ghanaian Cedi
	gmd => Gambian Dalasi
	gtq => Guatemalan Quetzal
	hkd => Hong Kong Dollar
	hnl => Honduran Lempira
	hrk => Croatian Kuna
	htg => Haitian Gourde
	huf => Hungarian Forint
	idr => Indonesian Rupiah
	ils => Israeli New Shekel
	inr => Indian Rupee
	iqd => Iraqi Dinar
	irr => Iranian Rial
	isk => Iceland Krona
	jmd => Jamaican Dollar
	jod => Jordanian Dinar
	jpy => Japanese Yen
	kes => Kenyan Shilling
	khr => Cambodian Riel
	krw => Korean Won
	kwd => Kuwaiti Dinar
	kyd => Cayman Islands Dollar
	kzt => Kazakhstan Tenge
	lak => Lao Kip
	lbp => Lebanese Pound
	lkr => Sri Lanka Rupee
	lsl => Lesotho Loti
	ltl => Lithuanian Litas
	lvl => Latvian Lats
	lyd => Libyan Dinar
	mad => Moroccan Dirham
	mdl => Moldovan Leu
	mmk => Myanmar Kyat
	mop => Macau Pataca
	mur => Mauritius Rupee
	mwk => Malawi Kwacha
	mxn => Mexican Peso
	myr => Malaysian Ringgit
	ngn => Nigerian Naira
	nio => Nicaraguan Cordoba Oro
	nok => Norwegian Krone
	npr => Nepalese Rupee
	nzd => New Zealand Dollar
	omr => Omani Rial
	pab => Panamanian Balboa
	pen => Peruvian Nuevo Sol
	php => Philippine Peso
	pkr => Pakistan Rupee
	pln => Polish Zloty
	pyg => Paraguay Guarani
	qar => Qatari Rial
	ron => Romanian Leu
	rsd => Serbian Dinar
	rub => Russian Ruble
	rwf => Rwanda Franc
	sar => Saudi Riyal
	scr => Seychelles Rupee
	sdd => Sudanese Dinar
	sek => Swedish Krona
	sgd => Singapore Dollar
	sos => Somali Shilling
	syp => Syrian Pound
	szl => Swaziland Lilangeni
	thb => Thai Baht
	tnd => Tunisian Dinar
	try => Turkish Lira
	ttd => Trinidad and Tobago Dollar
	twd => Taiwan Dollar
	tzs => Tanzanian Shilling
	uah => Ukraine Hryvnia
	ugx => Uganda Shilling
	usd => US Dollar
	uyu => Uruguay Peso
	vef => Venezuelan Bolivar
	vnd => Vietnamese Dong
	xaf => CFA BEAC Franc
	xcd => East Caribbean Dollar
	xof => CFA BCEAO Franc
	xpf => CFP Franc
	zar => South African Rand
	zmk => Zambian Kwacha
	zwd => Zimbabwe Dollar
