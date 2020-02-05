// Datetime init from controls
DateTime dateTmeUnos = (DateTime)(new SqlDateTime(calDatumOvjere.SqlValue.Value.Year, calDatumOvjere.SqlValue.Value.Month,
	calDatumOvjere.SqlValue.Value.Day, timCal.SqlValue.Value.Hour, timCal.SqlValue.Value.Minute,
	timCal.SqlValue.Value.Second));

// regex mask input control
this.iudEvidProMinutePovecanjaZaOvjeraProizvoda.Properties.Mask.EditMask = "(\\-)?\\d+";
this.iudEvidProMinutePovecanjaZaOvjeraProizvoda.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.RegEx;
	