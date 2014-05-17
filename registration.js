
function Validate()
	{
	var introMessage = "Please check the following information:\n"
	var message = ""
	if (document.form.first_name.value == '')
		{
		message = message + "\n  - First Name is required";
		}
   	if (document.form.first_name.value.length > 100)
		{
		message = message + "\n  - First Name maximum length is 100";
		}
	if (document.form.last_name.value == '')
		{
		message = message + "\n  - Last Name is required";
		}
	if (document.form.last_name.value.length > 100)
		{
		message = message + "\n  - Last Name maximum length is 100";
		}
	if (document.form.title.value == '')
		{
		message = message + "\n  - Title is required";
		}
	if (document.form.specialty.value == '')
		{
		message = message + "\n  - Specialty is required";
		}
	if (document.form.telephone.value == '')
		{
		message = message + "\n  - Telephone is required";
		}
	 	
	if(message != "")
		{
			alert(introMessage + " " + message)
			return false;
		} 
	}
	
	
	function addOption(s)
	{
		var usr = 'option';
		if (s.value == 'other')
		{
			var title=s.getAttribute('id');
			var o_new, o_old;
			var bullet = '* ';
			while (usr == '' || usr == 'option')
				usr = prompt('Please enter the '+ title, '');
			if (null != usr)
			{
				if((title=='specialty')||(title=='title'))
				{
					usr='Other '+usr;	
				}
				
				var pos = s.selectedIndex;
				o_old = s.options[s.options.length];
				o_new = document.createElement('option');
				o_new.setAttribute('value', usr);
				o_new.appendChild(document.createTextNode(usr)); //remove red to maintain case
				s.insertBefore(o_new, o_old);
				s.selectedIndex = [s.options.length-1];
			return true;
			}
		}
		if (!usr || s.value == 'spacer')
			{
				s.selectedIndex = 0;
				return false;
			}
	}