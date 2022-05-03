function onopen(g)
{
	glob = g;
}

function onopentip(p)
{
	panel = p;
}

function on_tip_load()
{
	if (!panel.GetEnableDontShow())
	{
		DontText.innerText= "Don't show this window at startup. This option is only available when the program is registered";
		DontText.disabled = true;
		DontShowForm.DontShow.disabled = true;
	}
	
	numDays = panel.GetNumDays();
	if (numDays > 0) DaysText.innerText = "Only " + numDays + " days left in evaluation period!";
	else if (numDays == 0) DaysText.innerText = "Your evaluation period expires today!";
}

function set_dont_show_state(st)
{
	panel.SetDontShow(st);
}

function tip_close()
{
	panel.Close();
}

function tip_next()
{
	panel.TipNext();
}

