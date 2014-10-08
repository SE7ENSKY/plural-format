$.fn.pluralFormat = (value, formats = null) ->
	value10 = value % 10
	@each ->
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
			format = if formats then formats[preferredFormat]
			else $(@).attr "data-plural-format-#{preferredFormat}"
			
			if format
				$(@).html format.replace '{0}', value
				break
