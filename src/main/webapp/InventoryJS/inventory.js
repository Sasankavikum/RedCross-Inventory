function enablesubmit()
{
	if(document.getElementById("check").checked)
	{
		document.getElementById("subb").disabled = false;
	}
	else
	{
		document.getElementById("subb").disabled = true;
	}
}

