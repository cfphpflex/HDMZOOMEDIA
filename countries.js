var countries = new Class({
	Implements:Options,
	options:{countries:{}},
	initialize:function()
		{
			this.loadCountries();
		},
	loadCountries:function()
		{
			var myRequest = new Request.JSON({url: '/contact.cfm?q=countries',onComplete:this.setCountries.bind(this)}).get();
		},
	getCountries:function()
		{
			return this.options.countries;
		},
	setCountries:function(jsonCountries)
		{
			for(var i=0;i<jsonCountries.recordcount-1;i++)
				{
					this.options.countries[jsonCountries.data.country[i]] = jsonCountries.data.countrycode[i];
				}
		}
})
