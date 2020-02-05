-- servers
-- promisdev		-- development

-- dbs
-- promisdevelop	-- om promisdev


-- DevExpress certificate
-- pass		glupan2000


-- SCR-1587
-- citanje bakoda?
-- radni nalog barcode citanje ??
-- funkcionalnost focus radnog naloga na osnovu ocitanja barkoda?

-- SCR-1587


-- PROMIS CLIENT --
-- install links --
-- \\adrmk\rmk
-- \\adrmk\rmk\PromisDevelop

-- Prod   user/pass  marko.gudic/Marko123  


-- PROMIS CLIENT --

-- **** Stagging baza ****
 
-- Apex def.  Promis klijent za generiranje Primki.
-- APEX zaprimanje osnovnog pomocnog materijala
-- promis table -> temp table -> COPY -> APEXSTG.table(copy of temp) -> TRANSFER ->APEX@LinkedServer table 
-- StagingCopyTransferApex
-- kopiranje maticnih podataka iz Promisa
-- ulazne tablice iz Apexa(ApexStagingDevelop)
-- APEXSTG schema u bazi promis.


1. 
EXEC [APEXSTG].[spKonfiguracijaDomicilneVrijednostiPromis_Copy];
GO

EXEC [APEXSTG].[spKonfiguracijaDomicilneVrijednostiPromis_Transfer];
GO


2.
EXEC [APEXSTG].[spDjelatnikPromis_Copy];
GO

EXEC [APEXSTG].[spDjelatnikPromis_Transfer];
GO

3.
EXEC [APEXSTG].[spMaterijalnoDobroVarijantaRevizijaVelikaPromis_Copy];
GO

EXEC [APEXSTG].[spMaterijalnoDobroVarijantaRevizijaVelikaPromis_Transfer];
GO

4.
EXEC [APEXSTG].[spSkladistePromis_Copy];
GO

EXEC [APEXSTG].[spSkladistePromis_Transfer];
GO

5.
EXEC [APEXSTG].[spNarudzbenicaPromis_Copy];
GO

EXEC [APEXSTG].[spNarudzbenicaPromis_Transfer];
GO

6.
EXEC [APEXSTG].[spZahtjevnicaMaterijalaPromis_Copy];
GO

EXEC [APEXSTG].[spZahtjevnicaMaterijalaPromis_Transfer];
GO

7.
EXEC [APEXSTG].[spRadniCentarPromis_Copy];
GO

EXEC [APEXSTG].[spRadniCentarPromis_Transfer];
GO

8.
EXEC [APEXSTG].[spSkladisteZaIzdavanjePromis_Copy];
GO

EXEC [APEXSTG].[spSkladisteZaIzdavanjePromis_Transfer];
GO
9.
EXEC [APEXSTG].[spRadniCentarVrstePoslaPromis_Copy];
GO

EXEC [APEXSTG].[spRadniCentarVrstePoslaPromis_Transfer];
GO
10.
EXEC [APEXSTG].[spKvalitetaTipPromis_Copy];
GO

EXEC [APEXSTG].[spKvalitetaTipPromis_Transfer];
GO
11.
EXEC [APEXSTG].[spGreskeIzlazaPromis_Copy];
GO

EXEC [APEXSTG].[spGreskeIzlazaPromis_Transfer];
GO
12.
EXEC [APEXSTG].[spRadniNalogPromis_Copy];
GO

EXEC [APEXSTG].[spRadniNalogPromis_Transfer];
GO
13.
EXEC APEXSTG.spRadniNalogTrenutniStatusPromis_Copy
GO

EXEC APEXSTG.spRadniNalogTrenutniStatusPromis_Transfer
GO
14.
if (
select count(*) 
 FROM [msdb].[dbo].[sysjobsteps]
where [last_run_outcome] = 0 AND step_id <> 14 and job_id = (
select job_id from dbo.sysjobs
where name = 'StagingCopyTransferApex')
) > 0
BEGIN
	RAISERROR('Failure detected in StagingCopyTransfer.', 17, 1)
END

-- StagingCopyGeneriranjeApex
-- zahtjevi Apexa prema Promis-u, zaprimanje primki iz Apex-a
-- APEX@LinkedServer table -> temp table -> Promis.APEXTG table

1.
EXEC [APEXSTG].[spPrimkaApex_Transfer]
GO

2.
SET DEADLOCK_PRIORITY LOW
GO

EXEC [APEXSTG].[spApexGeneriranjePrimke_Parent]
GO

3.
EXEC [APEXSTG].[spPrimkaPromis_Transfer]
GO

4.
EXEC [APEXSTG].[spMedjuskladisnicaApex_Transfer]
GO

5.
SET DEADLOCK_PRIORITY LOW
GO

EXEC [APEXSTG].[spApexGeneriranjeMedjuskladisnice_Parent]
GO

6.
EXEC [APEXSTG].[spMedjuskladisnicaPromis_Transfer]
GO

7.
EXEC [APEXSTG].[spKvalitetaApex_Transfer]
GO

8.
SET DEADLOCK_PRIORITY LOW
GO

EXEC [APEXSTG].[spApexGeneriranjeKvalitete_Parent]
GO

9.
EXEC [APEXSTG].[spKvalitetaPromis_Transfer]
GO

10.
EXEC [APEXSTG].[spStornoPrimkaApex_Transfer]
GO

11.
SET DEADLOCK_PRIORITY LOW
GO

EXEC [APEXSTG].[spApexGeneriranjeStornoPrimke_Parent]
GO

12.
EXEC [APEXSTG].[spStornoPrimkaPromis_Transfer]
GO

13.
EXEC [APEXSTG].[spDostavnicaApex_Transfer]
GO
14.
EXEC [APEXSTG].[spApexGeneriranjeDostavnice_Parent]
GO
15.
EXEC [APEXSTG].[spDostavnicaPromis_Transfer]
GO
16.
if (
select count(*) 
 FROM [msdb].[dbo].[sysjobsteps]
where [last_run_outcome] = 0 AND step_id <> 16 and job_id = (
select job_id from dbo.sysjobs
where name = 'StagingCopyGeneriranjeApex')
) > 0
BEGIN
	RAISERROR('Failure detected in StagingCopyTransfer.', 17, 1)
END
-- Napomena: Podatci iz APEX-a koji se iskljucivo propagiraju u Promis tabele(ne U APEXSTG schemu) vidljivi su u child procedurama  
-- **** Stagging baza ****

-- *************************************************
-- saop integracija
-- headers
-- ID: 2
-- user: testapiadp
-- pass: pia2019

-- *************************************************

-- CODE GENERATOR
-- ishodište generiranja je tablica(view), iz nje se generiraju class, CRUD procedure
-- CODE GENERATOR


-- APP: DIGITALNI FORMULARI
SELECT	* FROM	ADPMasterData.Aplikacija.vActiveDirectoryUser AS ADU	WHERE ADU.Prezime LIKE '%Gudi%' -- lista usera

-- APP: DIGITALNI FORMULARI

-- PROMIS
	frmICDRackPartTablica		-- Column "S"  checkbox example
	EvidencijaOvjeraproizvoda
-- PROMIS
