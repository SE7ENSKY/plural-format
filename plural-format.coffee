###! SE7ENSKY/plural-format | 1.0.0 | https://github.com/SE7ENSKY/plural-format ###

pluralFormat = (value, formats) ->
	value10 = value % 10
	preferredFormats = if value is 0 then [ "zero", "other" ]
	else if value is 1 then [ "one", "single", "other" ]
	else if value is 11 or value is 12 then [ "many", "other" ]
	else if value10 is 1 then [ "one", "other" ]
	else if value10 is 2 then [ "two", "few", "other" ]
	else if value10 is 0 then [ "many", "few", "other" ]
	else if (value < 10 or value > 20) and 3 <= value10 <= 4 then [ "few", "many", "other" ]
	else if value <= 20 then [ "many", "few", "other" ]
	else if 5 <= value10 <= 9 then [ "many", "few", "other" ]

	for preferredFormat in preferredFormats
		format = if typeof formats is 'function' then formats preferredFormat
		else formats[preferredFormat]
		
		return format.replace '{0}', value if format

	return null

$.fn.pluralFormat = (value = null, formats = null) ->
	@each ->
		thisValue = value
		thisValue = parseInt $(@).text() if thisValue is null
		formattedValue = pluralFormat thisValue, if formats then formats else (name) =>
			$(@).attr "data-plural-format-#{name}"
		
		$(@).html if formattedValue then formattedValue else thisValue
