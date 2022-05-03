

function onopen(global)
{
	ReportTable.innerHTML = global.HTMLReportStatus;
	return true;
}

function onclose(global)
{
	return true;
}
