/*************************************************/
/******************** TABLES ********************/
/***********************************************/

/****** Object:  Table [dbo].[Admin_Analyse_Vote_Bureau_Membres]    Script Date: 20/07/2021 16:54:28 ******/
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME=N'Admin_Analyse_Vote_Bureau_Membres')
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[Admin_Analyse_Vote_Bureau_Membres](
		[Bureau] [nvarchar](max) NULL,
		[IdBureauBureau] [int] NULL,
		[Collegial] [nvarchar](max) NULL,
		[EtapeScellement] [int] NULL,
		[EtapeDepouillement] [int] NULL,
		[IdMembre] [int] NOT NULL,
		[President] [bit] NOT NULL,
		[Nom] [nvarchar](max) NOT NULL,
		[Prenoms] [nvarchar](max) NOT NULL,
		[CheckInGenerationKey] [bit] NOT NULL,
		[CheckInScellement] [bit] NOT NULL,
		[CheckInDepouillement] [bit] NOT NULL,
		[LastActionBureau] [nvarchar](max) NULL,
		[IdCollaborateur] [int] NOT NULL,
		[CleScellement] [nvarchar](max) NULL,
		[CleScellementHoraire] [nvarchar](max) NULL,
		[CleDepouillement] [nvarchar](max) NULL,
		[CleDepouillementHoraire] [nvarchar](max) NULL,
		[MailProfessionnel] [nvarchar](max) NULL,
		[MailPersonnel] [nvarchar](max) NULL,
		[MobileProfessionnel] [nvarchar](max) NULL,
		[RemoteInfo] [nvarchar](max) NULL,
		[ModeTest] [bit] NULL,
		[DateNaissance] [nvarchar](max) NULL,
		[Age] [int] NULL,
		[IdElection] [int] NOT NULL,
	 CONSTRAINT [PK_Admin_Analyse_Vote_Bureau_Membres_1] PRIMARY KEY CLUSTERED 
	(
		[IdMembre] ASC,
		[IdElection] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

if not exists (select * from sys.sysobjects D inner join sys.sysobjects T on T.id=D.parent_obj
	where D.name='DF_Admin_Analyse_Vote_Bureau_Membres_CheckInGenerationKey' and T.name='Admin_Analyse_Vote_Bureau_Membres')
BEGIN
	BEGIN TRANSACTION
	SET QUOTED_IDENTIFIER ON
	SET ARITHABORT ON
	SET NUMERIC_ROUNDABORT OFF
	SET CONCAT_NULL_YIELDS_NULL ON
	SET ANSI_NULLS ON
	SET ANSI_PADDING ON
	SET ANSI_WARNINGS ON
	COMMIT
	BEGIN TRANSACTION
	ALTER TABLE dbo.Admin_Analyse_Vote_Bureau_Membres ADD CONSTRAINT
		DF_Admin_Analyse_Vote_Bureau_Membres_CheckInGenerationKey DEFAULT 0 FOR CheckInGenerationKey
	ALTER TABLE dbo.Admin_Analyse_Vote_Bureau_Membres SET (LOCK_ESCALATION = TABLE)
	COMMIT
END
GO

/****** Object:  Table [dbo].[Admin_Analyse_Vote_Tour]    Script Date: 20/07/2021 16:57:50 ******/
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME=N'Admin_Analyse_Vote_Tour')
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[Admin_Analyse_Vote_Tour](
		[Tour] [nvarchar](max) NULL,
		[ScrutinTour] [nvarchar](max) NOT NULL DEFAULT '',
		[PAPDatabase] [nvarchar](max) NOT NULL,
		[NTourTour] [tinyint] NOT NULL,
		[Horaire] [nvarchar](max) NULL,
		[DateScellementUrnes] [nvarchar](max) NULL,
		[Debut] [nvarchar](max) NULL,
		[Fin] [nvarchar](max) NULL,
		[EtatAvancement] [int] NULL,
		[AvancementTour] [int] NULL,
		[Categories] [int] NULL,
		[CategoriesRepresentees] [int] NULL,
		[DateDebutDepotListe] [nvarchar](max) NULL,
		[DateMaxDepotListe] [nvarchar](max) NULL,
		[RemoteInfo] [nvarchar](max) NULL,
		[Libelle] [nvarchar](50) NULL,
		[DelaiCloseScrutin] [int] NULL,
		[Demo] [bit] NULL,
		[MDPSize] [int] NULL,
		[MDPAlpha] [int] NULL,
		[IdElection] [int] NOT NULL,
		[IdentificationElecteurs] [nvarchar](max) NOT NULL DEFAULT '',
	 CONSTRAINT [PK_Admin_Analyse_Vote_Tour_1] PRIMARY KEY CLUSTERED 
	(
		[NTourTour] ASC,
		[IdElection] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[Admin_Analyse_Vote_Urnes]    Script Date: 20/07/2021 16:59:06 ******/
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME=N'Admin_Analyse_Vote_Urnes')
BEGIN
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON
	CREATE TABLE [dbo].[Admin_Analyse_Vote_Urnes](
		[Urne] [nvarchar](max) NULL,
		[IdBureauUrne] [int] NULL,
		[ModeTest] [bit] NULL,
		[NTourUrne] [tinyint] NULL,
		[EtatUrne] [nvarchar](max) NULL,
		[DateEtat] [nvarchar](max) NULL,
		[Accord] [nvarchar](max) NULL,
		[NbListes] [int] NULL,
		[NbVotants] [nvarchar](max) NULL,
		[NbNonVotants] [int] NULL,
		[Etablissement] [nvarchar](max) NULL,
		[College] [nvarchar](max) NULL,
		[ScrutinUrne] [nvarchar](max) NULL,
		[Participation] [float] NULL,
		[Emargement] [int] NULL,
		[Bulletins] [int] NULL,
		[CoherenceVote] [nvarchar](max) NULL,
		[DateVote] [nvarchar](max) NULL,
		[LastActionUrne] [nvarchar](max) NULL,
		[Blancs] [nvarchar](max) NULL,
		[Nuls] [nvarchar](max) NULL,
		[PbBulletins] [nvarchar](max) NULL,
		[Quorum] [nvarchar](max) NULL,
		[QuorumAtteint] [nvarchar](max) NULL,
		[BureauMembresAction] [int] NULL,
		[NbScellement] [int] NULL,
		[NbDepouillement] [int] NULL,
		[Vote] [nvarchar](max) NULL,
		[IdUrne] [int] NOT NULL,
		[IdTour] [int] NOT NULL,
		[IdTourUrne] [int] NOT NULL,
		[HashDepouillement] [nvarchar](max) NULL,
		[RemoteInfo] [nvarchar](max) NULL,
		[IdElection] [int] NOT NULL,
	 CONSTRAINT [PK_Admin_Analyse_Vote_Urnes_1] PRIMARY KEY CLUSTERED 
	(
		[IdTourUrne] ASC,
		[IdElection] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__NbLis__5086CE36]  DEFAULT ((0)) FOR [NbListes]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__NbVot__517AF26F]  DEFAULT ((0)) FOR [NbVotants]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__NbNon__526F16A8]  DEFAULT ((0)) FOR [NbNonVotants]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__Parti__53633AE1]  DEFAULT ((0)) FOR [Participation]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__Bulle__54575F1A]  DEFAULT ((0)) FOR [Bulletins]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__Blanc__554B8353]  DEFAULT ((0)) FOR [Blancs]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Anal__Nuls__563FA78C]  DEFAULT ((0)) FOR [Nuls]

	ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [DF__Admin_Ana__PbBul__5733CBC5]  DEFAULT ((0)) FOR [PbBulletins]
	END
GO
if exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=N'Admin_Analyse_Vote_Urnes' and COLUMN_NAME=N'NbVotants' and DATA_TYPE<>N'nvarchar')
BEGIN
	ALTER TABLE Admin_Analyse_Vote_Urnes DROP CONSTRAINT [DF__Admin_Ana__NbVot__517AF26F]
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN NbVotants NVARCHAR(MAX)
	ALTER TABLE Admin_Analyse_Vote_Urnes DROP CONSTRAINT [DF__Admin_Ana__Blanc__554B8353]
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN [Blancs] NVARCHAR(MAX)
	ALTER TABLE Admin_Analyse_Vote_Urnes DROP CONSTRAINT [DF__Admin_Anal__Nuls__563FA78C]
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN [Nuls] NVARCHAR(MAX)
	ALTER TABLE Admin_Analyse_Vote_Urnes DROP CONSTRAINT [DF__Admin_Ana__PbBul__5733CBC5]
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN [PbBulletins] NVARCHAR(MAX)
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN [Quorum] NVARCHAR(MAX)
	ALTER TABLE Admin_Analyse_Vote_Urnes ALTER COLUMN [QuorumAtteint] NVARCHAR(MAX)
END
GO
/****** Object:  Index [PK_Admin_Analyse_Vote_Urnes_1]    Script Date: 03/11/2021 16:23:09 ******/
ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] DROP CONSTRAINT [PK_Admin_Analyse_Vote_Urnes_1] WITH ( ONLINE = OFF )
GO

/****** Object:  Index [PK_Admin_Analyse_Vote_Urnes_1]    Script Date: 03/11/2021 16:23:09 ******/
ALTER TABLE [dbo].[Admin_Analyse_Vote_Urnes] ADD  CONSTRAINT [PK_Admin_Analyse_Vote_Urnes_1] PRIMARY KEY CLUSTERED 
(
	[IdElection] ASC,
	[IdTourUrne] ASC,
	[IdUrne] ASC,
	[IdTour] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO




/****************************************************/
/******************** FONCTIONS ********************/
/**************************************************/

/******** DROP FUNCTION ********/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[Split]
GO


/******** CREATE FUNCTION ********/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Olivier Durand
-- Create date: 20/08/2017
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Split] 
(
	-- Add the parameters for the function here
	@Recherche nvarchar(max)
)
RETURNS 
@T TABLE 
(
	num int identity(1,1),
	chaine nvarchar(max)
)
AS
BEGIN
	set @Recherche=dbo.FN_TRANSLATE(UPPER(@Recherche),
		''ÀÁÂÃÄÅÉÈÊËÌÍÎÏ,;:!?*$£+-*.()[]{}ÒÓÔÕÖØÙÚÛÜÇÑŸ'', 
		''AAAAAAEEEEIIII           .      OOOOOOUUUUCNY'')

	declare 
		@I int=1,
		@Chaine nvarchar(max)='''',
		@C nvarchar(2)
	while @I<=len(@Recherche)
	begin
		set @C=substring(@Recherche,@I,1)
		if @C=''.'' set @C=substring(@Recherche,@I,2)
		if @C in ('' '',''. '') and @Chaine<>''''
		begin
			if not exists(select * from @T where chaine=@Chaine)
				insert @T values (@chaine)
			set @chaine=''''
		end
		else
			set @chaine=@chaine+left(@C,1)
		set @I=@I+1
	end
	if @Chaine<>''''
		if not exists(select * from @T where chaine=@Chaine)
			insert @T values (@chaine)

	RETURN 
END
' 
END
GO


/******** DROP FUNCTION ********/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_TRANSLATE]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[FN_TRANSLATE]
GO


/******** CREATE FUNCTION ********/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_TRANSLATE]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[FN_TRANSLATE] (@VALIN NVARCHAR (max),
                              @FROM NVARCHAR(256), @TO NVARCHAR(256)) 
RETURNS NVARCHAR (max)
AS 
BEGIN 
-- effets de bord
   IF @VALIN IS NULL
      RETURN NULL
   IF @FROM IS NULL OR @TO IS NULL
      RETURN NULL
	SET @VALIN=RTRIM(LTRIM(@VALIN))
   IF LEN(@VALIN) = 0
      RETURN @VALIN
-- initialisation
   DECLARE @I INTEGER
   DECLARE @OUT NVARCHAR(MAX)
   DECLARE @C NVARCHAR(3)
   DECLARE @P INT
   SET @OUT = ''''
-- lecture caractère par caractère
   SET @I =1
   WHILE @I <= LEN(@VALIN)
   BEGIN
	  SET @C= SUBSTRING(@VALIN, @I, 1)
	  if @C=''['' SET @C=''[[]''
	  if @C=''_'' SET @C=''[_]''
	  SET @P=PATINDEX(''%'' + @C+ ''%'', @FROM)

      IF @P > 0
      BEGIN
         IF LEN(@TO) >= @P
            SET @OUT = @OUT + SUBSTRING(@TO, @P, 1)
      END
      ELSE
         SET @OUT = @OUT + SUBSTRING(@VALIN, @I, 1)
      SET @I = @I + 1
   END
   RETURN @OUT
END' 
END
GO



/*****************************************************/
/******************** PROCEDURES ********************/
/***************************************************/

/****** Object:  StoredProcedure [dbo].[_Admin_Excel_Buttons]    Script Date: 25/06/2021 11:06:08 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Excel_Buttons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Excel_Buttons] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 25/06/2021
-- Description:	Liste de boutons de téléchargement des fichiers excel pour les contacts dans la partie "Administration"
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Excel_Buttons]
(
	@IdUser INT,
	@HeaderType INT --1: scrutins, 2: contacts, 3: support, 5: scrutins potentiels, 5: scrutins marques blanches
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SET FMTONLY OFF;

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

     DECLARE @T TABLE
	(
		Code INT NOT NULL,
		Libelle NVARCHAR(MAX),
		IsActif INT NOT NULL,
		ExecProcStockee NVARCHAR(MAX),-- nom de procédure stockée à effectuer et l'executer
		ParamRecherche BIT NOT NULL
	)

	IF (@HeaderType IN (0,2) AND exists (SELECT Role FROM @R where Role IN (1,2,6)))
		BEGIN
			INSERT @T
			VALUES 
				--(Code, Libelle, IsActif, ExecProcStockee, ParamRecherche)
				(1,'FICHIER_ADMINISTRATION_EXPORT_1',1,'DECLARE @C INT; EXEC [dbo].[_Admin_SAV_Contacts] ''%0'', '+convert(nvarchar, @IdUser)+', null,1,100000, @Count = @C',1),
				(2,'FICHIER_ADMINISTRATION_EXPORT_2',1,'DECLARE @C INT; EXEC [dbo].[_Admin_SAV_Contacts] ''%0'', '+convert(nvarchar, @IdUser)+', null,1,100000, @Count = @C',1),
				(3,'FICHIER_ADMINISTRATION_EXPORT_3',1,'DECLARE @C INT; EXEC [dbo].[_Admin_SAV_Contacts] ''%0'', '+convert(nvarchar, @IdUser)+', null,1,100000, @Count = @C',1),
				(4,'FICHIER_ADMINISTRATION_EXPORT_4',1,'EXEC [dbo].[_Admin_Excel_MB] '+convert(nvarchar, @IdUser)+', '+convert(nvarchar, @HeaderType)+'',0)
		END

	SELECT DISTINCT * FROM @T ORDER BY Code ASC
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Excel_MB]    Script Date: 29/06/2021 14:10:54 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Excel_MB]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Excel_MB] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 29/02/2021
-- Description:	Rassembler les informations décrivants une marque blanche
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Excel_MB] 
(
	@IdUser INT,
	@HeaderType INT --1: scrutins, 2: contacts, 3: support, 5: scrutins potentiels, 5: scrutins marques blanches
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SET FMTONLY OFF;

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

	--CONTACTS
	DECLARE @C TABLE
	(
		IdCompagny INT,
		IdUser INT,
		FirstName NVARCHAR(MAX),
		LastName NVARCHAR(MAX),
		Email NVARCHAR(MAX),
		Telephone NVARCHAR(MAX),
		ScrutinsContactEnCours INT,
		ScrutinsContactTermines INT,
		ScrutinsContactTotaux INT,
		PRIMARY KEY(IdUser, IdCompagny)
	)

	--COMPANY
	DECLARE @CY TABLE
	(
		CompanyName NVARCHAR(MAX),
		IdCompany INT
	)

	--MARQUES BLANCHES
	DECLARE @MB TABLE
	(
		IdMarque INT PRIMARY KEY,
		SiteDeParametrage NVARCHAR(MAX),
		MarqueName NVARCHAR(MAX),
		ScrutinsEnCours INT DEFAULT 0,
		ScrutinsTermines INT DEFAULT 0,
		ScrutinsTotaux INT DEFAULT 0,
		ScrutinsEntre6Et3Mois INT DEFAULT 0,
		ScrutinsMoins3Mois INT DEFAULT 0
	)

	--SIMULATION PAP
	DECLARE @SP TABLE
	(
		IdMarque INT,
		IdCompagny INT,
		IdElection INT PRIMARY KEY,
		TypeScrutin INT,
		IdEtat INT,
		Date1erTourDebut DATETIME NOT NULL
	)

	--UTILISATEURS
	DECLARE @U TABLE
	(
		Marque INT,
		IdUser INT PRIMARY KEY
	)

	--TYPE SCRUTIN
	DECLARE @TS TABLE
	(
		CSE INT,
		Referundum INT,
		Consultation INT,
		RPCA INT,
		AG INT,
		ElectionSimple INT,
		FCPE INT,
		IdMarque INT
	)

	--TABLE FINALE
	DECLARE @T TABLE
	(
		IdMarque INT  NOT NULL,
		MarqueName NVARCHAR(MAX),
		SiteDeParametrage NVARCHAR(MAX),
		IdUser INT NOT NULL,
		ContactFirstName NVARCHAR(MAX),
		ContactLastName NVARCHAR(MAX),
		ContactEmail NVARCHAR(MAX),
		ContactTelephone NVARCHAR(MAX),
		ContactScrutinsEnCours INT,
		ContactScrutinsTermines INT,
		ContactScrutinsTotaux INT,
		ScrutinsEnCours INT NOT NULL,
		ScrutinsTermines INT NOT NULL,
		ScrutinsTotaux INT NOT NULL,
		ScrutinsEntre6Et3Mois INT NOT NULL,
		ScrutinsMoins3Mois INT NOT NULL,
		NbCSE INT,
		NbReferundum INT,
		NbConsultation INT,
		NbRPCA INT,
		NbAG INT,
		NbElectionSimple INT,
		NbFCPE INT,
		PRIMARY KEY(IdUser, IdMarque)
	)

	IF (@HeaderType = 2 AND (SELECT Role FROM @R) IN (1,2,6))
		BEGIN
			--UTILISATEURS
			INSERT @U
			(
				Marque,
				IdUser
			)
			SELECT DISTINCT
				Marque,
				Id
			FROM UTILISATEURS
			INNER JOIN UTILISATEUR_ROLES UR ON UR.IdUser = Id
			WHERE Marque > 0 AND IdRole = 7

			--COMPANY
			INSERT @CY
			(
				CompanyName,
				IdCompany
			)
			SELECT DISTINCT
				Nom,
				Id
			FROM COMPANY CY

			--SIMULATION PAP
			INSERT @SP
				(IdMarque,
				IdCompagny,
				IdElection,
				TypeScrutin,
				IdEtat,
				Date1erTourDebut)
			SELECT DISTINCT
				Marque,
				IdCompany,
				Id,
				AEI.CodeVote,
				IdEtat,
				SP.Date1erTourDebut
			FROM SIMULATION_PAP SP
			INNER JOIN Admin_Election_Infos AEI ON AEI.IdElection=SP.Id
			WHERE Marque > 0

			--CONTACTS (de la compagnie)
			INSERT @C 
				(IdCompagny,
				IdUser,
				FirstName,
				LastName,
				Email,
				Telephone,
				ScrutinsContactEnCours,
				ScrutinsContactTermines,
				ScrutinsContactTotaux
				)
			SELECT DISTINCT
				C.IdCompany,
				C.IdUser,
				UPPER(dbo.FN_SupprAccent(LOWER(Prenoms))),				
				UPPER(dbo.FN_SupprAccent(LOWER(Nom))),
				dbo.FN_NormaliseMail(LOWER(Email)),
				dbo.FN_NormaliseMobile(Telephone), -- null par un vide
				0,
				0,
				0
			FROM CONTACTS C
			INNER JOIN @U U ON U.IdUser = C.IdUser
			INNER JOIN @CY CY ON CY.IdCompany=C.IdCompany
			INNER JOIN @SP SP ON SP.IdCompagny=C.IdCompany

			--MARQUES BLANCHES
			INSERT @MB
				(IdMarque,
				SiteDeParametrage,
				MarqueName)
			SELECT DISTINCT
				Marque,
				SiteDeParametrage,
				Nom
			FROM MARQUES_BLANCHES MB

			--DELETE @C WHERE IdUser IS NULL

			--Scrutins en cours
			;WITH P AS
			(
				SELECT 
					COUNT(DISTINCT IdElection) as NB, 
					IdMarque 
				FROM @SP SP
				WHERE IdEtat IN (1,2,5) 
				GROUP BY SP.IdMarque 
			)

			UPDATE @MB
				SET ScrutinsEnCours = NB
				FROM @MB MB
				INNER JOIN P ON P.IdMarque = MB.IdMarque	
	
			--Scrutins terminés
			;WITH P AS
			(
				SELECT
					COUNT(DISTINCT IdElection) AS NB,
					IdMarque
				FROM @SP SP
				WHERE IdEtat = 4
				GROUP BY SP.IdMarque
			)
			UPDATE @MB 
				SET ScrutinsTermines = NB
				FROM @MB MB
				INNER JOIN P ON P.IdMarque = MB.IdMarque

			--Scrutins Totaux
			;WITH P AS
			(
				SELECT
					COUNT(DISTINCT IdElection) AS NB,
					IdMarque
				FROM @SP SP
				WHERE IdEtat IN (1,2,4,5)
				GROUP BY SP.IdMarque
			)
			UPDATE @MB 
				SET ScrutinsTotaux = NB
				FROM @MB MB
				INNER JOIN P ON P.IdMarque = MB.IdMarque

			--Scrutins entre 6 et 3 mois
			;WITH P AS
			(
				SELECT
					COUNT(DISTINCT IdElection) AS NB,
					IdMarque
				FROM @SP SP
				WHERE DATEDIFF(dd, Date1erTourDebut, GETDATE()) BETWEEN 90 AND 180
				GROUP BY SP.IdMarque
			)
			UPDATE @MB 
				SET ScrutinsEntre6Et3Mois = NB
				FROM @MB MB
				INNER JOIN P ON P.IdMarque = MB.IdMarque

			--Scrutins inférieur à 3 mois
			;WITH P AS
			(
				SELECT
					COUNT(DISTINCT IdElection) AS NB,
					IdMarque
				FROM @SP SP
				WHERE DATEDIFF(dd, Date1erTourDebut, GETDATE()) < 90
				GROUP BY SP.IdMarque
			)
			UPDATE @MB 
				SET ScrutinsMoins3Mois = NB
				FROM @MB MB
				INNER JOIN P ON P.IdMarque = MB.IdMarque

			-- SUPPRIMER LES CONTACTS DOUBLONS
			;WITH P AS
			(
				SELECT
					FIRST_VALUE(FirstName) OVER (PARTITION BY IdUser ORDER BY IdCompagny ASC ROWS UNBOUNDED PRECEDING) AS PFirstName,
					FIRST_VALUE(LastName) OVER (PARTITION BY IdUser ORDER BY IdCompagny ASC ROWS UNBOUNDED PRECEDING) AS PLastName,
					IdUser
				FROM @C C
			)

			UPDATE @C
				SET FirstName = PFirstName, LastName = PLastName
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser


			;WITH P AS
			(
				SELECT
					FIRST_VALUE(Email) OVER (PARTITION BY IdUser ORDER BY IdCompagny ASC ROWS UNBOUNDED PRECEDING) AS PEmail,
					IdUser
				FROM @C C
				WHERE Email <> ''
			)

			UPDATE @C
				SET Email = PEmail
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser


			;WITH P AS
			(
				SELECT
					FIRST_VALUE(Telephone) OVER (PARTITION BY IdUser ORDER BY IdCompagny ASC ROWS UNBOUNDED PRECEDING) AS PTelephone,
					IdUser
				FROM @C C
				WHERE Telephone <> '' -- NUMERO PRESENT
			)

			UPDATE @C
				SET Telephone = PTelephone
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser

			--Scrutins Contact en cours
			;WITH P AS
			(
				SELECT 
					COUNT(DISTINCT SP.IdElection) as NB, 
					C.IdUSer 
				FROM @SP SP
				INNER JOIN @C C ON C.IdCompagny = SP.IdCompagny
				WHERE IdEtat IN (1,2,5) 
				GROUP BY IdUser 
			)

			UPDATE @C
				SET ScrutinsContactEnCours = NB
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser
	
			--Scrutins Contact terminés
			;WITH P AS
			(
				SELECT 
					COUNT(DISTINCT SP.IdElection) as NB, 
					C.IdUSer 
				FROM @SP SP
				INNER JOIN @C C ON C.IdCompagny = SP.IdCompagny
				WHERE IdEtat = 4
				GROUP BY IdUser
			)
			UPDATE @C
				SET ScrutinsContactTermines = NB
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser

			--Scrutins Contact Totaux
			;WITH P AS
			(
				SELECT 
					COUNT(DISTINCT SP.IdElection) as NB, 
					C.IdUSer 
				FROM @SP SP
				INNER JOIN @C C ON C.IdCompagny = SP.IdCompagny
				WHERE IdEtat IN (1,2,4,5)
				GROUP BY IdUser
			)
			UPDATE @C
				SET ScrutinsContactTotaux = NB
				FROM @C C
				INNER JOIN P ON P.IdUser = C.IdUser

			-- Nombres de type de scrutins
			INSERT @TS
				SELECT
					SUM(CASE WHEN SP.TypeScrutin = 4 THEN 1 ELSE 0 END) AS CSE,
					SUM(CASE WHEN SP.TypeScrutin = 5 THEN 1 ELSE 0 END) AS Referundum,
					SUM(CASE WHEN SP.TypeScrutin = 7 THEN 1 ELSE 0 END) AS Consultation,
					SUM(CASE WHEN SP.TypeScrutin = 8 THEN 1 ELSE 0 END) AS RPCA,
					SUM(CASE WHEN SP.TypeScrutin = 9 THEN 1 ELSE 0 END) AS AG,
					SUM(CASE WHEN SP.TypeScrutin = 11 THEN 1 ELSE 0 END) AS ElectionSimple,
					SUM(CASE WHEN SP.TypeScrutin = 12 THEN 1 ELSE 0 END) AS FCPE,
					SP.IdMarque
				FROM @SP SP
				WHERE SP.IdEtat <> 3
				--INNER JOIN @TS TS ON TS.IdMarque=SP.IdMarque
				GROUP BY SP.IdMarque

			INSERT @T
				(IdMarque,
				MarqueName,
				SiteDeParametrage,
				IdUser,
				ContactFirstName,
				ContactLastName,
				ContactEmail,
				ContactTelephone,
				ContactScrutinsEnCours,
				ContactScrutinsTermines,
				ContactScrutinsTotaux,
				ScrutinsEnCours,
				ScrutinsTermines,
				ScrutinsTotaux,
				ScrutinsEntre6Et3Mois,
				ScrutinsMoins3Mois,
				NbCSE,
				NbReferundum,
				NbConsultation,
				NbRPCA,
				NbAG,
				NbElectionSimple,
				NbFCPE)
			SELECT DISTINCT
				MB.IdMarque,
				MB.MarqueName,
				MB.SiteDeParametrage,
				C.IdUser,
				FirstName,
				LastName,
				Email,
				Telephone,
				isnull(C.ScrutinsContactEnCours, 0),
				isnull(C.ScrutinsContactTermines, 0),
				isnull(C.ScrutinsContactTotaux, 0),
				isnull(MB.ScrutinsEnCours, 0),
				isnull(MB.ScrutinsTermines, 0),
				isnull(MB.ScrutinsTotaux, 0),
				isnull(MB.ScrutinsEntre6Et3Mois, 0),
				isnull(MB.ScrutinsMoins3Mois, 0),
				isnull(TS.CSE, 0),
				isnull(TS.Referundum,0),
				isnull(TS.Consultation,0),
				isnull(TS.RPCA,0),
				isnull(TS.AG,0),
				isnull(TS.ElectionSimple,0),
				isnull(TS.FCPE,0)
			FROM @C C
			INNER JOIN @U U ON C.IdUser = U.IdUser
			INNER JOIN @MB MB ON MB.IdMarque = U.Marque
			LEFT JOIN @TS TS ON TS.IdMarque=MB.IdMarque
			--GROUP BY MB.IdMarque, MB.MarqueName, C.IdUser, LastName, FirstName, Email, Telephone, C.ScrutinsContactEnCours, C.ScrutinsContactTermines, C.ScrutinsContactTotaux, MB.SiteDeParametrage, MB.ScrutinsEnCours , MB.ScrutinsTermines, MB.ScrutinsTotaux, MB.ScrutinsEntre6Et3Mois, MB.ScrutinsMoins3Mois
			ORDER BY MB.MarqueName ASC, C.FirstName ASC
			
		END

	SELECT * FROM @T ORDER BY MarqueName, ContactLastName
END

GO


/****** Object:  StoredProcedure [dbo].[_Admin_Export]    Script Date: 02/07/2021 17:29:42 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Export]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Export] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 02/07/2021
-- Description:	Informations nécessaires (champs, libelle ...) à la génération du fichier excel dans la partie Administration
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Export] 
	@Code INT
AS
BEGIN
	--SET NOCOUNT ON;
	SET XACT_ABORT ON
	SET FMTONLY OFF

	DECLARE @V TABLE
	(
		Title NVARCHAR(MAX)
	)

    DECLARE @T TABLE
	(
		Visible BIT NOT NULL,
		Champ NVARCHAR(MAX),
		Libelle NVARCHAR(MAX),
		Typage NVARCHAR(MAX),
		FormatEcriture NVARCHAR(MAX)
	)

	IF (@Code = 1)
		BEGIN
			INSERT @V
			VALUES
				--(Title)
				('Les Contacts')

			INSERT @T
			VALUES 
				--(Visible, Champ, Libelle, Typage, FormatEcriture)
				(1,'Company', 'Entreprise', 'string',null),
				(1,'FirstName,LastName','Prénom Et Nom','string',null),
				(1,'Quality','Qualité','string',null),
				(1,'Email','Email','string',null),
				(1,'Telephone','Téléphone','string',null),
				(1,'Adresse2,Adresse3,BoitePostale','Complément Adresse','string',null),
				(1,'Adresse1','Adresse','string',null),
				(1,'CodePostal','Code Postal','string',null),
				(1,'Ville','Ville','string',null),
				(1,'Pays','Pays','string',null)
		END

	IF (@Code = 2)
		BEGIN
			INSERT @V
			VALUES
				--(Title)
				('Les Adresses des Contacts au format de La Poste')

			INSERT @T
			VALUES 
				--(Visible, Champ, Libelle, Typage, FormatEcriture)
				(1,'Company', 'Civilité/Entreprise', 'string', 'Société {0}'), --faire un string format en c#
				(1,'FirstName,LastName','Prénom et Nom','string', 'A l''attention de {0} {1}'), --firstName sera %0 et lastName %1
				(1,'Adresse2,Adresse3,BoitePostale','Complément Adresse','string',null),
				(1,'Adresse1','Adresse','string',null),
				(1,'CodePostal','Code Postal','string',null),
				(1,'Ville','Ville','string',null),
				(1,'Pays','Pays','string',null)
		END

	IF (@Code = 3)
		BEGIN
		INSERT @V
			VALUES
				--(Title)
				('Les Contacts pour la Newsletter')

			INSERT @T
			VALUES 
				--(Visible, Champ, Libelle, Typage, FormatEcriture)
				(1,'Email', 'Email', 'string',null)
		END

	IF (@Code = 4)
		BEGIN
			INSERT @V
			VALUES
				--(Title)
				('Les Marques Blanches')

			INSERT @T
				VALUES
					--(Visible, Champ, Libelle, Typage, FormatEcriture)
					(0,'IdMarque', 'N° de la marque blanche dans la base', 'int',null),
					(1,'MarqueName', 'Nom de la marque blanche', 'string',null),
					(1,'SiteDeParametrage', 'Site de Paramétrage', 'string',null),
					(0,'IdUser', 'N° utilisateur dans la base', 'string',null),
					(1,'ContactFirstName', 'Prénom du contact', 'string',null),
					(1,'ContactLastName', 'Nom du contact', 'string',null),
					(1,'ContactEmail', 'Email du contact', 'string',null),
					(1,'ContactTelephone', 'Téléphone du contact', 'string',null),
					(1,'ContactScrutinsEnCours', 'Scrutins en cours du contact', 'string', null),
					(1, 'ContactScrutinsTermines', 'Scrutins terminés du contact', 'string', null),
					(1, 'ContactScrutinsTotaux', 'Scrutins totaux du contact', 'string', null),
					(1,'ScrutinsEnCours', 'Nombre de scrutins en cours', 'int',null),
					(1,'ScrutinsTermines', 'Nombre de scrutins terminés', 'int',null),
					(1,'ScrutinsTotaux', 'Nombre de scrutins totaux', 'int',null),
					(1,'ScrutinsEntre6Et3Mois', 'Nombre de scrutins entre 6 et 3 mois', 'int',null),
					(1,'ScrutinsMoins3Mois', 'Nombre de scrutins de moins de 3 mois', 'int',null),
					(1,'NbCSE', 'Nombre de CSE', 'int',null),
					(1,'NbReferundum', 'Nombre de Referundums', 'int',null),
					(1,'NbConsultation', 'Nombre de Consultations', 'int',null),
					(1,'NbRPCA', 'Nombre de RCPA', 'int',null),
					(1,'NbAG', 'Nombre AG', 'int',null),
					(1,'NbElectionSimple', 'Nombre Elections Simples', 'int',null),
					(1,'NbFCPE', 'Nombre FCPE', 'int',null)
		END
	SELECT * FROM @V, @T
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_General_Menu]    Script Date: 15/06/2021 11:28:16 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_General_Menu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_General_Menu] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 19/04/2021
-- Description:	Affichage de la barre latérale gauche de la partie administration
-- =============================================
ALTER PROCEDURE  [dbo].[_Admin_General_Menu] 
(
	@IdUser INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SET FMTONLY OFF;

    -- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)
	
	--TABLE DES STATUTS : SAVOIR SI UNE ELECTION EST A VENIR, EN COURS OU PASSEE
	DECLARE @StatutElection INT
	SELECT @StatutElection= MIN(
		CASE 
		WHEN dbo.GetRealDate() between Date1erTourDebut and Date1erTourFin THEN 1
		WHEN dbo.GetRealDate() between DATEADD(dd,-7,Date1erTourDebut) and Date1erTourDebut THEN 2
		ELSE 3
		END)
	FROM Admin_Election_Infos	
	
	--TABLE POUR LE MENU DE GAUCHE AVEC TOUTES SES OPTIONS
	DECLARE @T TABLE 
		(
		Statut int not null,
		Code int,
		Libelle nvarchar(max),
		AideContent nvarchar(max),
		AideTitle nvarchar(max),
		[Route] nvarchar(max),
		[Disabled] bit,
		Ordre INT
		)

	--ADMIN
	IF exists (select * from @R where Role=1)
		INSERT @T values
			--(Statut, Code, Libelle, AideContent, AideTitle, Route, Disabled, Ordre)
			(@StatutElection, 1,'ADMIN_SCRUTINS_LABEL','ADMIN_SCRUTINS_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_LABEL_AIDE_TITLE','ADMIN_SCRUTINS',0,0),
			(3,2,'ADMIN_CONTACTS_LABEL','ADMIN_CONTACTS_LABEL_AIDE_CONTENT','ADMIN_CONTACTS_LABEL_AIDE_TITLE','ADMIN_CONTACTS',0,0),
			(@StatutElection, 3,'ADMIN_SUPPORTS_LABEL', 'ADMIN_SUPPORTS_LABEL_AIDE_CONTENT', 'ADMIN_SUPPORTS_LABEL_AIDE_TITLE', 'ADMIN_SUPPORTS',0,0),
			(3, 4, 'ADMIN_SCRUTINS_POTENTIELS_LABEL','ADMIN_SCRUTINS__POTENTIELS_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_TITLE','ADMIN_SCRUTINS_POTENTIELS',0,0),
			(@StatutElection, 5, 'ADMIN_SCRUTINS_MB_LABEL', 'ADMIN_SCRUTINS_MB_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_MB_LABEL_AIDE_TITLE', 'ADMIN_SCRUTINS_MB',0,0)

	--COMMERCIAUX
	IF exists (select * from @R where Role=2)
		INSERT @T values
			--(Statut, Code, Libelle, AideContent, AideTitle, Route, Disabled, Ordre)
			(@StatutElection,1,'ADMIN_SCRUTINS_LABEL','ADMIN_SCRUTINS_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_LABEL_AIDE_TITLE','ADMIN_SCRUTINS',0,0),
			(3,2,'ADMIN_CONTACTS_LABEL','ADMIN_CONTACTS_LABEL_AIDE_CONTENT','ADMIN_CONTACTS_LABEL_AIDE_TITLE','ADMIN_CONTACTS',0,0)

	--SAV
	IF exists (select * from @R where Role=6)
		INSERT @T values 
			--(Statut, Code, Libelle, AideContent, AideTitle, Route, Disabled, Ordre)
			(@StatutElection,1,'ADMIN_SCRUTINS_LABEL','ADMIN_SCRUTINS_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_LABEL_AIDE_TITLE','ADMIN_SCRUTINS',0,0),
			(3,2,'ADMIN_CONTACTS_LABEL','ADMIN_CONTACTS_LABEL_AIDE_CONTENT','ADMIN_CONTACTS_LABEL_AIDE_TITLE','ADMIN_CONTACTS',0,0),
			(@StatutElection, 3,'ADMIN_SUPPORTS_LABEL', 'ADMIN_SUPPORTS_LABEL_AIDE_CONTENT', 'ADMIN_SUPPORTS_LABEL_AIDE_TITLE', 'ADMIN_SUPPORTS',0,0)

	--MB
	IF exists (select * FROM @R where Role=7)
		INSERT @T values
			(@StatutElection, 5, 'ADMIN_SCRUTINS_MB_LABEL', 'ADMIN_SCRUTINS_MB_LABEL_AIDE_CONTENT','ADMIN_SCRUTINS_MB_LABEL_AIDE_TITLE', 'ADMIN_SCRUTINS_MB',0,0)

	SELECT DISTINCT * INTO #T FROM @T 

	UPDATE #T
		SET Ordre = CASE Code WHEN 1 THEN 2
								WHEN 2 THEN 3
								WHEN 3 THEN 1
								WHEN 4 THEN 4
								WHEN 5 THEN 5
								ELSE 99
								END

	SELECT * FROM #T order by Ordre
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Header]    Script Date: 15/06/2021 09:36:37 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Header]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Header] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 20/04/2021
-- Description:	Affichage de l'entête du tableau des scrutins
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Header]
(
	@IdUser INT,
	@HeaderType INT, --1: scrutins, 2: contacts, 3: support, 5: scrutins potentiels, 5: scrutins marques blanches
	@PopIn INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SET FMTONLY OFF;
	
	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

	-- TABLE POUR L'ENTETE DU TABLEAU
	DECLARE @T TABLE 
		(
		HeaderCode INT,
		IsActif INT,
		Libelle NVARCHAR(MAX), --dictionnaire
		Ordre INT,
		Champ NVARCHAR(MAX), --nom interne js du champ
		ColonneSize INT -- 1 : texte, 2 : texte réduit, 3 : date, 4 : datetime(date + heure), 5 : email(mailto), 6 : href(web)
		)

		-- ATTENTION : CODE 0 POUR LES BOUTONS ET CODE 13 POUR LE STATUT QUAND IL Y EN A UN !


	-- SCRUTINS
	IF(@HeaderType = 1 AND @PopIn = 0)
		BEGIN
			INSERT @T 
			VALUES	
				--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
				(0,1,'ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS',0, 'buttons', 1),
				(1,1,'ADMIN_SCRUTIN_ENTETE_TITLE_COMPANY_NAME',1, 'companyName', 1),
				(8,1,'ADMIN_SCRUTIN_ENTETE_TITLE_TYPE_SCRUTIN',3, 'typeScrutin.libelleMini', 2),
				(9,1,'ADMIN_SCRUTIN_ENTETE_TITLE_NB_SALARIES',11, 'nbSalaries', 2),
				(10,1,'ADMIN_SCRUTIN_ENTETE_TITLE_AVANCEMENT',4, 'avancementScrutin', 1),
				(11,1,'ADMIN_SCRUTIN_ENTETE_TITLE_DATE_1ER_TOUR',9, 'date1erTour', 1),
				(12,1,'ADMIN_SCRUTIN_ENTETE_TITLE_DATE_2EME_TOUR',10, 'date2emeTour', 1),
				(13,0,'ADMIN_SCRUTIN_ENTETE_TITLE_STATUT',13, 'statut.libelle', 1)

			-- POUR LES ADMINS ET LE SAV
			INSERT @T 
			SELECT DISTINCT
				2,1,'ADMIN_SCRUTIN_ENTETE_TITLE_LIBELLE_APE',12, 'codeAPE', 1
			FROM @R where Role in (1, 6)

			INSERT @T 
			SELECT DISTINCT 
				3,1,'ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_NAME',6, 'contacts.firstName,contacts.name', 1
			FROM @R where Role in (1, 6)

			INSERT @T 
			SELECT DISTINCT 
				4,1,'ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_QUALITE',8, 'contacts.qualite', 2
			FROM @R where Role in (1, 6)

			INSERT @T 
			SELECT DISTINCT 
				5,1,'ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_TELEPHONE',7, 'contacts.telephone', 2
			FROM @R where Role in (1, 6)
	
			INSERT @T 
			SELECT DISTINCT 
				6,1,'ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_EMAIL',5, 'contacts.mail', 5
			FROM @R where Role in (1, 6)
	
			INSERT @T 
			SELECT DISTINCT 
				7,1,'ADMIN_SCRUTIN_ENTETE_TITLE_ID_ELECTION',2, 'idElection', 2
			FROM @R where Role in (1, 6)

		END


	-- CONTACTS
	IF(@HeaderType = 2 AND @PopIn = 0)
		BEGIN
			INSERT @T 
			VALUES	
				--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
				--(0,1,'ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS',0, 'buttons'),
				(1,1,'ADMIN_CONTACT_ENTETE_TITLE_COMPANY',1, 'company', 1),
				(2,1,'ADMIN_CONTACT_ENTETE_TITLE_FIRSTNAME',8, 'firstName', 1),
				(3,1,'ADMIN_CONTACT_ENTETE_TITLE_LASTNAME',9, 'lastName', 1),
				(4,1,'ADMIN_CONTACT_ENTETE_TITLE_QUALITY',10, 'quality', 2),
				(5,1,'ADMIN_CONTACT_ENTETE_TITLE_EMAIL',11, 'email', 5),
				(6,1,'ADMIN_CONTACT_ENTETE_TITLE_TELEPHONE',12, 'telephone', 2),
				(7, 1,'ADMIN_CONTACT_ENTETE_TITLE_ADRESSE', 13, 'adresse1,adresse2,adresse3,boitePostale,codePostal,ville,pays', 1)

		END


	-- SUPPORT
	IF(@HeaderType = 3 AND @PopIn = 0)
		BEGIN
			INSERT @T
			VALUES 
				--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
				(0, 1,'ADMIN_SUPPORT_ENTETE_TITLE_BUTTONS',0, 'buttons',1),
				(1, 1,'ADMIN_SUPPORT_ENTETE_TITLE_MARQUE',1, 'marque',2),
				(2, 1,'ADMIN_SUPPORT_ENTETE_TITLE_COMPANY',2, 'company',1),
				(3, 1,'ADMIN_SUPPORT_ENTETE_TITLE_ETAT',3, 'etat',1),
				(4, 1,'ADMIN_SUPPORT_ENTETE_TITLE_CODEVOTE',4, 'codeVote',1),
				(5, 1,'ADMIN_SUPPORT_ENTETE_TITLE_PAPDATABASE',5, 'pAPDatabase',1),
				(6, 1,'ADMIN_SUPPORT_ENTETE_TITLE_VERSIONAPI',6, 'versionAPI',2),
				(7, 1,'ADMIN_SUPPORT_ENTETE_TITLE_AVANCEMENT',7, 'avancement',1),
				(8, 1,'ADMIN_SUPPORT_ENTETE_TITLE_QUAND',8, 'quand',1),
				(9, 1,'ADMIN_SUPPORT_ENTETE_TITLE_SECURITE',9, 'securite',1),
				(10, 1,'ADMIN_SUPPORT_ENTETE_TITLE_TOURLABEL',10, 'tourLabel',1),
				(11, 1,'ADMIN_SUPPORT_ENTETE_TITLE_NBLISTE',11, 'nBListe',2),
				(12, 1,'ADMIN_SUPPORT_ENTETE_TITLE_NBSALARIESREELS',12, 'nBSalariesReels',2),
				(13,0,'ADMIN_SCRUTIN_ENTETE_TITLE_STATUT',13, 'statut.libelle', 1),
				(14, 1,'ADMIN_SUPPORT_ENTETE_TITLE_VOTANTS',14, 'votants',2),
				(15, 1,'ADMIN_SUPPORT_ENTETE_TITLE_EMARGEMENT',15, 'emargement',2),
				(16, 1,'ADMIN_SUPPORT_ENTETE_TITLE_URL',16, 'url',6),
				(17, 1,'ADMIN_SUPPORT_ENTETE_TITLE_PAPWEBSITE',17, 'pAPWebSite',6),
				(18,0,'ADMIN_SUPPORT_ENTENTE_TITLE_STATUT',18, 'statut.libelle', 1),
				(19,0,'ADMIN_SUPPORT_ENTETE_TITLE_IDELECTION',19,'idElection',2)

		END


	-- SUPPORT ANALYSE TOUR
	IF (@HeaderType = 3 AND @PopIn = 1)
		BEGIN
			INSERT @T
			VALUES
			--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
			(1,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_TOUR',1, 'tour',2),
			(2,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_SCRUTIN',2, 'scrutinTour',1),
			(3,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATABASE',3, 'pAPDatabase,',2),
			(4,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NTOUR',4, 'nTourTour',2),
			(5,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HORAIRE',5, 'horaire',1),
			(6,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_SCELLEMENT_URNES',6, 'dateScellementUrnes',1),
			(7,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEBUT',7, 'debut',1),
			(8,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_FIN',8, 'fin',1),
			(9,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_AVANCEMENT',9, 'etatAvancement',2),
			(10,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AVANCEMENT_TOUR',10, 'avancementTour',2),
			(11,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES',11, 'categories',2),
			(12,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES_REPRESENTEES',12, 'categoriesRepresentees',2),
			(13,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_DEBUT_DEPOT_LISTE',13, 'dateDebutDepotListe',1),
			(14,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_MAX_DEPOT_LISTE',14, 'dateMaxDepotListe',1),	
			(15,0,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_REMOTEINFO',15, 'remoteInfo',1),
			(16,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LIBELLE',16, 'libelle',1),
			(17,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DELAI_CLOSE_SCRUTIN',17, 'delaiCloseScrutin',2),
			(18,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEMO',18, 'demo',2),
			(19,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPSIZE',19, 'mDPSize',2),
			(20,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPALPHA',20, 'mDPAlpha',2),
			(21,0,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION',21, 'idElection',2),
			(22,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDENTIFICATION_ELECTEURS',22, 'identificationElecteurs',1)

		END


	-- SUPPORT ANALYSE BUREAUX
	IF (@HeaderType = 3 AND @PopIn = 2)
		BEGIN
			INSERT @T
			VALUES
			--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
			(1,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU',1, 'bureau',2),
			(2,0,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION',2, 'idElection',2),
			(3,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU',3, 'idBureauBureau',2),
			(4,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGIAL',4, 'collegial,',2),
			(5,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_SCELLEMENT',5, 'etapeScellement',1),
			(6,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_DEPOUILLEMENT',6, 'etapeDepouillement',1),
			(7,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_MEMBRE',6, 'idMembre',2),
			(8,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRESIDENT',7, 'president',2),
			(25,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AGE',8, 'age',2),
			(9,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NOM',9, 'nom',1),
			(10,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRENOMS',10, 'prenoms',1),
			(11,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_GENERATION_KEY',11, 'checkInGenerationKey',2),
			(12,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_SCELLEMENT',12, 'checkInScellement',2),
			(13,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_DEPOUILLEMENT',13, 'checkInDepouillement',2),
			(14,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LAST_ACTION',14, 'lastActionBureau',1),
			(15,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_COLLABORATEUR',15, 'idCollaborateur',1),
			(16,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT',16, 'cleScellement',1),
			(17,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT_HORAIRE',17, 'cleScellementHoraire',1),
			(18,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT',18, 'cleDepouillement',1),
			(19,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT_HORAIRE',19, 'cleDepouillementHoraire',1),
			(20,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PROFESSIONNEL',20, 'mailProfessionnel',5),
			(21,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PERSONNEL',21, 'mailPersonnel',5),
			(22,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MOBILE_PROFESSIONNEL',22, 'mobileProfessionnel',1),
			(23,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MODE_TEST',23, 'modeTest',2),
			(24,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_NAISSANCE',24, 'dateNaissance',1)
		END


	-- SUPPORT ANALYSE URNES
	IF (@HeaderType = 3 AND @PopIn = 3)
		BEGIN
			INSERT @T
			VALUES
			--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
			(1,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_URNE',1, 'urne',2),
			(2,0,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION',2, 'idElection',2),
			(3,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU',3, 'idBureauUrne',2),
			(4,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MODE_TEST',4, 'modeTest,',2),
			(5,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NTOUR',5, 'nTourUrne',2),
			(6,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_URNE',6, 'etatUrne',1),
			(7,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_ETAT',7, 'dateEtat',1),
			(8,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ACCORD',8, 'accord',1),
			(9,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_LISTES_OU_QUESTIONS',9, 'nbListes',2),
			(10,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_VOTANTS',10, 'nbVotants',2),
			(11,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_NON_VOTANTS',11, 'nbNonVotants',2),
			(12,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETABLISSEMENT',12, 'etablissement',2),
			(13,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGE',13, 'college',2),
			(14,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_SCRUTIN',14, 'scrutinUrne',2),
			(15,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PARTICIPATION',15, 'participation',2),
			(16,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_EMARGEMENT',16, 'emargement',2),
			(17,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BULLETINS',17, 'bulletins',2),
			(18,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COHERENCE_VOTE',18, 'coherenceVote',2),
			(19,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_VOTE',19, 'dateVote',1),
			(20,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LAST_ACTION',20, 'lastActionUrne',1),
			(21,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BLANCS',21, 'blancs',2),
			(22,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NULS',22, 'nuls',2),
			(23,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PB_BULLETINS',23, 'pbBulletins',2),
			(24,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM',24, 'quorum',2),
			(25,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM_ATTEINT',25, 'quorumAtteint',2),
			(26,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU_MEMBRES_ACTIONS',26, 'bureauMembresAction',2),
			(27,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_SCELLEMENT',27, 'nbScellement',2),
			(28,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_DEPOUILLEMENT',28, 'nbDepouillement',2),
			(29,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_VOTE',29, 'vote',1),
			(30,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_URNE',30, 'idUrne',2),
			(31,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR',31, 'idTour',2),
			(32,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR_URNE',32, 'idTourUrne',2),
			(33,1,'ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HASH_DEPOUILLEMENT',33, 'hashDepouillement',1)
		END


		-- SCRUTINS POTENTIELS
		IF (@HeaderType = 4 AND @PopIn = 0)
			BEGIN
				INSERT @T
				VALUES
				--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
				(1,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DATE',1,'date',1),
				(2,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PLANNING',2,'planning',2),
				(3,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS_POTENTIELLES',3,'electionsPotentielles',2),
				(4,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS',4,'elections',2),
				(5,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_POTENTIELS',5,'electeursPotentiels',2),
				(6,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_PREVUS',6,'electeursPrevus',2),
				(7,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_CONNECTES',7,'electeursConnectes',2),
				(8,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PERCENT',8,'percentage',2),
				(9,1,'ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DEMANDE_DE_CODE',9,'demandesDeCode',2)
			END


		-- SCRUTINS MB
		IF (@HeaderType = 5 AND @PopIn = 0)
			BEGIN
				INSERT @T 
				VALUES
				--(HeaderCode, IsActif, Libelle, Ordre, Champ, ColonneSize)
				(0,1,'ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS',0, 'buttons', 1),
				(1,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_COMPANY',1,'companyName',1),
				(2,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_TYPE_SCRUTIN',2, 'typeScrutin.libelleMini', 2),
				(3,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_NB_SALARIES',3, 'nbSalaries', 2),
				(4,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_AVANCEMENT',4, 'avancementScrutin', 1),
				(5,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_1ER_TOUR',5, 'date1erTour', 1),
				(6,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_2EME_TOUR',6, 'date2emeTour', 1),
				(7,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_EMAIL',7, 'contactsMB.mail', 5),
				(8,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_NAME',8, 'contactsMB.firstName,contactsMB.name', 1),
				(9,1,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_TELEPHONE',9, 'contactsMB.telephone', 2),
				(10,0,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_ID_ELECTION',10, 'idElection', 2),
				(13,0,'ADMIN_SCRUTIN_MB_ENTETE_TITLE_STATUT',13, 'statut.libelle', 1)
			END

	SELECT DISTINCT * FROM @T ORDER BY Ordre ASC

END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Contacts]    Script Date: 15/06/2021 09:55:06 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Contacts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Contacts] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 28/05/2021
-- Description:	Affichage page "Administration" => SAV => Contacts
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_SAV_Contacts] 
	@Recherche NVARCHAR(MAX),
	@IdUser INT,
	@FiltreCode INT,
	@Page INT,
	@PageSize INT,
	@Count INT OUTPUT
AS
BEGIN
	--SET NOCOUNT ON;
	SET XACT_ABORT ON
	SET FMTONLY OFF

	SELECT @Recherche = UPPER(TRIM(@Recherche));

    -- TABLE DES CHAINES DE CARACTERES ENREGISTREES SEPAREMENT
    DECLARE @ChaineDeRecherche TABLE (Chaine nvarchar(max))
    INSERT @ChaineDeRecherche
    SELECT Chaine FROM Split(@Recherche)

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

    -- TABLE CONTACT
	DECLARE @C TABLE 
		(FirstName NVARCHAR(MAX),
		LastName NVARCHAR(MAX),
		Company NVARCHAR(MAX),
		Quality NVARCHAR(MAX),
		Email NVARCHAR(MAX),
		Telephone NVARCHAR(MAX),
		Adresse1 NVARCHAR(MAX),
		Adresse2 NVARCHAR(MAX),
		Adresse3 NVARCHAR(MAX),
		BoitePostale NVARCHAR(MAX),
		CodePostal NVARCHAR(50),
		Ville NVARCHAR(MAX),
		Pays NVARCHAR(MAX))
	IF EXISTS (SELECT * FROM @ChaineDeRecherche)
	BEGIN
        UPDATE @ChaineDeRecherche SET Chaine = '%' + Chaine + '%' WHERE CHARINDEX('%', Chaine) = 0
		INSERT @C 
			(FirstName,
			LastName,
			Company,
			Quality,
			Email,
			Telephone,
			Adresse1,
			Adresse2,
			Adresse3,
			BoitePostale,
			CodePostal,
			Ville,
			Pays)
		SELECT DISTINCT 
			C.Prenoms,
			C.Nom,
			Cpy.Nom,
			C.Qualité,
			C.Email,
			C.Telephone,
			Cpy.Adresse1,
			Cpy.Adresse2,
			Cpy.Adresse3,
			Cpy.BoitePostale,
			Cpy.CodePostal,
			Cpy.Ville,
			Cpy.Supplement3
		FROM CONTACTS C
		INNER JOIN COMPANY Cpy ON C.IdCompany = Cpy.Id
		inner join @ChaineDeRecherche CH ON (C.Nom LIKE CH.Chaine OR C.Prenoms LIKE CH.Chaine OR Cpy.Nom LIKE CH.Chaine OR C.Email LIKE CH.Chaine OR C.Telephone LIKE CH.Chaine)

	END
	ELSE
		INSERT @C 
			(FirstName,
			LastName,
			Company,
			Quality,
			Email,
			Telephone,
			Adresse1,
			Adresse2,
			Adresse3,
			BoitePostale,
			CodePostal,
			Ville,
			Pays)
		SELECT DISTINCT 
			C.Prenoms,
			C.Nom,
			Cpy.Nom,
			C.Qualité,
			C.Email,
			C.Telephone,
			Cpy.Adresse1,
			Cpy.Adresse2,
			Cpy.Adresse3,
			Cpy.BoitePostale,
			Cpy.CodePostal,
			Cpy.Ville,
			Cpy.Supplement3
		FROM CONTACTS C
		INNER JOIN COMPANY Cpy ON C.IdCompany = Cpy.Id

	SELECT *, ROW_NUMBER() OVER(ORDER BY Company ASC) AS RowNumber
	INTO #C
	FROM @C C

	SELECT 
		@Count=COUNT(*)
	FROM #C

	DELETE #C WHERE NOT (@PageSize=0 OR (RowNumber BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

	SELECT
		FirstName,
		LastName,
		Company,
		Quality,
		Email,
		Telephone,
		Adresse1,
		Adresse2,
		Adresse3,
		BoitePostale,
		CodePostal,
		Ville,
		Pays	
	FROM #C C
	
	ORDER BY Company ASC
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Scrutins]    Script Date: 15/06/2021 09:55:17 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Scrutins]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Scrutins] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 06/04/2021
-- Description:	Affichage page "Administration" => SAV => Scrutins
-- =============================================
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 06/04/2021
-- Description:	Affichage page "Administration" => SAV => Scrutins
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_SAV_Scrutins] 
    @Recherche NVARCHAR(MAX),
    @IdUser INT,
	@FiltreCode INT,
	@Page INT,
	@PageSize INT,
	@Count INT OUTPUT
AS
BEGIN
    --SET NOCOUNT ON;
    SET XACT_ABORT ON 
    SET FMTONLY OFF
	SET LANGUAGE FRENCH

    SELECT @Recherche = UPPER(TRIM(@Recherche));
    --SELECT @Recherche --à mettre en comm

    -- TABLE DES CHAINES DE CARACTERES ENREGISTREES SEPAREMENT
    DECLARE @ChaineDeRecherche TABLE (Chaine nvarchar(max))
    INSERT @ChaineDeRecherche
    SELECT Chaine FROM Split(@Recherche)

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

    -- TABLE DU TYPE DE VOTE : CONTIENT LE TYPE SOUS FORMAT CHAINE ET CODE
    DECLARE @V TABLE (ChaineVote NVARCHAR(MAX), CodeVote INT)
    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
    BEGIN
        INSERT @V
        SELECT DISTINCT
            Chaine, 
            CASE WHEN Chaine = 'CSE' THEN 4
                WHEN Chaine = 'REFERUNDUM' OR Chaine ='REF' THEN 5
                WHEN Chaine = 'CONSULTATION' OR Chaine = 'CONS' THEN 7
                WHEN Chaine = 'ARP' THEN 8
                WHEN Chaine = 'AG' THEN 6
                WHEN Chaine = 'ELECTION' OR Chaine ='ELEC' THEN 11
                WHEN Chaine = 'FCPE' THEN 10
                ELSE 0
            END as CodeVote
        FROM @ChaineDeRecherche
        WHERE Chaine IN ('CSE', 'REFERUNDUM', 'REF', 'CONSULTATION', 'CONS', 'ARP', 'AG', 'ELECTION', 'ELEC', 'FCPE')
    END

    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
        DELETE CDR FROM @ChaineDeRecherche CDR INNER JOIN @V V ON V.ChaineVote = CDR.Chaine
  
    -- TABLE DE SORTIE
    DECLARE @T TABLE 
    (    PAPDatabase nvarchar(128),
		IdElection INT PRIMARY KEY,
        IdCompany INT,
        CompanyName NVARCHAR(MAX),
        CodeAPE NVARCHAR(MAX),
        ContactName NVARCHAR(MAX),
        ContactEmail NVARCHAR(MAX),
        TypeScrutin INT,
        NbSalaries INT,
		Date1erTourScellement DATETIME,
		Date1erTourDebut DATETIME not null, 
		Date1erTourFin DATETIME not null,
		Date2emeTourScellement DATETIME,
		Date2emeTourDebut DATETIME,
		Date2emeTourFin DATETIME,
        -- Temporaire
        Avancement int,
        Avancement1erTour int,
        Avancement2ndTour int,
        -- Pour le résultat
        AvancementScrutin NVARCHAR(MAX),
		Statut INT,
		Buttons NVARCHAR(MAX),
		AvecBureau BIT,
		SecuriteBureau TINYINT,
		VersionAPI NVARCHAR(50),
		EtatSimulationPAP INT
    )

    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
    BEGIN
        UPDATE @ChaineDeRecherche SET Chaine = '%' + Chaine + '%' WHERE CHARINDEX('%', Chaine) = 0 --va préparer le LIKE   

        INSERT @T 
            (IdCompany,
            IdElection,
			PAPDatabase,
            CompanyName, 
            CodeAPE, 
            TypeScrutin,
            NbSalaries, 
            AvancementScrutin,
            Avancement, Avancement1erTour, Avancement2ndTour,
			Date1erTourScellement,
            Date1erTourDebut, 
			Date1erTourFin,
			Date2emeTourScellement,
            Date2emeTourDebut,
			Date2emeTourFin,
			Statut,
			Buttons,
			AvecBureau,
			SecuriteBureau,
			VersionAPI,
			EtatSimulationPAP)
        SELECT DISTINCT
            C.Id,
            SP.Id, 
			SP.PAPDataBase,
            C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
            isnull(APE.Code, ''), 
            AEI.CodeVote, 
            AEI.NbSalaries, 
            -- Avancement
            '' as AvancementScrutin, 
            AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
			AEI.Date1erScellementUrnes,
            ISNULL(AEI.Date1erTourDebut, 0), 
			ISNULL(AEI.Date1erTourFin, 0),
			AEI.Date2emeScellementUrnes,
            AEI.Date2emeTourDebut,
			AEI.Date2emeTourFin,
			CASE 
				WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
				WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
				WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
				WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
				WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
				ELSE 3
				END,
			'',
			AEI.AvecBureau,
			AEI.SecuriteBureau,
			SP.VersionAPI,
			ESP.Code
        FROM COMPANY C
		--cross join @R R
        left join APE on C.IdBrancheActivite = APE.Id
        inner join CONTACTS Ct on C.Id = Ct.IdCompany
        inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
        inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
        inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
		inner join @ChaineDeRecherche CH ON (C.Nom LIKE CH.Chaine OR Ct.Nom LIKE CH.Chaine OR Ct.Prenoms LIKE CH.Chaine OR Ct.Email LIKE CH.Chaine OR convert(varchar, AEI.Date1erTourDebut, 103) LIKE CH.Chaine OR convert(varchar, AEI.Date2emeTourDebut, 103) LIKE CH.Chaine OR SP.Id LIKE CH.Chaine OR APE.Code LIKE CH.Chaine)
		WHERE (ESP.Code IN (1,2,4,5)) -- équivalent des OR et non des AND
			--AND SP.Demo=0
    END
    ELSE 
        INSERT @T 
            (IdCompany,
            IdElection,
			PAPDatabase,
            CompanyName, 
            CodeAPE, 
            TypeScrutin,
            NbSalaries, 
            AvancementScrutin,
            Avancement, Avancement1erTour, Avancement2ndTour,
            Date1erTourScellement,
            Date1erTourDebut, 
			Date1erTourFin,
			Date2emeTourScellement,
            Date2emeTourDebut,
			Date2emeTourFin,
			Statut,
			Buttons,
			AvecBureau,
			SecuriteBureau,
			VersionAPI,
			EtatSimulationPAP)
        SELECT DISTINCT
            C.Id,
            SP.Id,
			SP.PAPDatabase,
            C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
            isnull(APE.Code, ''), 
            AEI.CodeVote, 
            AEI.NbSalaries, 
            -- Avancement
            '' as AvancementScrutin, 
            AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
            AEI.Date1erScellementUrnes,
            ISNULL(AEI.Date1erTourDebut, 0), 
			ISNULL(AEI.Date1erTourFin, 0),
			AEI.Date2emeScellementUrnes,
            AEI.Date2emeTourDebut,
			AEI.Date2emeTourFin,
			CASE 
				WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
				WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
				WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
				WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
				WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
				ELSE 3
				END,
			'',
			AEI.AvecBureau,
			AEI.SecuriteBureau,
			SP.VersionAPI,
			ESP.Code
        FROM COMPANY C
		cross join @R R
        left join APE on C.IdBrancheActivite = APE.Id
        inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
        inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
        inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
        WHERE ESP.Code IN (1,2,5)
			--AND SP.Demo=0

    -- Delete des scrutin absents de la table @V s'il y a des filtres sur le type de vote
    IF EXISTS (SELECT * FROM @V)
        DELETE T FROM @T T LEFT JOIN @V V ON V.CodeVote=T.TypeScrutin WHERE V.CodeVote IS NULL

    -- Update AvancementScrutin pour le résultats
    UPDATE @T
    SET AvancementScrutin = CASE WHEN Avancement = 1 AND TypeScrutin = 4 THEN 'PAP'
								WHEN Avancement = 1 AND TypeScrutin <> 4 THEN 'Périmètre'
                                WHEN Avancement = 2 THEN 'Liste Electorale'
                                WHEN Avancement = 3 THEN 'Délais des 3 jours'
                                WHEN Avancement = 4 AND Avancement1erTour = 1 AND TypeScrutin = 4 THEN 'Liste de candidats 1er tour'
                                WHEN Avancement = 4 AND Avancement1erTour = 1 AND TypeScrutin <> 4 THEN 'Liste de candidats' -- <> : différent
                                WHEN Avancement = 4 AND Avancement1erTour = 2 AND TypeScrutin = 4 THEN 'Bureau de vote 1er tour'
                                WHEN Avancement = 4 AND Avancement1erTour = 2 AND TypeScrutin <> 4 THEN 'Bureau de vote' -- <> : différent
                                WHEN Avancement = 4 AND Avancement1erTour = 3 THEN 'Attente scrutin'
                                WHEN Avancement = 4 AND Avancement1erTour = 4 THEN 'Scrutin en cours'
								WHEN Avancement = 4 AND Avancement1erTour = 5 AND TypeScrutin = 4 THEN '1er tour terminé'
								WHEN Avancement = 4 AND Avancement1erTour = 5 AND TypeScrutin <> 4 THEN 'Terminé'
                                WHEN Avancement = 5 AND Avancement2ndTour = 1 AND TypeScrutin = 4 THEN 'Liste de candidats 2nd tour'
                                WHEN Avancement = 5 AND Avancement2ndTour = 1 AND TypeScrutin <> 4 THEN 'Liste de candidats' -- <> : différent
                                WHEN Avancement = 5 AND Avancement2ndTour = 2 AND TypeScrutin = 4 THEN 'Bureau de vote 2nd tour'
                                WHEN Avancement = 5 AND Avancement2ndTour = 2 AND TypeScrutin <> 4 THEN 'Bureau de vote' -- <> : différent
                                WHEN Avancement = 5 AND Avancement2ndTour = 3 THEN 'Attente scrutin'
                                WHEN Avancement = 5 AND Avancement2ndTour = 4 THEN 'Scrutin en cours'
								WHEN Avancement = 5 AND Avancement2ndTour = 5 THEN '2nd tour terminé'
                                WHEN Avancement = 6 THEN 'Terminé'
                                ELSE 'Inconnu'
                            END


	-- Delete par rapport à un nouveau champ filtre par rapport à ma procédure : calcul le statut puis delete les élections qui me concernent pas si le filtre est mis
    IF @FiltreCode=1
	DELETE @T WHERE ISNULL(Statut,3)=3

	SELECT *, ROW_NUMBER() OVER(ORDER BY IdElection DESC) AS RowNumber
	INTO #T
	FROM @T T

	SELECT 
		@Count=COUNT(*)
	FROM #T

	DELETE #T WHERE NOT (@PageSize=0 OR (RowNumber BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

	--Aller sur le site de paramétrage
	UPDATE #T 
	SET Buttons = CASE
					WHEN EtatSimulationPAP IN (1,2,5) THEN ISNULL(Buttons, '') + CASE -- si le bouton est null : chaine vide
																WHEN ISNULL(Buttons, '')='' THEN '' -- chaine vide
																ELSE ',' -- sinon on rajoute une virgule aux boutons existants
																END + '0' -- 0 : site de parametrage
				END
	FROM @R R
	where R.Role in (1,2,6)

	-- suppression du scrutin
	UPDATE #T 
	SET Buttons = CASE
					WHEN EtatSimulationPAP IN (1,2,5) THEN ISNULL(Buttons, '') + CASE -- si le bouton est null : chaine vide
																WHEN ISNULL(Buttons, '')='' THEN '' -- chaine vide
																ELSE ',' -- sinon on rajoute une virgule aux boutons existants
																END + '3' -- 3 : supprimer le scrutin (l'archiver)

				END
	FROM @R R
	where R.Role in (1,6)

	-- Quand on est dans avancement = 3 => code 1 du bouton // si on est en avancement 2 ou 3 => on peut revenir en phase 1 avec le bouton code 2
	UPDATE #T
	SET Buttons = CASE 
					WHEN Avancement = 3 THEN ISNULL(Buttons, '') + CASE -- bouton rempli ou vide
														WHEN ISNULL(Buttons, '')='' THEN '' -- bouton null ou vide
														ELSE ',' -- si pas vide on rajoute une virgule aux autres chiffres
														END +'1,2' --> va rajouter 1 et 2 à vide OU déjà 0 et 3
					WHEN Avancement = 2 THEN isnull(Buttons, '') + CASE 
														WHEN isnull(Buttons, '')='' THEN '' 
														ELSE ',' 
														END +'2'
					ELSE Buttons
				END

	UPDATE #T
		SET Buttons = CASE WHEN DATEPART(dw,Date1erTourScellement) in (1,7) THEN ISNULL(Buttons, '') + CASE
															WHEN isnull(Buttons, '')='' THEN '' 
															ELSE ',' 
															END +'4'
							Else Buttons
						END

	UPDATE #T
		SET Buttons = CASE WHEN DATEPART(dw,Date2emeTourScellement) in (1,7) THEN ISNULL(Buttons, '') + CASE
															WHEN isnull(Buttons, '')='' THEN '' 
															ELSE ',' 
															END +'5'
							Else Buttons
						END
	WHERE Date2emeTourScellement IS NOT NULL

	DECLARE @E TABLE 
	(	EligibiliteMin INT,
		IdElection INT,
		RemoteInfo NVARCHAR(MAX))

	declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY('Edition')) like '%Azure%' then 1 else 0 end)

	declare CDBS cursor local fast_forward
		for select distinct PAPDatabase, IdElection from #T
		where PAPDatabase is not null
		declare @PAPDatabase sysname, @IdElection int, @req nvarchar(max), @VersionAPI nvarchar(50)
		open CDBS
		fetch next from CDBS into @PAPDatabase,@IdElection
		while @@FETCH_STATUS=0 --vérifie qu'il y ai une ligne
		begin
			select @VersionAPI=VersionAPI from SIMULATION_PAP where Id=@IdElection
			
			print @PAPDatabase		
			declare @Query nvarchar(max)
			--vérifier l'option 32 qui vérifie l'éligibilité dans la bdd
			select @Query='
			select case ['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](32) when 1 then EligibiliteMin else null end,
				Id
			from ['+@PAPDatabase+'].[dbo].[PAP]'

			--print @Query
			if @AZURE=0
			begin
				insert @E 
				(
					EligibiliteMin,
					IdElection)
				exec (@Query)
			end
			else
			begin
				--insert @E 
				--exec (@Query)
				select @Req='IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSourceAdmin_'+@PAPDatabase+''')
				CREATE EXTERNAL DATA SOURCE DataSourceAdmin_'+@PAPDatabase+'
				WITH
				(
					TYPE=RDBMS,
					LOCATION='''+convert(nvarchar,SERVERPROPERTY('ServerName'))+'.database.windows.net'',
					DATABASE_NAME='''+@PAPDatabase+''',
					CREDENTIAL= SMMUser
				)'
					exec(@Req)
					set @Req='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@Query,'''','''''')+''''

					insert @E(EligibiliteMin, IdElection,RemoteInfo)
					exec (@Req)

					select @Req='IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSourceAdmin_'+@PAPDatabase+''')
						DROP EXTERNAL DATA SOURCE DataSourceAdmin_'+@PAPDatabase
					exec (@Req)
			end
			fetch next from CDBS into @PAPDatabase,@IdElection --vu que c'est une boucle, on remet un fetch pour qu'il recommence son tour (for n'existe pas dans sql)
		end
		close CDBS
		deallocate CDBS


	UPDATE #T
		SET Buttons = ISNULL(Buttons, '') + CASE
											WHEN isnull(Buttons, '')='' THEN '' 
											ELSE ',' 
											END + CASE WHEN EligibiliteMin = 3 THEN '6'
														WHEN EligibiliteMin = 6 THEN '7'
														ELSE '6,7'
														END
	FROM @E E
	INNER JOIN #T T ON E.IdElection = T.IdElection
	WHERE E.EligibiliteMin is not null

	UPDATE #T 
		SET Buttons = CASE 
						WHEN VersionAPI = 'B' AND AvecBureau = 1 AND SecuriteBureau = 1 THEN ISNULL(Buttons, '') + CASE -- bouton rempli ou vide
																														WHEN ISNULL(Buttons, '')='' THEN '' -- bouton null ou vide
																														ELSE ',' -- si pas vide on rajoute une virgule aux autres chiffres
																														END +'8'
						ELSE Buttons
					END

	SELECT 
        CompanyName,
        CodeAPE,
        Ct.Nom,
		Ct.Prenoms,
        Ct.Email,
		Ct.Telephone,
		Ct.Qualité,
        IdElection, 
        TypeScrutin,
        NbSalaries,
        AvancementScrutin, Avancement, Avancement1erTour, Avancement2ndTour,
        Date1erTourScellement,
		Date1erTourDebut, 
		Date1erTourFin,
		Date2emeTourScellement,
		Date2emeTourDebut,
		Date2emeTourFin,
		Statut,
		ISNULL(Buttons,'') AS Buttons,
		AvecBureau,
		SecuriteBureau,
		VersionAPI
    FROM #T T
    inner join CONTACTS Ct on T.IdCompany = Ct.IdCompany
    order by IdElection desc
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Scrutins_Button_Phase]    Script Date: 15/06/2021 10:00:07 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Scrutins_Button_Phase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Scrutins_Button_Phase] AS' 
END
GO
-- =============================================
-- Author:        Anne-Laure Bonnefond
-- Create date: 26/05/2021
-- Description:    Bouton "Raccourcir le délai de 3j" et "Revenir en Phase 1" dans la partie Administration => Scrutins => Action => Boutons
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_SAV_Scrutins_Button_Phase]
    @ButtonCode NVARCHAR(MAX),
    @IdElection INT,
	@HeaderType INT
AS
BEGIN
    SET NOCOUNT ON
    SET XACT_ABORT ON 
    SET FMTONLY OFF

	-- Variable qui va contenir le script à executer
	DECLARE @BaseVoteToCreate TABLE (NTour INT NOT NULL, TypeAction INT NOT NULL, RemoteInfo NVARCHAR(MAX))

    -- Récupérer le code du bouton
    IF @ButtonCode NOT IN ('0', '1', '2', '4', '5', '6', '7', '8') 
		BEGIN
			raiserror ('Le code du bouton n''est pas reconnu dans la procédure [_Admin_SAV_Scrutins_Button_Phase]',16,1)
			RETURN
		END

    -- chercher le papdatabase dans simulation pap, si il est null : return
    DECLARE @PAPDatabase SYSNAME -- => type par défaut pour les noms de bdd, nvarchar de 128
    SELECT @PAPDatabase = PAPDataBase         
    FROM SIMULATION_PAP 
    WHERE Id = @IdElection
    DECLARE @Req nvarchar(max)=NULL

    -- Script complet de ce que je dois exécuter dans les bases distantes

	-- SCRUTINS : HEADERTYPE = 1 / SCRUTINS MB = 5

    IF @ButtonCode = '1' AND @HeaderType IN (1,5)
        SET @Req ='UPDATE ['+@PAPDatabase+'].dbo.PAP SET DateValidationListeElecteur = Convert(Date, dbo.GetRealDate()); declare @P int; exec ['+@PAPDatabase+'].dbo.[PassUPElectionEtat] -1,'+convert(nvarchar, @IdElection) + ',@P output' -- => donne la date réelle par rapport au fuseau horaire (ici Paris)
    
	IF @ButtonCode = '2' AND @HeaderType IN (1,5)
        SET @Req = 'exec ['+@PAPDatabase+'].[dbo].[DemoExecute] 100, null, null, null'
    -- Permet de déterminer si on est sur Azure ou en Local
	
	IF @ButtonCode = '4' AND @HeaderType IN (1,5)
		SET @Req = 'SET LANGUAGE FRENCH; UPDATE ['+@PAPDatabase+'].dbo.TOURS SET DateScellementUrnes = DATEADD(dd, case DATEPART(dw,DateScellementUrnes) when 7 then -2 else -3 end, DateScellementUrnes) WHERE NTour = 1 AND DATEPART(dw,DateScellementUrnes) in (1,7)'
	
	IF @ButtonCode = '5' AND @HeaderType IN (1,5)
		SET @Req = 'SET LANGUAGE FRENCH; UPDATE ['+@PAPDatabase+'].dbo.TOURS SET DateScellementUrnes = DATEADD(dd, case DATEPART(dw,DateScellementUrnes) when 7 then -2 else -3 end, DateScellementUrnes) WHERE NTour = 2 AND DATEPART(dw,DateScellementUrnes) in (1,7)'
	
	IF @ButtonCode = '6' AND @HeaderType = 1
		SET @Req = 'UPDATE ['+@PAPDatabase+'].dbo.PAP SET EligibiliteMin=6'
	
	IF @ButtonCode = '7' AND @HeaderType = 1
		SET @Req = 'UPDATE ['+@PAPDatabase+'].dbo.PAP SET EligibiliteMin=3'
	
	IF @ButtonCode = '8' AND @HeaderType = 1
		SET @Req = 'UPDATE ['+@PAPDatabase+'].dbo.PAP SET BureauModeSecurite = 0'


	-- SUPPORT : HEADERTYPE = 3

	IF @ButtonCode = '1'  AND @HeaderType = 3
		BEGIN
			SET @Req = 'EXEC ['+@PAPDatabase+'].dbo._Admin_Support_Analyse_Vote '+convert(nvarchar, @IdElection)+''
		END
    
	DECLARE @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY('Edition')) like '%Azure%' then 1 else 0 end)  
	
	IF @Req IS NOT NULL
		IF @AZURE=0
			BEGIN
				IF @ButtonCode = '1' AND @HeaderType = 1
					BEGIN
						INSERT @BaseVoteToCreate
							(
								NTour, 
								TypeAction
							)
						exec (@Req)
					END
				ELSE
					exec (@Req)
			END

		ELSE --IF @AZURE=1
			BEGIN
				DECLARE @Query NVARCHAR(MAX)
				-- Créer le datasource
				select @Query='IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSource_Admin_'+@PAPDatabase+''')
					CREATE EXTERNAL DATA SOURCE DataSource_Admin_'+@PAPDatabase+'
					WITH
					(
						TYPE=RDBMS,
						LOCATION='''+convert(nvarchar,SERVERPROPERTY('ServerName'))+'.database.windows.net'',
						DATABASE_NAME='''+@PAPDatabase+''',
						CREDENTIAL= SMMUser
					)'
				--print @req
				exec(@Query)
				-- Encapsule dans le execute remote, executer la requete req à distance sur la bdd
				select @Query='exec sp_execute_remote @data_source_name  = N''DataSource_Admin_'+@PAPDatabase+''',
				@stmt = N'''+replace(@Req, '''', '''''')+'''' -- remplacer les côtes de la chaine req par des doubles côtes car on les encapsule dans une autre chaine	
				IF @ButtonCode = '1'  AND @HeaderType = 1
					INSERT @BaseVoteToCreate
							(
								NTour, 
								TypeAction,
								RemoteInfo
							)			
					exec(@Query)
				ELSE
					exec(@Query)
				-- on supprime le datasource qu'on a crée
				select @Query='IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSource_Admin_'+@PAPDatabase+''')
					DROP EXTERNAL DATA SOURCE [DataSource_Admin_'+@PAPDatabase+']'
				--print @req
				exec (@Query)
			END  

	IF ((@ButtonCode IN ('1','2', '4', '5', '6', '7', '8') AND @HeaderType = 1) OR (@ButtonCode = '0' AND @HeaderType = 3) OR (@ButtonCode IN ('1','2','4','5') AND @HeaderType = 5))
		BEGIN
			EXEC _Admin_Refresh_Election_Force @IdElection
			EXEC _Admin_Refresh_Election
		END

	SELECT * FROM @BaseVoteToCreate
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Scrutins_Buttons]    Script Date: 15/06/2021 09:59:34 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Scrutins_Buttons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Scrutins_Buttons] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 07/05/2021
-- Description:	Liste de boutons sur chaque scrutin dans la partie Administration
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_SAV_Scrutins_Buttons] 
	@HeaderType INT,
	@PopIn INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SET FMTONLY OFF;

    DECLARE @T TABLE
	(
		Code NVARCHAR(MAX),
		Libelle NVARCHAR(MAX)
	)

	IF(@HeaderType = 1 AND @PopIn = 0) -- SCRUTINS
		BEGIN
			INSERT @T
				VALUES 
					-- (Code, Libelle)
					('0', 'ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE'), -- 0: site de paramétrage du scrutin
					('1', 'ADMIN_BUTTON_SCRUTIN_DELAI_3J'), -- 1: réduire le délai de 3j
					('2', 'ADMIN_BUTTON_SCRUTIN_REVENIR_PHASE_1'), -- 2: revenir en phase 1 après la validation de la liste éléctorale
					('3', 'ADMIN_BUTTON_SCRUTIN_SUPPRIMER'), -- 3: supprimer le scrutin (va en réalité l'archiver)
					('4', 'ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_1ER_TOUR'), -- 4: changer la date de scellement du 1er tour si elle tombe un week-end
					('5', 'ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_2ND_TOUR'), -- 5: changer la date de scellement du 2nd tour si elle tombe un week-end
					('6', 'ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_6'), -- 6: réduire l'éligibilité de droit de vote à 6 mois
					('7', 'ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_3'), -- 7: réduire l'éligibilité de droit de vote à 3 mois
					('8', 'ADMIN_BUTTON_SCRUTIN_NON_COLLEGIAL') -- 8: passer le scrutin en mode non collégial
		END
	IF(@HeaderType = 3 AND @PopIn = 0) -- SUPPORTS
		BEGIN
			INSERT @T
				VALUES 
					-- (Code, Libelle)
					('0', 'ADMIN_BUTTON_SUPPORT_REFRESH'), -- 0: Rafraichir l'élection
					('1', 'ADMIN_BUTTON_SUPPORT_DEROULEMENT_SCRUTIN'), -- 1: Ouvrir l'analyse de vote détaillée du scrutin
					('2', 'ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE') -- 2: site de paramétrage du scrutin
		END

	IF(@HeaderType = 3 AND @PopIn = 1) -- SUPPORTS POPIN
		BEGIN
			INSERT @T
				VALUES 
					-- (Code, Libelle)
					('0', 'ADMIN_BUTTON_SUPPORT_REFRESH') -- 0: Rafraichir l'élection
		END

	IF(@HeaderType = 5 AND @PopIn = 0) -- SCRUTINS MB
		BEGIN
			INSERT @T
				VALUES
					-- (Code, Libelle)
					('0', 'ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE'), -- 0: site de paramétrage du scrutin
					('1', 'ADMIN_BUTTON_SCRUTIN_DELAI_3J'), -- 1: réduire le délai de 3j
					('2', 'ADMIN_BUTTON_SCRUTIN_REVENIR_PHASE_1'), -- 2: revenir en phase 1 après la validation de la liste éléctorale
					('4', 'ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_1ER_TOUR'), -- 4: changer la date de scellement du 1er tour si elle tombe un week-end
					('5', 'ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_2ND_TOUR') -- 5: changer la date de scellement du 2nd tour si elle tombe un week-end
		END

	SELECT DISTINCT * FROM @T ORDER BY Code ASC
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Support]    Script Date: 09/07/2021 10:38:14 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Support]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Support] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 07/07/2021
-- Description:	Partie Export du menu Administration
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_SAV_Support] 
	@Recherche NVARCHAR(MAX),
    @IdUser INT,
	@FiltreCode INT,
	@Page INT,
	@PageSize INT,
	@Count INT OUTPUT
AS
BEGIN
	--SET NOCOUNT ON;
    SET XACT_ABORT ON 
    SET FMTONLY OFF

	DECLARE
		@TypeExport int=36,	-- 36 : Prochains scrutins
		@AvecMax int=2, -- 0 Avec | 1 Que Max | 2 Sans Max
		@Ordre int=0,	-- 0 Database | 1 Date d'élection | 2 Company | 3 Email | 5 Date de création
		@Active int=0,	-- Filtre sur sélection des élections
	 		-- 0 Actives | 1 sans les annulées | 2 toutes | 3 que les annulées | 4 Actives et terminées
		@Filtre int=0 -- 0 : les prochaines réelle sans les DEMO | 1 : avec les DEMO | 2 : tout le planning | 3 : les réelles passée | 4 : que les scrutins sans les DEMO | 5 : que les scrutins avec les DEMO

	SELECT @Recherche = UPPER(TRIM(@Recherche));
    --SELECT @Recherche --à mettre en comm

    -- TABLE DES CHAINES DE CARACTERES ENREGISTREES SEPAREMENT
    DECLARE @ChaineDeRecherche TABLE (Chaine nvarchar(max))
    INSERT @ChaineDeRecherche
    SELECT Chaine FROM Split(@Recherche)

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

    -- TABLE DU TYPE DE VOTE : CONTIENT LE TYPE SOUS FORMAT CHAINE ET CODE
    DECLARE @V TABLE (ChaineVote NVARCHAR(MAX), CodeVote INT)
    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
    BEGIN
        INSERT @V
        SELECT DISTINCT
            Chaine, 
            CASE WHEN Chaine = 'CSE' THEN 4
                WHEN Chaine = 'REFERUNDUM' OR Chaine ='REF' THEN 5
                WHEN Chaine = 'CONSULTATION' OR Chaine = 'CONS' THEN 7
                WHEN Chaine = 'ARP' THEN 8
                WHEN Chaine = 'AG' THEN 6
                WHEN Chaine = 'ELECTION' OR Chaine ='ELEC' THEN 11
                WHEN Chaine = 'FCPE' THEN 10
                ELSE 0
            END as CodeVote
        FROM @ChaineDeRecherche
        WHERE Chaine IN ('CSE', 'REFERUNDUM', 'REF', 'CONSULTATION', 'CONS', 'ARP', 'AG', 'ELECTION', 'ELEC', 'FCPE')
    END

    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
        DELETE CDR FROM @ChaineDeRecherche CDR INNER JOIN @V V ON V.ChaineVote = CDR.Chaine
  
    -- TABLE DE SORTIE
    declare @T Table
	(	IdElection int,
		Buttons NVARCHAR(MAX),
		VersionAPI nvarchar(50),
		CodeVote nvarchar(max),
		PAPDatabase nvarchar(128),
		PAPWebSite nvarchar(max),
		NBDatabases int,
		Creation datetime,
		DateSignaturePAP date,
		Date1erTourScellement datetime,
		Date1erTour datetime,
		Date1erTourFin datetime,
		Date1erTourLabel nvarchar(max), 
		Date2emeTourScellement datetime,
		Date2emeTour datetime,
		Date2emeTourFin datetime,
		Date2emeTourLabel nvarchar(max), 
		EtatCode int,
		Etat nvarchar(max),
		EtatDevis int,
		Devis nvarchar(max),
		Avancement nvarchar(max), 
		NbSalaries int, 
		NbSalariesLabel nvarchar(max), 
		Votants int,
		Reel bit,
		NbEtablissements int, 
		NbColleges int,
		NBListeT1 int, 
		AvancementTour1 int, 
		EtatUrneT1 int, 
		EmargementT1 int,
		NBListeT2 int, 
		AvancementTour2 int, 
		EtatUrneT2 int, 
		EmargementT2 int,
		Company nvarchar(max),
		Contact nvarchar(max),
		Mail nvarchar(max),
		Telephone nvarchar(max),
		UserKey nvarchar(max),
		IdUser int,
		IdCompany int,
		IdContact int,
		DEMO bit,
		MARQUE nvarchar(max),
		MARQUE_USER nvarchar(max),
		AvecBureau bit,
		ScellementALavolee bit,
		OptionCourrier bit,
		DelaiGrace int,
		OptionListe bit,
		OptionQuestion bit,
		OptionBureau bit,	--Champ proposé
		OptionTourUnique bit,
		SecuriteConnexion tinyint, 
		SecuriteBureau tinyint,
		Statut INT,

		PRIMARY KEY(IdElection,IdUser,IdContact)
	)

	declare @Planning table
	(
		IdElection int NOT NULL,
		Buttons NVARCHAR(MAX),
		VersionAPI nvarchar(50), 
		CodeVote nvarchar (max), 
		PAPDatabase nvarchar(128), 
		PAPWebSite nvarchar(max),
		Company nvarchar(max), 
		Avancement nvarchar(50), 
		Devis nvarchar(max), 
		Marque nvarchar(max),
		NBSalariesReels int, 
		Votants int NOT NULL, 
		Emargement int NOT NULL,
		OptionCourrier bit, 
		NBEtablissement int, 
		NBColleges int, 
		[Date prévisionnelle] datetime, 
		[Date prévisionnelle Fin] datetime, 
		TourLabel nvarchar(max), 
		NTour tinyint, 
		NBListe int, 
		AvancementTour int, 
		Etat nvarchar(max), 
		DEMO bit, 
		EtatUrne int, 
		DelaiGrace int,
		AvecBureau bit, 
		DateTourScellement datetime, 
		SecuriteConnexion tinyint, 
		SecuriteBureau tinyint,
		Statut INT
	)

	if @TypeExport=36 and @Filtre not in (4,5) set @Filtre=4

	IF EXISTS (SELECT * FROM @ChaineDeRecherche)
    BEGIN
        UPDATE @ChaineDeRecherche SET Chaine = '%' + Chaine + '%' WHERE CHARINDEX('%', Chaine) = 0 --va préparer le LIKE 

		insert @T
		select distinct
			S.Id, 
			'',--CASE WHEN R.Role in (1,6) THEN '0,1,2' ELSE '' END,
			isnull(S.VersionAPI,'A'), 
			'CSE', 
			S.PAPDataBase, 
			S.PAPWebSite, 
			0, 
			null, 
			null, 
			null, 
			S.Date1erTourDebut, 
			S.Date1erTourFin, 
			convert(nvarchar,S.Date1erTourDebut,103), 
			null, 
			null, 
			null, 
			null, 
			ESP.Code, 
			ESP.Libelle, 
			null, 
			'',
			'',
			S.NbEstimeElecteurs,
			convert(nvarchar,S.NbEstimeElecteurs),
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			C.Nom, 
			CS.Nom +' '+CS.Prenoms, 
			CS.Email, 
			CS.Telephone, 
			U.Cle as USER_KEY, 
			U.Id, 
			C.ID, 
			CS.Id, 
			S.Demo, 
			isnull(MB.Nom,''), 
			isnull(MBU.Nom,''),
			0,
			0,
			isnull(SPO.Checked,0),
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			3
		from UTILISATEURS U
		--CROSS JOIN @R R
		inner join CONTACTS CS on CS.IdUser=U.Id
		inner join COMPANY C on CS.IdCompany=C.Id
		inner join SIMULATION_PAP S on C.Id=S.IdCompany
		inner join ETAT_SIMULATION_PAP ESP on ESP.id=S.IdEtat
		left join MARQUES_BLANCHES MB on S.Marque=MB.Marque
		left join MARQUES_BLANCHES MBU on U.Marque=MBU.Marque
		left join [dbo].[SIMULATION_PAP_OPTIONS] SPO 
			inner join [dbo].[TYPE_OPTION] SPTO on SPTO.Id=SPO.IdOption and SPTO.Code=1
		on SPO.Id=S.Id
		INNER JOIN @ChaineDeRecherche CH ON (convert(nvarchar,S.Date1erTourDebut,103) LIKE CH.Chaine OR S.Id LIKE CH.Chaine OR C.Nom LIKE CH.Chaine OR CS.Nom LIKE CH.Chaine OR CS.Prenoms LIKE CH.Chaine OR CS.Email LIKE CH.Chaine OR CS.Telephone LIKE CH.Chaine OR U.Cle LIKE CH.Chaine OR U.Id LIKE CH.Chaine OR C.ID LIKE CH.Chaine OR CS.Id LIKE CH.Chaine)
		where 
			--@TypeExport in (9,5) or 
			((@AvecMax=0 or (@AvecMax=1 and Email='max.godet@wechooz.fr') or (@AvecMax=2 and Email<>'max.godet@wechooz.fr')) and
			(@Active=2 or (@Active=0 and ESP.Code in (2,5)) or (@Active=1 and ESP.Code in (2,4,5)) or (@Active=3 and ESP.Code=3) or (@Active=4 and ESP.Code not in (3))))
	END

	ELSE
		insert @T
			select distinct
				S.Id, 
				'', --CASE WHEN R.Role IN (1,6) THEN '0,1,2' ELSE '' END,
				isnull(S.VersionAPI,'A'), 
				'CSE', 
				S.PAPDataBase, 
				S.PAPWebSite, 
				0, 
				null, 
				null, 
				null, 
				S.Date1erTourDebut, 
				S.Date1erTourFin, 
				convert(nvarchar,S.Date1erTourDebut,103), 
				null, 
				null, 
				null, 
				null, 
				ESP.Code, 
				ESP.Libelle, 
				null, 
				'',
				'',
				S.NbEstimeElecteurs,
				convert(nvarchar,S.NbEstimeElecteurs),
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				C.Nom, 
				CS.Nom +' '+CS.Prenoms, 
				CS.Email, 
				CS.Telephone, 
				U.Cle as USER_KEY, 
				U.Id, 
				C.ID, 
				CS.Id, 
				S.Demo, 
				isnull(MB.Nom,''), 
				isnull(MBU.Nom,''),
				0,
				0,
				isnull(SPO.Checked,0),
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				3
			from UTILISATEURS U 
			--CROSS JOIN @R R
			inner join CONTACTS CS on CS.IdUser=U.Id
			inner join COMPANY C on CS.IdCompany=C.Id
			inner join SIMULATION_PAP S on C.Id=S.IdCompany
			inner join ETAT_SIMULATION_PAP ESP on ESP.id=S.IdEtat
			left join MARQUES_BLANCHES MB on S.Marque=MB.Marque
			left join MARQUES_BLANCHES MBU on U.Marque=MBU.Marque
			left join [dbo].[SIMULATION_PAP_OPTIONS] SPO 
				inner join [dbo].[TYPE_OPTION] SPTO on SPTO.Id=SPO.IdOption and SPTO.Code=1
			on SPO.Id=S.Id
			where 
				--@TypeExport in (9,5) or 
				((@AvecMax=0 or (@AvecMax=1 and Email='max.godet@wechooz.fr') or (@AvecMax=2 and Email<>'max.godet@wechooz.fr')) and
				(@Active=2 or (@Active=0 and ESP.Code in (2,5)) or (@Active=1 and ESP.Code in (2,4,5)) or (@Active=3 and ESP.Code=3) or (@Active=4 and ESP.Code not in (3))))

	update @T set DEMO=1 where IdCompany in (1,16,17,18,37,42,80,81,90,92,121,368,448,432)

	;with D as
	(	select D.IdSimulationPAP, DE.Libelle, DE.Code, RANK() OVER (PARTITION BY D.IdSimulationPAP ORDER BY case DE.Code when 2 then 0 else 1 end, D.Id desc) as RANG
		from DEVIS D
		inner join DEVIS_ETATS DE on D.idEtat=DE.Id
		where Code<>4	-- Pas les annulés (par nous)
	)	
	update @T set Devis=D.Libelle, EtatDevis=D.Code
	from @T T
	inner join D on D.IdSimulationPAP=T.IdElection
	where D.RANG=1 and Marque=''

	exec _Admin_Refresh_Election

	update @T 
	set CodeVote=case C.CodeVote 
					when 4 then 'CSE' 
					when 5 then 'Référendum' 
					when 6 then 'AG' 
					when 7 then 'Consultation' 
					when 8 then 'ARP8' 
					when 9 then 'AG'
					when 10 then 'FCPE old'
					when 11 then 'Election simple'
					when 12 then 'FCPE'
					else '?' 
					end,
		Creation=C.[CréationDatabase],
		NBDatabases=C.[NBDatabase],
		DateSignaturePAP=C.DateSignaturePAP,
		Date1erTourScellement=C.Date1erScellementUrnes,
		Date1erTour=C.Date1erTourDebut,
		Date1erTourFin=C.Date1erTourFin,
		Date1erTourLabel=
			convert(nvarchar(max),C.Date1erTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourDebut)),2)+' - '+
			case when convert(date,C.Date1erTourFin)=convert(date,Date1erTourDebut) then '' else convert(nvarchar(max),C.Date1erTourFin,103)+ ' ' end +
			right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourFin)),2)
			+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,
		Date2emeTourScellement=C.Date2emeScellementUrnes,
		Date2emeTour=C.Date2emeTourDebut,
		Date2emeTourFin=C.Date2emeTourFin,
		Date2emeTourLabel=
			isnull(convert(nvarchar(max),C.Date2emeTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourDebut)),2)+' - '+
			case when convert(date,C.Date2emeTourFin)=convert(date,Date2emeTourDebut) then '' else convert(nvarchar(max),C.Date2emeTourFin,103)+ ' ' end +
			right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourFin)),2)
			+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,''),
		Avancement=	convert(nvarchar,C.Avancement)+
			case C.Avancement when 4 then '-'+convert(nvarchar,C.Avancement1erTour) 
			when 5 then '-'+convert(nvarchar,C.Avancement2ndTour) else '' end,
		NbSalaries=case C.NbSalaries when 0 then T.NbSalaries else C.NbSalaries end,
		Votants=isnull(C.Votants,0),
		NbEtablissements=C.NbEtablissements,
		NbColleges=C.NbColleges,
		Reel=case C.NbSalaries when 0 then 0 else 1 end,
		NBListeT1=C.NBListeT1,
		AvancementTour1=C.Avancement1erTour,
		EtatUrneT1=isnull(C.EtatUrneT1,0),
		EmargementT1=ISNULL(C.EmargementT1,0),
		NBListeT2=C.NBListeT2,
		AvancementTour2=C.Avancement2ndTour,
		EtatUrneT2=isnull(C.EtatUrneT2,0),
		EmargementT2=ISNULL(C.EmargementT2,0),
		DelaiGrace=C.DelaiGrace,
		AvecBureau=C.AvecBureau,
		ScellementALavolee=C.ScellementALaVolee,
		OptionListe=[dbo].[FN_GetVoteOptionActivation](T.IdElection,9),
		OptionQuestion=[dbo].[FN_GetVoteOptionActivation](T.IdElection,10),
		OptionBureau=[dbo].[FN_GetVoteOptionActivation](T.IdElection,87),
		OptionTourUnique=[dbo].[FN_GetVoteOptionActivation](T.IdElection,1),
		SecuriteConnexion=C.SecuriteConnexion,
		SecuriteBureau=C.SecuriteBureau
	from @T T
	inner join Admin_Election_Infos C on C.IdElection=T.IdElection

	update @T set NbSalariesLabel=RIGHT('     '+CONVERT(nvarchar,NbSalaries),5)+ case when Votants>0 then ' | Elect='+RIGHT('     '+CONVERT(nvarchar,Votants),5) else '' end
		
	update @T set Buttons='0,1,2' from @R where Role in (1,6)

	insert @Planning
		select distinct 
			IdElection,
			Buttons,
			VersionAPI,
			CodeVote + case 
				when OptionBureau=1 and AvecBureau=1 then ' (bureau)' 
				when OptionBureau=1 and AvecBureau=0 and ScellementALavolee=1 then ' (A la volée)' 
				when OptionBureau=1 and AvecBureau=0 and ScellementALavolee=0 then ' (Automatique)'
				else '' end,
			PAPDatabase,
			PAPWebSite,
			Company,
			Avancement,
			Devis,
			Marque,
			NbSalaries, 
			Votants, 
			EmargementT1,
			OptionCourrier,
			NbEtablissements,
			NbColleges,
			Date1erTour,
			Date1erTourFin,
			case when AvecBureau=1 and Date1erTourScellement is not null 
				then TRIM(
					case when DAY(Date1erTourScellement)<>DAY(Date1erTour) then RIGHT('00'+convert(nvarchar,DAY(Date1erTourScellement)),2) else '' end+
					case when MONTH(Date1erTourScellement)<>MONTH(Date1erTour) then '/'+RIGHT('00'+convert(nvarchar,MONTH(Date1erTourScellement)),2) else '' end+
					case when YEAR(Date1erTourScellement)<>YEAR(Date1erTour) then '/'+convert(nvarchar,YEAR(Date1erTourScellement)) else '' end+
					' '+RIGHT('00'+convert(nvarchar,DATEPART(hh,Date1erTourScellement)),2)+':'+RIGHT('00'+convert(nvarchar,DATEPART(mi,Date1erTourScellement)),2)+' -> ')
				else '' end+Date1erTourLabel, 
			1, 
			NBListeT1, 
			AvancementTour1, 
			case EtatCode when 5 then 'SUSPENDUE - ' else '' end+
			case OptionTourUnique when 0 then '1er tour' else 'scrutin' end+' : '+
			case when left(Avancement,1) in ('4','5','6') then
				case when NBListeT1=0 and AvancementTour1=5 then 'carence' 
				when AvancementTour1=1 then 'candidats' 
				when AvancementTour1=3 and EtatUrneT1=1 then 'peut commencer' 
				when AvancementTour1=3 and EtatUrneT1=2 then 'scellé' 
				when AvancementTour1=4 then 
					case EtatUrneT1 when 1 then 'en attente de scellement' when 2 then 'en cours' when 3 then 'dépouillé' else 'RAFRAICHIR' end
				when AvancementTour1>=5 then 
					case EtatUrneT1 when 1 then 'en attente de scellement' when 2 then 'en cours' when 3 then 'réalisé' else 'RAFRAICHIR' end
				when AvancementTour2=1 and left(Avancement,1)=6 then 'inutile' 
				else 'bureaux' end	-- obligatoirement bureau AvancementTour1=2
			when Avancement in ('2') then 'Liste électorale'
			when Avancement in ('3') then 'Liste électorale - Confirmation'
			else 'PAP' end, 
			DEMO, 
			EtatUrneT1, 
			DelaiGrace, 
			AvecBureau,
			Date1erTourScellement,
			SecuriteConnexion, 
			SecuriteBureau,
			Statut
		from @T
		where Etat in ('Validée','Clôturée','Suspendue')
			and (DEMO=0 or @Filtre in (1,2,5))
			and (@TypeExport in (3,36) or 
					(@TypeExport=32 and (convert(date,dbo.GetRealdate()) between convert(date,Date1erTour) and convert(date,Date1erTourFin) or 
						(AvancementTour1>=3 and EtatUrneT1=2)) and NBListeT1>0) or
					(@TypeExport=33 and 
					(	convert(date,dbo.GetRealdate()+1) between convert(date,Date1erTour) and convert(date,Date1erTourFin) or
						convert(date,dbo.GetRealdate()+2) between convert(date,Date1erTour) and convert(date,Date1erTourFin)
					) and NBListeT1>0) or
					(@TypeExport=34 and convert(date,dbo.GetRealdate()-1) between convert(date,Date1erTour) and convert(date,Date1erTourFin) and NBListeT1>0) or
					(@TypeExport=36 and NBListeT1>0)
				)
	
	insert @Planning
		select distinct 
			IdElection,
			Buttons,
			VersionAPI,
			CodeVote + case 
				when OptionBureau=1 and AvecBureau=1 then ' (bureau)' 
				when OptionBureau=1 and AvecBureau=0 and ScellementALavolee=1 then ' (A la volée)' 
				when OptionBureau=1 and AvecBureau=0 and ScellementALavolee=0 then ' (Automatique)'
				else '' end,
			PAPDatabase,
			PAPWebSite,
			Company,
			Avancement,
			Devis,
			Marque,
			NbSalaries, 
			Votants, 
			EmargementT2,
			OptionCourrier,
			NbEtablissements,
			NbColleges,
			Date2emeTour,
			Date2emeTourFin,
			case when AvecBureau=1 and Date2emeTourScellement is not null 
			then TRIM(
				case when DAY(Date2emeTourScellement)<>DAY(Date2emeTour) then RIGHT('00'+convert(nvarchar,DAY(Date2emeTourScellement)),2) else '' end+
				case when MONTH(Date2emeTourScellement)<>MONTH(Date2emeTour) then '/'+RIGHT('00'+convert(nvarchar,MONTH(Date2emeTourScellement)),2) else '' end+
				case when YEAR(Date2emeTourScellement)<>YEAR(Date2emeTour) then '/'+convert(nvarchar,YEAR(Date2emeTourScellement)) else '' end+
				' '+RIGHT('00'+convert(nvarchar,DATEPART(hh,Date2emeTourScellement)),2)+':'+RIGHT('00'+convert(nvarchar,DATEPART(mi,Date2emeTourScellement)),2)+' -> ')
			else '' end+Date2emeTourLabel,2, NBListeT2, AvancementTour2,
			case EtatCode when 5 then 'SUSPENDUE - ' else '' end+
			'2nd tour : '+
			case when left(Avancement,1) in ('4','5','6') then
				case when NBListeT2=0 and AvancementTour2=5 then 'carence' 
				when AvancementTour2=1 then 'candidats' 
				when AvancementTour2=3 and EtatUrneT2=1 then 'peut commencer' 
				when AvancementTour2=3 and EtatUrneT2=2 then 'scellé' 
				when AvancementTour2=4 then  
					case EtatUrneT2 when 1 then 'en attente de scellement' when 2 then 'en cours' when 3 then 'dépouillé' else 'RAFRAICHIR' end
				when AvancementTour2>=5 then 
					case EtatUrneT2 when 1 then 'en attente de scellement' when 2 then 'en cours' when 3 then 'réalisé' else 'RAFRAICHIR' end
				when AvancementTour2=1 and left(Avancement,1)=6 then 'inutile' 
				else 'bureaux' end	-- obligatoirement bureau AvancementTour2=2
			when Avancement in ('2') then 'Liste électorale'
			when Avancement in ('3') then 'Liste électorale - Confirmation'
			else 'PAP' end, DEMO, EtatUrneT2, DelaiGrace, AvecBureau,Date2emeTourScellement,
			SecuriteConnexion, SecuriteBureau, Statut
		from @T
		where OptionTourUnique=0 and
			Etat in ('Validée','Clôturée','Suspendue')
			and (DEMO=0 or @Filtre in (1,2,5))
			and (@TypeExport in (3) or 
					(@TypeExport=32 and (convert(date,dbo.GetRealdate()) between convert(date,Date2emeTour) and convert(date,Date2emeTourFin) or 
						(AvancementTour2>=3 and EtatUrneT2=2)) and NBListeT2>0) or
					(@TypeExport=33 and 
					(	convert(date,dbo.GetRealdate()+1) between convert(date,Date2emeTour) and convert(date,Date2emeTourFin) or
						convert(date,dbo.GetRealdate()+2) between convert(date,Date2emeTour) and convert(date,Date2emeTourFin)
					) and NBListeT2>0) or
					(@TypeExport=34 and convert(date,dbo.GetRealdate()-1) between convert(date,Date2emeTour) and convert(date,Date2emeTourFin) and NBListeT2>0) or
					(@TypeExport=36 and NBListeT2>0)
				)

	-- FINAL SELECT
	select 
		Buttons,
		Marque, 
		Company, 
		Etat, 
		convert(nvarchar,IdElection)+' - '+CodeVote as CodeVote, 
		PAPDatabase, 
		VersionAPI,
		case 
			when left(Avancement,1)=6 and NBListe=0 then 'INUTILE'
			when AvancementTour>=4 and NBListe>0 and EtatUrne=3 then 'TERMINE'
			when AvancementTour<3 and NBListe=0 and convert(date,dbo.GetRealdate()+2) >= convert(date,[Date prévisionnelle]) then 'Carence non validée' 
			when AvancementTour<3 and NBListe>0 and convert(date,dbo.GetRealdate()+2) >= convert(date,[Date prévisionnelle]) and AvecBureau=1 then 'BUREAUX NON VALIDES'
			when AvancementTour>=3 and NBListe>0 and EtatUrne=1 and convert(date,dbo.GetRealdate()) < convert(date,[Date prévisionnelle]) then 'PRET'
			when AvancementTour>=3 and NBListe>0 and EtatUrne=1 and convert(date,dbo.GetRealdate()) >= convert(date,[Date prévisionnelle]) and AvecBureau=1 then 'SCELLEMENT'
			when AvancementTour>=3 and NBListe>0 and EtatUrne=2 then 
				case 
				when dbo.GetRealdate() >= dateadd(mi,DelaiGrace,[Date prévisionnelle Fin]) then 'NON DEPOUILLEE'
					+ case 
						when convert(date,dbo.GetRealdate()-1) = convert(date,[Date prévisionnelle]) then ' HIER'
						when convert(date,dbo.GetRealdate()-1) > convert(date,[Date prévisionnelle]) then ' AVANT'
						else '' end
				else 'EN COURS' end
			else '' end as AVANCEMENT,
		case 
			when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle]) and 
				convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle Fin]) then 'AUJOURD''HUI' 
			when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle]) then 'DEBUT'
			when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle Fin]) then 'FIN' 
			when NBListe>0 and convert(date,dbo.GetRealdate()) between convert(date,[Date prévisionnelle]) and convert(date,[Date prévisionnelle Fin]) then 'EN COURS'
			when NBListe>0 and convert(date,dbo.GetRealdate()+1) = convert(date,[Date prévisionnelle]) then 'DEMAIN' 
			when convert(date,[Date prévisionnelle]) between convert(date,getdate()+2) and convert(date,dateadd(dd,7,dbo.GetRealdate())) then 
				case DATEPART(dw,[Date prévisionnelle])
				when 1 then 'LUNDI'
				when 2 then 'MARDI'
				when 3 then 'MERCREDI'
				when 4 then 'JEUDI'
				when 5 then 'VENDREDI'
				when 6 then 'SAMEDI'
				when 7 then 'DIMANCHE'
				else 'BIENTOT' end + ' '+convert(nvarchar,DAY([Date prévisionnelle]))
				+ case when DAY([Date prévisionnelle]) in (1,2,3) and
					convert(date,[Date prévisionnelle]) between convert(date,getdate()+1) and convert(date,getdate()+2)
					then '/'+convert(nvarchar,MONTH([Date prévisionnelle])) else '' end
				+ case when DATEPART(dy,[Date prévisionnelle]) in (1,2,3) and
					convert(date,[Date prévisionnelle]) between convert(date,getdate()+1) and convert(date,getdate()+2)
					then '/'+convert(nvarchar,YEAR([Date prévisionnelle])) else '' end
			when convert(date,[Date prévisionnelle]) between convert(date,dateadd(dd,8,dbo.GetRealdate())) and convert(date,dateadd(dd,15,dbo.GetRealdate())) then 'PROCHAINEMENT'
			else '' end
				+ case when convert(date,dbo.GetRealdate())<=convert(date,[Date prévisionnelle Fin]) then
					isnull(' '+nullif(CONVERT(nvarchar,1+DATEDIFF(dd,
					case when convert(date,dbo.GetRealdate())>convert(date,[Date prévisionnelle]) then convert(date,dbo.GetRealdate()) else convert(date,[Date prévisionnelle]) end,
					convert(date,[Date prévisionnelle Fin]))),1)+'j','')
				else '' end
			as QUAND,
		case SecuriteConnexion 
			when 0 then 'SIMPLE' 
			when 1 then '2 CANAUX'
			when 2 then '2 CANAUX AVEC DEFI'
			when 3 then 'SIMPLE AVEC DEFI'
			else '' end +
				case when SecuriteConnexion is not null and AvecBureau=1 then ' - ' else '' end+
				case when AvecBureau=1 and SecuriteBureau=0 then 'NON COLLEGIAL' 
				when AvecBureau=1 and SecuriteBureau=1 then 'COLLEGIAL' 
				else '' end as SECURITE,
		TourLabel, --[Date prévisionnelle], [Date prévisionnelle Fin], 
		NBListe, 
		NBSalariesReels, 
		Votants, 
		Emargement, 
		--OptionCourrier, 
		--NBEtablissement, 
		--NBColleges,
		--AvancementTour, 
		--Devis, 
		--DEMO, 
		API.URL, 
		VOTE.URL+PAPWebSite as PAPWebSite,
		Statut = CASE WHEN NBListe>0 and convert(date,dbo.GetRealdate()) between convert(date,[Date prévisionnelle]) and convert(date,[Date prévisionnelle Fin]) THEN 1 -- AUJOURD'HUI OU EN COURS
							WHEN AvancementTour<3 and NBListe=0 and convert(date,dbo.GetRealdate()+2) >= convert(date,[Date prévisionnelle]) THEN 1 -- CARENCE NON VALIDEE
							WHEN AvancementTour<3 and NBListe>0 and convert(date,dbo.GetRealdate()+2) >= convert(date,[Date prévisionnelle]) and AvecBureau=1 THEN 1 -- BUREAUX NON VALIDES
							WHEN NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle]) THEN 1 -- DEBUT
							WHEN NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle Fin]) THEN 1 -- FIN

							when NBListe>0 and convert(date,dbo.GetRealdate()) between convert(date,[Date prévisionnelle]) and convert(date,[Date prévisionnelle Fin]) then 3 -- EN COURS

							WHEN NBListe>0 and convert(date,dbo.GetRealdate()+1) = convert(date,[Date prévisionnelle]) THEN 2 -- DEMAIN

							WHEN NBListe>0 and convert(date,dbo.GetRealdate()+3) = convert(date,[Date prévisionnelle]) AND DATEPART(dw,dbo.GetRealdate()) = 5 THEN 2 -- LUNDI si on est VENDREDI

							WHEN AvancementTour>=4 and NBListe>0 and EtatUrne=3 THEN 3 -- TERMINE
							WHEN AvancementTour>=3 and NBListe>0 and EtatUrne=1 and convert(date,dbo.GetRealdate()) < convert(date,[Date prévisionnelle]) THEN 3 -- PRET

							-- SCELLEMENT
							when AvancementTour>=3 and NBListe>0 and EtatUrne=1 and convert(date,dbo.GetRealdate()) >= convert(date,[Date prévisionnelle]) and AvecBureau=1 THEN CASE when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle]) and 
																																												convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle Fin]) then 1 -- AUJOURD''HUI 
																																											when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle]) then 1 -- DEBUT
																																											when NBListe>0 and convert(date,dbo.GetRealdate()) = convert(date,[Date prévisionnelle Fin]) then 1 -- FIN
																																										ELSE 2 -- SCELLEMENT
																																										END

							-- DEPOUILLEMENT
							when AvancementTour>=3 and NBListe>0 and EtatUrne=2 then case when dbo.GetRealdate() >= dateadd(mi,DelaiGrace,[Date prévisionnelle Fin]) THEN 2 -- NON DEPOUILLEE
																							when dbo.GetRealdate() >= dateadd(mi,DelaiGrace,[Date prévisionnelle Fin]) AND convert(date,dbo.GetRealdate()-1) = convert(date,[Date prévisionnelle]) then 1 -- HIER
																							when dbo.GetRealdate() >= dateadd(mi,DelaiGrace,[Date prévisionnelle Fin]) AND convert(date,dbo.GetRealdate()-1) > convert(date,[Date prévisionnelle]) then 1 -- AVANT
																							else 3 -- EN COURS
																							end
							ELSE 0
							END,
		IdElection,
		ROW_NUMBER() OVER(ORDER BY [Date prévisionnelle]) AS RowNumber
		--ROW_NUMBER() OVER(ORDER BY IdElection DESC) AS RowNumber
	INTO #T
	from @Planning P
	cross apply [dbo].[FN_GetAPIElection](IdElection,dbo.GetRealdate()) API
	cross apply [dbo].[FN_GetVOTEElection](IdElection,dbo.GetRealdate()) VOTE
	where (@Filtre=2 or 
		(@Filtre in (0,1) and 
		(	convert(date,[Date prévisionnelle Fin])>=convert(date,dbo.GetRealdate())
		or (convert(date,[Date prévisionnelle Fin])<=convert(date,dbo.GetRealdate()) and AvancementTour between 4 and 5 and left(Avancement,1) in ('4','5')))) or
		(@Filtre=3 and convert(date,[Date prévisionnelle Fin])<convert(date,dbo.GetRealdate()))) or
		(@Filtre in (4,5) and NBListe>0 and (not (Avancement in ('6') and EtatUrne=3) or convert(date,[Date prévisionnelle Fin])=convert(date,dbo.GetRealdate())))
	order by 
		case when @TypeExport in (32) and datepart(hh,dbo.GetRealdate())<13 then [Date prévisionnelle]
			when @TypeExport in (32) and datepart(hh,dbo.GetRealdate())>=13 then [Date prévisionnelle Fin]
			else [Date prévisionnelle] 
			end

	SELECT 
		@Count=COUNT(*)
	FROM #T

	DELETE #T WHERE NOT (@PageSize=0 OR (RowNumber BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

	SELECT
		Buttons,
		Marque, 
		Company, 
		Etat, 
		CodeVote, 
		PAPDatabase, 
		VersionAPI,
		AVANCEMENT,
		QUAND,
		SECURITE,
		TourLabel,
		NBListe, 
		NBSalariesReels, 
		Votants, 
		Emargement,
		URL, 
		PAPWebSite,
		Statut,
		IdElection
	FROM #T
	order by RowNumber
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Scrutins_Potentiels]    Script Date: 26/07/2021 15:37:51 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Scrutins_Potentiels]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Scrutins_Potentiels] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 26/07/2021
-- Description:	Affichage du nombres de scrutins potentiels par dates à venir ainsi que quelques détails liés
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Scrutins_Potentiels]
	@IdUser INT,
	@Page INT,
	@PageSize INT,
	@Count INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET XACT_ABORT ON;
	SET FMTONLY OFF;
	SET LANGUAGE FRENCH;

    -- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)
	
	DECLARE 
		@TypeExport int=30, -- les prochaines réelles sans les demo
		@IdElectionsToRefresh nvarchar(max)='',	-- null/'' ou liste d'Id séparée par des ;
		@ElectionToFind nvarchar(max)='',
		@AvecMax int=0, -- 0 Avec | 1 Que Max | 2 Sans Max
		@Ordre int=0,	-- 0 Database | 1 Date d'élection | 2 Company | 3 Email | 5 Date de création
		@Active int=0,	-- Filtre sur sélection des élections
	 		-- 0 Actives | 1 sans les annulées | 2 toutes | 3 que les annulées | 4 Actives et terminées
		@Filtre int=0	-- filtre sur présentation des résultats

	declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY('Edition')) like '%Azure%' then 1 else 0 end)

	declare @dates table 
	(
		[Date] date primary key, 
		Planning NVARCHAR(MAX), 
		ElectionsPotentielles int, 
		Elections int, 
		ElecteursPotentiels int,
		ElecteursPrevus int, 
		ElecteursConnectes int, 
		Percentage decimal, 
		DemandesDeCode int
	)

	SET NOCOUNT ON;

	if isnull(trim(@IdElectionsToRefresh),'')<>''
		begin
			declare @IdElectionToRefresh int=0, @P int=0
			declare @SPLIT_ELECTIONS_FORCE table (Id int)

			set @P=0
			set @P=CHARINDEX(';',@IdElectionsToRefresh)
			while @P>0
			begin
				insert @SPLIT_ELECTIONS_FORCE
				select convert(int,TRIM(LEFT(@IdElectionsToRefresh,@P-1)))
				where TRIM(LEFT(@IdElectionsToRefresh,@P-1))<>''

				set @IdElectionsToRefresh=TRIM(RIGHT(@IdElectionsToRefresh,LEN(@IdElectionsToRefresh)-@P))
				set @P=CHARINDEX(';',@IdElectionsToRefresh)
			end
			if TRIM(@IdElectionsToRefresh)<>''
				insert @SPLIT_ELECTIONS_FORCE
				select convert(int,TRIM(@IdElectionsToRefresh))
	
			declare C cursor local fast_forward
			for	select Id from @SPLIT_ELECTIONS_FORCE 
				order by ID
			open C 
			fetch next from C into @IdElectionToRefresh
			while @@FETCH_STATUS=0
			begin
				print 'Force : '+convert(nvarchar,@IdElectionToRefresh)
				exec [TeRepository].[dbo].[_Admin_Refresh_Election_Force] @IdElectionToRefresh
		
				fetch next from C into @IdElectionToRefresh
			end
			close C
			deallocate C
		end
		set NOCOUNT OFF;

		IF @AZURE = 1
			BEGIN
				declare @T Table
				(	
					IdElection int,
					VersionAPI nvarchar(50),
					CodeVote nvarchar(max),
					PAPDatabase nvarchar(128),
					PAPWebSite nvarchar(max),
					NBDatabases int,
					Creation datetime,
					DateSignaturePAP date,
					Date1erTourScellement datetime,
					Date1erTour datetime,
					Date1erTourFin datetime,
					Date1erTourLabel nvarchar(max), 
					Date2emeTourScellement datetime,
					Date2emeTour datetime,
					Date2emeTourFin datetime,
					Date2emeTourLabel nvarchar(max), 
					EtatCode int,
					Etat nvarchar(max),
					EtatDevis int,
					Devis nvarchar(max),
					Avancement nvarchar(max), NbSalaries int, NbSalariesLabel nvarchar(max), Votants int,
					Reel bit,
					NbEtablissements int, NbColleges int,
					NBListeT1 int, AvancementTour1 int, EtatUrneT1 int, EmargementT1 int,
					NBListeT2 int, AvancementTour2 int, EtatUrneT2 int, EmargementT2 int,
					Company nvarchar(max),
					Contact nvarchar(max),
					Mail nvarchar(max),
					Telephone nvarchar(max),
					UserKey nvarchar(max),
					IdUser int,
					IdCompany int,
					IdContact int,
					DEMO bit,
					MARQUE nvarchar(max),
					MARQUE_USER nvarchar(max),
					AvecBureau bit,
					ScellementALavolee bit,
					OptionCourrier bit,
					DelaiGrace int,
					OptionListe bit,
					OptionQuestion bit,
					OptionBureau bit,	--Champ proposé
					OptionTourUnique bit,
					SecuriteConnexion tinyint, 
					SecuriteBureau tinyint,

					PRIMARY KEY(IdElection,IdUser,IdContact)
				)

				declare @Previsionnel table
				(	
					IdElection int, 
					PAPDatabase nvarchar(128), 
					Company nvarchar(max), 
					NBSalariesReels int,
					[Date prévisionnelle] date, 
					[Date prévisionnelle Fin] date, 
					NTour tinyint, 
					NBListe int
				)

				declare 
					@M date, 
					@DELTA int

				IF exists (select * from @R where Role=1 OR Role=2 OR Role=6)
					BEGIN
						insert @T
						select 
							S.Id, isnull(S.VersionAPI,'A'), 'CSE', S.PAPDataBase, S.PAPWebSite, 0, null, null, 
							null, S.Date1erTourDebut, S.Date1erTourFin, null, convert(nvarchar,S.Date1erTourDebut,103), 
							null, null, null, ESP.Code, ESP.Libelle, 
							null, '',
							'',S.NbEstimeElecteurs,convert(nvarchar,S.NbEstimeElecteurs),0,0,0,0,0,0,0,0,0,0,0,0,
							C.Nom, CS.Nom +' '+CS.Prenoms, CS.Email, CS.Telephone, U.Cle as USER_KEY, 
							U.Id, C.ID, CS.Id, S.Demo, isnull(MB.Nom,''), isnull(MBU.Nom,''),
							0,0,isnull(SPO.Checked,0),0,0,0,0,0,0,0
						from UTILISATEURS U 
						inner join CONTACTS CS on CS.IdUser=U.Id
						inner join COMPANY C on CS.IdCompany=C.Id
						inner join SIMULATION_PAP S on C.Id=S.IdCompany
						inner join ETAT_SIMULATION_PAP ESP on ESP.id=S.IdEtat
						left join MARQUES_BLANCHES MB on S.Marque=MB.Marque
						left join MARQUES_BLANCHES MBU on U.Marque=MBU.Marque
						left join [dbo].[SIMULATION_PAP_OPTIONS] SPO 
							inner join [dbo].[TYPE_OPTION] SPTO on SPTO.Id=SPO.IdOption and SPTO.Code=1
						on SPO.Id=S.Id
						where @TypeExport in (9,5) or 
							((@AvecMax=0 or (@AvecMax=1 and Email='max.godet@wechooz.fr') or (@AvecMax=2 and Email<>'max.godet@wechooz.fr')) and
							(@Active=2 or (@Active=0 and ESP.Code in (2,5)) or (@Active=1 and ESP.Code in (2,4,5)) or (@Active=3 and ESP.Code=3) or (@Active=4 and ESP.Code not in (3)))) and
							(@ElectionToFind='' or PAPDataBase like '%'+@ElectionToFind+'%' or C.Nom like '%'+@ElectionToFind+'%' or CS.Nom +' '+CS.Prenoms like '%'+@ElectionToFind+'%' or CS.Email like '%'+@ElectionToFind+'%')
			
						update @T set DEMO=1 where IdCompany in (1,16,17,18,37,42,80,81,90,92,121,368,448,432)

						;with D as
						(	select D.IdSimulationPAP, DE.Libelle, DE.Code, RANK() OVER (PARTITION BY D.IdSimulationPAP ORDER BY case DE.Code when 2 then 0 else 1 end, D.Id desc) as RANG
							from DEVIS D
							inner join DEVIS_ETATS DE on D.idEtat=DE.Id
							where Code<>4	-- Pas les annulés (par nous)
						)	
						update @T set Devis=D.Libelle, EtatDevis=D.Code
						from @T T
						inner join D on D.IdSimulationPAP=T.IdElection
						where D.RANG=1 and Marque=''

						exec _Admin_Refresh_Election

						update @T
						set CodeVote=case C.CodeVote 
							when 4 then 'CSE' 
							when 5 then 'Référendum' 
							when 6 then 'AG' 
							when 7 then 'Consultation' 
							when 8 then 'ARP8' 
							when 9 then 'AG'
							when 10 then 'FCPE old'
							when 11 then 'Election simple'
							when 12 then 'FCPE'
							else '?' end,
							Creation=C.[CréationDatabase],
							NBDatabases=C.[NBDatabase],
							DateSignaturePAP=C.DateSignaturePAP,
							Date1erTourScellement=C.Date1erScellementUrnes,
							Date1erTour=C.Date1erTourDebut,
							Date1erTourFin=C.Date1erTourFin,
							Date1erTourLabel=
								convert(nvarchar(max),C.Date1erTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourDebut)),2)+' - '+
								case when convert(date,C.Date1erTourFin)=convert(date,Date1erTourDebut) then '' else convert(nvarchar(max),C.Date1erTourFin,103)+ ' ' end +
								right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourFin)),2)
								+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,
							Date2emeTourScellement=C.Date2emeScellementUrnes,
							Date2emeTour=C.Date2emeTourDebut,
							Date2emeTourFin=C.Date2emeTourFin,
							Date2emeTourLabel=
								isnull(convert(nvarchar(max),C.Date2emeTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourDebut)),2)+' - '+
								case when convert(date,C.Date2emeTourFin)=convert(date,Date2emeTourDebut) then '' else convert(nvarchar(max),C.Date2emeTourFin,103)+ ' ' end +
								right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourFin)),2)
								+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,''),
							Avancement=	convert(nvarchar,C.Avancement)+
								case C.Avancement when 4 then '-'+convert(nvarchar,C.Avancement1erTour) 
								when 5 then '-'+convert(nvarchar,C.Avancement2ndTour) else '' end,
							NbSalaries=case C.NbSalaries when 0 then T.NbSalaries else C.NbSalaries end,
							Votants=isnull(C.Votants,0),
							NbEtablissements=C.NbEtablissements,
							NbColleges=C.NbColleges,
							Reel=case C.NbSalaries when 0 then 0 else 1 end,
							NBListeT1=C.NBListeT1,
							AvancementTour1=C.Avancement1erTour,
							EtatUrneT1=isnull(C.EtatUrneT1,0),
							EmargementT1=ISNULL(C.EmargementT1,0),
							NBListeT2=C.NBListeT2,
							AvancementTour2=C.Avancement2ndTour,
							EtatUrneT2=isnull(C.EtatUrneT2,0),
							EmargementT2=ISNULL(C.EmargementT2,0),
							DelaiGrace=C.DelaiGrace,
							AvecBureau=C.AvecBureau,
							ScellementALavolee=C.ScellementALaVolee,
							OptionListe=[dbo].[FN_GetVoteOptionActivation](T.IdElection,9),
							OptionQuestion=[dbo].[FN_GetVoteOptionActivation](T.IdElection,10),
							OptionBureau=[dbo].[FN_GetVoteOptionActivation](T.IdElection,87),
							OptionTourUnique=[dbo].[FN_GetVoteOptionActivation](T.IdElection,1),
							SecuriteConnexion=C.SecuriteConnexion,
							SecuriteBureau=C.SecuriteBureau
						from @T T
						inner join Admin_Election_Infos C on C.IdElection=T.IdElection
			
						update @T set NbSalariesLabel=RIGHT('     '+CONVERT(nvarchar,NbSalaries),5)+ case when Votants>0 then ' | Elect='+RIGHT('     '+CONVERT(nvarchar,Votants),5) else '' end
			
						insert @Previsionnel
						select distinct IdElection,PAPDatabase,Company,
							NbSalaries,
							Date1erTour,Date1erTourFin,
							1, NBListeT1
						from @T
						where Etat in ('Validée','Clôturée')
							and (DEMO=0 or @Filtre in (1,2))
	
						insert @Previsionnel
						select distinct IdElection,PAPDatabase,Company,
							NbSalaries,
							Date2emeTour,Date2emeTourFin,
							2, NBListeT2
						from @T
						where Etat in ('Validée','Clôturée')
							and (DEMO=0 or @Filtre in (1,2))

						select 
							@M=min([Date prévisionnelle]),
							@DELTA=datediff(dd,min([Date prévisionnelle]),
							max([Date prévisionnelle Fin])) 
						from @Previsionnel

				
						;with R as
						(	select top (@DELTA) ROW_NUMBER() OVER(ORDER BY O1.Id) as R
							from sys.sysobjects O1 cross join sys.sysobjects O2
						)
						insert @dates
						select dateadd(dd,R.R,@M),'',0,0,0,0,0,0,0 from R

						if @TypeExport=30
							delete @Dates where date<convert(date,dbo.GetRealdate()-8)

						;with C as
						(	select D.Date, count(distinct IdElection) as Elections, 
								sum(P.NBSalariesReels) as NBSalariesReels
							from @Previsionnel P
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin]
							where NBListe>0
							group by D.Date
						)
						update D set Elections=C.Elections, ElecteursPrevus=C.NBSalariesReels
						from @dates D inner join C on C.Date=D.Date

						;with C as
						(	select D.Date, count(distinct IdElection) as Elections, 
								sum(P.NBSalariesReels) as NBSalariesSupposés
							from @Previsionnel P
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin]
							group by D.Date
						)
						update D set ElectionsPotentielles=C.Elections, ElecteursPotentiels=NBSalariesSupposés
						from @dates D inner join C on C.Date=D.Date
		
						;with C as
						(	select D.date,P.IdElection, count(distinct SMS.Identifiant) as NBReel, count(*) as NB
							from SEND_MAIL_SMS SMS 
							inner join @Previsionnel P on P.IdElection=SMS.IdElection
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin] and D.Date=convert(date,SMS.Date)
							where SMS.Type=-1	-- code de connexion
							and D.Date<=convert(date,dbo.GetRealdate())
							group by D.Date,P.IdElection
						), SC as
						(	select Date, sum(NBReel) as NBReel, sum(NB) as NB from C group by Date)
						update D set ElecteursConnectes=NBReel, DemandesDeCode=NB
						from @dates D inner join SC on SC.Date=D.Date

						;with C as
						(	select D.Date, count(distinct P.IdElection) as NB 
							from @Previsionnel P
							inner join @Dates D on D.Date between dateadd(dd,1,[Date prévisionnelle]) and [Date prévisionnelle Fin]
							where NBListe>0
							group by D.Date
						)

						select 
							Date, 
							case when convert(date,dbo.GetRealdate())=Date then 'AUJOURD''HUI'
							when convert(date,dbo.GetRealdate()+1)=Date then 'DEMAIN'
							when Date between convert(date,dbo.GetRealdate()) and convert(date,dateadd(dd,7,dbo.GetRealdate())) then 
								case DATEPART(dw,date)
								when 1 then 'LUNDI'
								when 2 then 'MARDI'
								when 3 then 'MERCREDI'
								when 4 then 'JEUDI'
								when 5 then 'VENDREDI'
								when 6 then 'SAMEDI'
								when 7 then 'DIMANCHE'
								else 'BIENTOT' end + ' '+convert(nvarchar,DAY(date))
								+ case when DATEPART(dy,date) in (1,2,3) or
									date between convert(date,getdate()+1) and convert(date,getdate()+2)
									then '/'+convert(nvarchar,MONTH(date)) else '' end
								+ case when DATEPART(dy,date) in (1,2,3) and
									date between convert(date,getdate()+1) and convert(date,getdate()+2)
									then '/'+convert(nvarchar,YEAR(date)) else '' end
							when Date between convert(date,dateadd(dd,8,dbo.GetRealdate())) and convert(date,dateadd(dd,15,dbo.GetRealdate())) then 'PROCHAINEMENT'
							else ''
							end as Planning,
							ElectionsPotentielles, 
							Elections, 
							ElecteursPotentiels, 
							ElecteursPrevus, 
							ElecteursConnectes,
							case when ElecteursPrevus>0 then convert(decimal(18,2),ElecteursConnectes*100.0/ElecteursPrevus) else 0 end as Percentage,
							DemandesDeCode,
							ROW_NUMBER() OVER (ORDER BY Date) AS RowNumber
						INTO #T
						from @Dates order by Date

						SELECT
							@Count = COUNT(*)
						FROM #T

						DELETE #T WHERE NOT (@PageSize=0 OR (RowNumber BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

						SELECT 
							[Date], 
							Planning, 
							ElectionsPotentielles, 
							Elections, 
							ElecteursPotentiels,
							ElecteursPrevus, 
							ElecteursConnectes, 
							Percentage, 
							DemandesDeCode
						FROM #T
					END
				
				ELSE IF exists (select * from @R where Role=7)
					BEGIN
						insert @T
						select 
							S.Id, isnull(S.VersionAPI,'A'), 'CSE', S.PAPDataBase, S.PAPWebSite, 0, null, null, 
							null, S.Date1erTourDebut, S.Date1erTourFin, null, convert(nvarchar,S.Date1erTourDebut,103), 
							null, null, null, ESP.Code, ESP.Libelle, 
							null, '',
							'',S.NbEstimeElecteurs,convert(nvarchar,S.NbEstimeElecteurs),0,0,0,0,0,0,0,0,0,0,0,0,
							C.Nom, CS.Nom +' '+CS.Prenoms, CS.Email, CS.Telephone, U.Cle as USER_KEY, 
							U.Id, C.ID, CS.Id, S.Demo, isnull(MB.Nom,''), isnull(MBU.Nom,''),
							0,0,isnull(SPO.Checked,0),0,0,0,0,0,0,0
						from UTILISATEURS U 
						inner join CONTACTS CS on CS.IdUser=U.Id
						inner join COMPANY C on CS.IdCompany=C.Id
						inner join SIMULATION_PAP S on C.Id=S.IdCompany
						inner join ETAT_SIMULATION_PAP ESP on ESP.id=S.IdEtat
						left join MARQUES_BLANCHES MB on S.Marque=MB.Marque
						left join MARQUES_BLANCHES MBU on U.Marque=MBU.Marque
						left join [dbo].[SIMULATION_PAP_OPTIONS] SPO 
							inner join [dbo].[TYPE_OPTION] SPTO on SPTO.Id=SPO.IdOption and SPTO.Code=1
						on SPO.Id=S.Id
						where @TypeExport in (9,5) or 
							((@AvecMax=0 or (@AvecMax=1 and Email='max.godet@wechooz.fr') or (@AvecMax=2 and Email<>'max.godet@wechooz.fr')) and
							(@Active=2 or (@Active=0 and ESP.Code in (2,5)) or (@Active=1 and ESP.Code in (2,4,5)) or (@Active=3 and ESP.Code=3) or (@Active=4 and ESP.Code not in (3)))) and
							(@ElectionToFind='' or PAPDataBase like '%'+@ElectionToFind+'%' or C.Nom like '%'+@ElectionToFind+'%' or CS.Nom +' '+CS.Prenoms like '%'+@ElectionToFind+'%' or CS.Email like '%'+@ElectionToFind+'%')
			
						update @T set DEMO=1 where IdCompany in (1,16,17,18,37,42,80,81,90,92,121,368,448,432)

						;with D as
						(	select D.IdSimulationPAP, DE.Libelle, DE.Code, RANK() OVER (PARTITION BY D.IdSimulationPAP ORDER BY case DE.Code when 2 then 0 else 1 end, D.Id desc) as RANG
							from DEVIS D
							inner join DEVIS_ETATS DE on D.idEtat=DE.Id
							where Code<>4	-- Pas les annulés (par nous)
						)	
						update @T set Devis=D.Libelle, EtatDevis=D.Code
						from @T T
						inner join D on D.IdSimulationPAP=T.IdElection
						where D.RANG=1 and Marque=''

						exec _Admin_Refresh_Election

						update @T
						set CodeVote=case C.CodeVote 
							when 4 then 'CSE' 
							when 5 then 'Référendum' 
							when 6 then 'AG' 
							when 7 then 'Consultation' 
							when 8 then 'ARP8' 
							when 9 then 'AG'
							when 10 then 'FCPE old'
							when 11 then 'Election simple'
							when 12 then 'FCPE'
							else '?' end,
							Creation=C.[CréationDatabase],
							NBDatabases=C.[NBDatabase],
							DateSignaturePAP=C.DateSignaturePAP,
							Date1erTourScellement=C.Date1erScellementUrnes,
							Date1erTour=C.Date1erTourDebut,
							Date1erTourFin=C.Date1erTourFin,
							Date1erTourLabel=
								convert(nvarchar(max),C.Date1erTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourDebut)),2)+' - '+
								case when convert(date,C.Date1erTourFin)=convert(date,Date1erTourDebut) then '' else convert(nvarchar(max),C.Date1erTourFin,103)+ ' ' end +
								right('0'+convert(nvarchar(max),datepart(HH,C.Date1erTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date1erTourFin)),2)
								+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,
							Date2emeTourScellement=C.Date2emeScellementUrnes,
							Date2emeTour=C.Date2emeTourDebut,
							Date2emeTourFin=C.Date2emeTourFin,
							Date2emeTourLabel=
								isnull(convert(nvarchar(max),C.Date2emeTourDebut,103)+' '+right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourDebut)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourDebut)),2)+' - '+
								case when convert(date,C.Date2emeTourFin)=convert(date,Date2emeTourDebut) then '' else convert(nvarchar(max),C.Date2emeTourFin,103)+ ' ' end +
								right('0'+convert(nvarchar(max),datepart(HH,C.Date2emeTourFin)),2)+':'+right('0'+convert(nvarchar(max),datepart(N,C.Date2emeTourFin)),2)
								+ case when C.DelaiGrace is null then '' else ' + '+convert(nvarchar,C.DelaiGrace)+'''' end,''),
							Avancement=	convert(nvarchar,C.Avancement)+
								case C.Avancement when 4 then '-'+convert(nvarchar,C.Avancement1erTour) 
								when 5 then '-'+convert(nvarchar,C.Avancement2ndTour) else '' end,
							NbSalaries=case C.NbSalaries when 0 then T.NbSalaries else C.NbSalaries end,
							Votants=isnull(C.Votants,0),
							NbEtablissements=C.NbEtablissements,
							NbColleges=C.NbColleges,
							Reel=case C.NbSalaries when 0 then 0 else 1 end,
							NBListeT1=C.NBListeT1,
							AvancementTour1=C.Avancement1erTour,
							EtatUrneT1=isnull(C.EtatUrneT1,0),
							EmargementT1=ISNULL(C.EmargementT1,0),
							NBListeT2=C.NBListeT2,
							AvancementTour2=C.Avancement2ndTour,
							EtatUrneT2=isnull(C.EtatUrneT2,0),
							EmargementT2=ISNULL(C.EmargementT2,0),
							DelaiGrace=C.DelaiGrace,
							AvecBureau=C.AvecBureau,
							ScellementALavolee=C.ScellementALaVolee,
							OptionListe=[dbo].[FN_GetVoteOptionActivation](T.IdElection,9),
							OptionQuestion=[dbo].[FN_GetVoteOptionActivation](T.IdElection,10),
							OptionBureau=[dbo].[FN_GetVoteOptionActivation](T.IdElection,87),
							OptionTourUnique=[dbo].[FN_GetVoteOptionActivation](T.IdElection,1),
							SecuriteConnexion=C.SecuriteConnexion,
							SecuriteBureau=C.SecuriteBureau
						from @T T
						inner join Admin_Election_Infos C on C.IdElection=T.IdElection
			
						update @T set NbSalariesLabel=RIGHT('     '+CONVERT(nvarchar,NbSalaries),5)+ case when Votants>0 then ' | Elect='+RIGHT('     '+CONVERT(nvarchar,Votants),5) else '' end

						insert @Previsionnel
						select distinct IdElection,PAPDatabase,Company,
							NbSalaries,
							Date1erTour,Date1erTourFin,
							1, NBListeT1
						from @T
						where Etat in ('Validée','Clôturée')
							and (DEMO=0 or @Filtre in (1,2))
	
						insert @Previsionnel
						select distinct IdElection,PAPDatabase,Company,
							NbSalaries,
							Date2emeTour,Date2emeTourFin,
							2, NBListeT2
						from @T
						where Etat in ('Validée','Clôturée')
							and (DEMO=0 or @Filtre in (1,2))
							
						select 
							@M=min([Date prévisionnelle]),
							@DELTA=datediff(dd,min([Date prévisionnelle]),
							max([Date prévisionnelle Fin])) 
						from @Previsionnel

				
						;with R as
						(	select top (@DELTA) ROW_NUMBER() OVER(ORDER BY O1.Id) as R
							from sys.sysobjects O1 cross join sys.sysobjects O2
						)
						insert @dates
						select dateadd(dd,R.R,@M),'',0,0,0,0,0,0,0 from R

						if @TypeExport=30
							delete @Dates where date<convert(date,dbo.GetRealdate()-8)

						;with C as
						(	select D.Date, count(distinct IdElection) as Elections, 
								sum(P.NBSalariesReels) as NBSalariesReels
							from @Previsionnel P
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin]
							where NBListe>0
							group by D.Date
						)
						update D set Elections=C.Elections, ElecteursPrevus=C.NBSalariesReels
						from @dates D inner join C on C.Date=D.Date

						;with C as
						(	select D.Date, count(distinct IdElection) as Elections, 
								sum(P.NBSalariesReels) as NBSalariesSupposés
							from @Previsionnel P
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin]
							group by D.Date
						)
						update D set ElectionsPotentielles=C.Elections, ElecteursPotentiels=NBSalariesSupposés
						from @dates D inner join C on C.Date=D.Date
		
						;with C as
						(	select D.date,P.IdElection, count(distinct SMS.Identifiant) as NBReel, count(*) as NB
							from SEND_MAIL_SMS SMS 
							inner join @Previsionnel P on P.IdElection=SMS.IdElection
							inner join @Dates D on D.Date between [Date prévisionnelle] and [Date prévisionnelle Fin] and D.Date=convert(date,SMS.Date)
							where SMS.Type=-1	-- code de connexion
							and D.Date<=convert(date,dbo.GetRealdate())
							group by D.Date,P.IdElection
						), SC as
						(	select Date, sum(NBReel) as NBReel, sum(NB) as NB from C group by Date)
						update D set ElecteursConnectes=NBReel, DemandesDeCode=NB
						from @dates D inner join SC on SC.Date=D.Date

						;with C as
						(	select D.Date, count(distinct P.IdElection) as NB 
							from @Previsionnel P
							inner join @Dates D on D.Date between dateadd(dd,1,[Date prévisionnelle]) and [Date prévisionnelle Fin]
							where NBListe>0
							group by D.Date
						)

						select 
							Date, 
							case when convert(date,dbo.GetRealdate())=Date then 'AUJOURD''HUI'
							when convert(date,dbo.GetRealdate()+1)=Date then 'DEMAIN'
							when Date between convert(date,dbo.GetRealdate()) and convert(date,dateadd(dd,7,dbo.GetRealdate())) then 
								case DATEPART(dw,date)
								when 1 then 'LUNDI'
								when 2 then 'MARDI'
								when 3 then 'MERCREDI'
								when 4 then 'JEUDI'
								when 5 then 'VENDREDI'
								when 6 then 'SAMEDI'
								when 7 then 'DIMANCHE'
								else 'BIENTOT' end + ' '+convert(nvarchar,DAY(date))
								+ case when DATEPART(dy,date) in (1,2,3) or
									date between convert(date,getdate()+1) and convert(date,getdate()+2)
									then '/'+convert(nvarchar,MONTH(date)) else '' end
								+ case when DATEPART(dy,date) in (1,2,3) and
									date between convert(date,getdate()+1) and convert(date,getdate()+2)
									then '/'+convert(nvarchar,YEAR(date)) else '' end
							when Date between convert(date,dateadd(dd,8,dbo.GetRealdate())) and convert(date,dateadd(dd,15,dbo.GetRealdate())) then 'PROCHAINEMENT'
							else ''
							end as Planning,
							ElectionsPotentielles, 
							Elections, 
							ElecteursPotentiels, 
							ElecteursPrevus, 
							ElecteursConnectes,
							case when ElecteursPrevus>0 then convert(decimal(18,2),ElecteursConnectes*100.0/ElecteursPrevus) else 0 end as Percentage,
							DemandesDeCode,
							ROW_NUMBER() OVER (ORDER BY Date) AS RowNumber2
						INTO #T2
						from @Dates order by Date

						SELECT
							@Count = COUNT(*)
						FROM #T2

						DELETE #T2 WHERE NOT (@PageSize=0 OR (RowNumber2 BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

						SELECT 
							[Date], 
							Planning, 
							ElectionsPotentielles, 
							Elections, 
							ElecteursPotentiels,
							ElecteursPrevus, 
							ElecteursConnectes, 
							Percentage, 
							DemandesDeCode
						FROM #T2
					END
			END
		ELSE
			BEGIN
				insert @dates
					select dbo.GetRealdate(),'',0,0,0,0,0,0,0
				SELECT 
					[Date], 
					Planning, 
					ElectionsPotentielles, 
					Elections, 
					ElecteursPotentiels,
					ElecteursPrevus, 
					ElecteursConnectes, 
					Percentage, 
					DemandesDeCode,
					ROW_NUMBER() OVER (ORDER BY Date) AS RowNumber3
				INTO #T3
				FROM @dates ORDER BY Date

				SELECT
					@Count = COUNT(*)
				FROM #T3

				DELETE #T3 WHERE NOT (@PageSize=0 OR (RowNumber3 BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

				SELECT 
					[Date], 
					Planning, 
					ElectionsPotentielles, 
					Elections, 
					ElecteursPotentiels,
					ElecteursPrevus, 
					ElecteursConnectes, 
					Percentage, 
					DemandesDeCode
				FROM #T3
			END
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Support_Analyse_Vote]    Script Date: 21/07/2021 10:07:37 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Support_Analyse_Vote]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Support_Analyse_Vote] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 12/07/2021
-- Description:	Lancer les 3 tableaux d''analyse de vote dans Administration => Support => Bouton : Déroulement Scrutin => Affichage de la PopIn comprenant les 3 tableaux suivants
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Support_Analyse_Vote] 
	@IdElection INT = 1535

AS
BEGIN
	SET NOCOUNT ON
    SET XACT_ABORT ON 
    SET FMTONLY OFF
	SET LANGUAGE FRENCH

	DELETE [dbo].[Admin_Analyse_Vote_Tour] WHERE IdElection=@IdElection
	DELETE [dbo].[Admin_Analyse_Vote_Bureau_Membres] WHERE IdElection=@IdElection
	DELETE [dbo].[Admin_Analyse_Vote_Urnes] WHERE IdElection=@IdElection

    DECLARE @PAPDatabase NVARCHAR(128) -- => type par défaut pour les noms de bdd, nvarchar de 128
    SELECT @PAPDatabase = PAPDataBase         
    FROM SIMULATION_PAP 
    WHERE Id = @IdElection

    DECLARE 
		@VersionAPI nvarchar(50),
		@Req1 nvarchar(max),
		@Req2 nvarchar(max),
		@ReqTourA NVARCHAR(MAX), 
		@ReqTourB NVARCHAR(MAX), 
		@ReqBureauA NVARCHAR(MAX),
		@ReqBureauB NVARCHAR(MAX),
		@ReqUrnesA NVARCHAR(MAX),
		@ReqUrnesB NVARCHAR(MAX),
		@ReqUrnesDatabasesVotes NVARCHAR(MAX),
		@AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY('Edition')) like '%Azure%' then 1 else 0 end)
	
	select distinct @PAPDatabase, @IdElection
	where @PAPDatabase is not null
				
	select @VersionAPI=VersionAPI 
	from SIMULATION_PAP 
	where Id=@IdElection
			
	print @PAPDatabase
	
	-- VARIABLE FIXE, NECESSAIRE POUR CHAQUE TABLE
	SELECT @Req1 = '
		set LANGUAGE FRENCH
		declare 
			@NTour tinyint= null

		if @NTour is null
		begin
			set @NTour=1
			if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](1)=0
			begin
				declare @Avancement int,@AvancementTour2 int
				select @Avancement=EtatAvancement,@AvancementTour2=EtatAvancement2emeTour
				from ['+@PAPDatabase+'].dbo.PAP
				cross apply ['+@PAPDatabase+'].dbo.[FN_GetElectionAvancements](['+@PAPDatabase+'].dbo.PAP.Id)

				if @Avancement in (5,6) and @AvancementTour2>=2 set @NTour=2
			end
		end

		-- AVANCEMENT
		declare 
			@DEMO bit=0,
			@IdElection int
		select @DEMO=DEMO, @IdElection=Id from ['+@PAPDatabase+'].dbo.PAP
		'

	SELECT @ReqUrnesDatabasesVotes = @Req1 + '
		select distinct case isnull(BT.Mode_Test,0) when 0 then T.DatabaseVote 
			else T.[TestDatabaseVote] 
			end as DatabaseVote
		from ['+@PAPDatabase+'].dbo.URNES U
		inner join ['+@PAPDatabase+'].dbo.TOURS T on T.IdVote=U.IdVote
		left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on U.IdBureau=BT.IdBureau and BT.NTour=T.NTour
		where T.NTour=@NTour
		'

	declare @DBVotes table (DatabaseVote nvarchar(128), RemoteInfo nvarchar(max))
	declare @DatabaseVote nvarchar(128)

	IF @AZURE=1
		BEGIN
			SELECT @Req2=
					'IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSourceAdmin_'+@PAPDatabase+''')
						CREATE EXTERNAL DATA SOURCE DataSourceAdmin_'+@PAPDatabase+'
						WITH
						(
							TYPE=RDBMS,
							LOCATION='''+convert(nvarchar,SERVERPROPERTY('ServerName'))+'.database.windows.net'',
							DATABASE_NAME='''+@PAPDatabase+''',
							CREDENTIAL= SMMUser
						)'

		EXEC(@Req2)
			SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqUrnesDatabasesVotes,'''','''''')+''''
			insert @DBVotes
			exec (@Req2)
			delete @DBVotes where DatabaseVote is null

			IF @VersionAPI='B'
				BEGIN
					-- TOURS
					SELECT @ReqTourB = '
						;with SR as 
						(	
							select count(distinct IdCategorie) as NB 
							from ['+@PAPDatabase+'].dbo.SIEGES 
							where isnull(IdCategorie,-1)<>-1
						)

						, LSR as
						(	
							select COUNT(distinct IdCategorie) as NB
							from ['+@PAPDatabase+'].dbo.CANDIDATS CA
							where isnull(IdCategorie,-1)<>-1
						)

						select ''TOUR'' as Tour, 
							TV.Libelle + case @DEMO when 1 then '' (DEMO)'' 
													else '''' 
													end as ScrutinTour, 
							'''+@PAPDatabase+''' as PAPDatabase, 
							P.Id as IdElection,
							NTour as NTourTour, 
							convert(nvarchar,['+@PAPDatabase+'].dbo.GetRealDate(),103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,['+@PAPDatabase+'].dbo.GetRealDate())),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,['+@PAPDatabase+'].dbo.GetRealDate())),2) as Horaire, 
							case P.IdentificationElecteurs when 0 then ''Mode simple''
															when 1 then ''Mode 1: 2 canaux''
															when 2 then ''Mode 2: 2 canaux + défi''
															when 3 then ''Mode simple + défi''
															end + '' | MDP : '' + convert(nvarchar,MDPSize)+case MDPAlpha when 1 then ''A'' 
																															else ''N'' 
																															end as IdentificationElecteurs,
							isnull(convert(nvarchar,T.DateScellementUrnes,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateScellementUrnes)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateScellementUrnes)),2),''''),
							isnull(convert(nvarchar,T.Debut,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Debut)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Debut)),2), '''') as Debut,
							isnull(convert(nvarchar,T.Fin,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Fin)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Fin)),2),'''') + case when P.DelaiCloseScrutin>0 then '' +''+convert(nvarchar,P.DelaiCloseScrutin) 
																																														else '''' end as Fin,
							A.EtatAvancement,
							case @NTour when 1 then A.EtatAvancement1erTour 
																else A.EtatAvancement2emeTour 
																end as AvancementTour, 
							SR.NB as Categories, 
							LSR.NB as CategoriesRepresentees,
							isnull(convert(nvarchar,T.DateDebutDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateDebutDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateDebutDepotListe)),2),''''),
							isnull(convert(nvarchar,T.DateMaxDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateMaxDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateMaxDepotListe)),2),'''')
						from ['+@PAPDatabase+'].dbo.TOURS T
						cross apply ['+@PAPDatabase+'].dbo.FN_GetElectionAvancements(@IdElection) A
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.Id=@IdElection
						cross join SR
						cross join LSR
						cross join ['+@PAPDatabase+'].dbo.VOTES V
							inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						where NTour=@NTour
					'

					SELECT @ReqTourB = @Req1 + @ReqTourB

					-- BUREAU
					SELECT @ReqBureauB = '
						select
							''BUREAU'' + case isnull(BT.Mode_Test,0) when 1 then '' (ModeTest)'' 
																		else '''' 
																		end + case when ([Mode_Test]=1 and [StoppedTest]=1) or ([Mode_Test]=0 and [Stopped]=1) then '' (STOP)'' 
																					else '''' end as Bureau, 
						P.Id as IdElection,
						BM.IdBureau AS IdBureauBureau, 
						case P.[BureauModeSecurite] when 0 then ''non '' 
													else '''' 
													end + ''collegial'' as Collegial,
						case [Mode_Test] when 1 then EtapeScellementTest 
										else [EtapeScellement] 
										end EtapeScellement,
						case [Mode_Test] when 1 then [EtapeDepouillementTest] 
											else [EtapeDepouillement] 
											end EtapeDepouillement,
						BM.Id as IdMembre,
						President,
						case ['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78) when 1 then 
							YEAR(['+@PAPDatabase+'].dbo.GetRealDate())
							-YEAR(C.dateNaissance)
							- Case when convert(date,DATEADD(yy,YEAR(['+@PAPDatabase+'].dbo.GetRealDate())-YEAR(C.dateNaissance),C.dateNaissance))<convert(date,['+@PAPDatabase+'].dbo.GetRealDate()) 
								then 1 else 0 end
						else null end as Age,
						Nom,
						Prénoms AS Prenoms, 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInGenerationKey] 
													else [CheckInGenerationKey] 
													end [CheckInGenerationKey], 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInScellement] 
													else [CheckInScellement] 
													end [CheckInScellement], 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInDépouillement] 
													else [CheckInDépouillement] 
													end [CheckInDepouillement],
						isnull(convert(nvarchar,C.LastAction,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,C.LastAction)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,C.LastAction)),2),'''') AS LastActionBureau,
						BM.IdCollaborateur,
						isnull(convert(nvarchar, [CléScellement],1), '''') AS [CleScellement],
						isnull(convert(nvarchar,[CléScellementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléScellementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléScellementHoraire])),2),'''') AS [CleScellementHoraire],
						isnull(convert(nvarchar, [CléDépouillement],1), '''') AS [CleDepouillement],
						isnull(convert(nvarchar,[CléDépouillementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléDépouillementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléDépouillementHoraire])),2),'''') AS [CleDepouillementHoraire],
						C.MailProfessionnel,
						C.MailPersonnel,
						C.MobileProfessionnel
					from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
					cross join ['+@PAPDatabase+'].dbo.PAP P
					left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on BM.IdBureau=BT.IdBureau and BT.NTour=BM.NTour
					inner join ['+@PAPDatabase+'].dbo.COLLABORATEURS C on BM.Idcollaborateur=C.Id
					where BM.NTour=@NTour and refus=0 AND P.Id=@IdElection
					order by IdBureauBureau, case President when 1 then 0 
															else 1 
															end, 
							BM.IdCollaborateur
					'

					SELECT @ReqBureauB = @Req1 + @ReqBureauB
			

					-- URNES
					SELECT @ReqUrnesB = '

						declare @Req nvarchar(max)

						declare @URNES table
							(	
								IdElection int,
								IdUrne int, 
								IdBureauUrne int, 
								IdQuestion int, 
								Accord nvarchar(max),
								ModeTest bit, 
								DatabaseVote nvarchar(128),
								IdTour int, 
								NTourUrne tinyint, 
								IdTourUrne int, 
								EtatUrne nvarchar(max), 
								EtatUrneCode int,
								BureauMembresAction int, 
								NbScellement int, 
								NbDepouillement int,
								IdVote int, 
								CodeVote int, 
								Vote nvarchar(max),
								IdEtablissement int, 
								Etablissement nvarchar(max),
								IdCollege int, 
								CodeCollege int, 
								College nvarchar(max),
								IdScrutin int, 
								CodeScrutin int, 
								ScrutinUrne nvarchar(max),
								NbVotants int default 0, 
								VoixVotants int default 0, 
								NbNonVotants int default 0, 
								NbListes int default 0, 
								NbCandidats int default 0, 
								NbSms int default 0, 
								NbSmsPossible int default 0,
								Participation float default 0, 
								Emargement int default 0, 
								DateVote datetime, 
								LastActionUrne datetime,
								Bulletins int default 0, 
								Blancs int default 0, 
								Nuls int default 0, 
								PbBulletins int default 0,
								DateEtat datetime, 
								HashDepouillement nvarchar(max)
								PRIMARY KEY(IdUrne,IdTour,IdQuestion)
							)

						declare @P table
							(	
								NTour tinyint not null, 
								ModeTest bit,
								CodeVote int, 
								CodeCollege int, 
								College nvarchar(max), 
								CollegeLibelleVariable bit,
								IdEtablissement int, 
								Etablissement nvarchar(max), 
								ELECTEURS int, 
								VOTANTS int, 
								PARTICIPATION float
							)

						insert @URNES
							(	
								IdElection,
								IdUrne,
								IdBureauUrne,
								IdQuestion,
								Accord,
								ModeTest,
								DatabaseVote,
								IdTour,
								NTourUrne,
								IdTourUrne,
								EtatUrne,
								EtatUrneCode,
								IdVote,
								CodeVote,
								Vote,
								IdEtablissement,
								Etablissement,
								IdCollege,
								CodeCollege,
								College,
								IdScrutin,
								CodeScrutin,
								ScrutinUrne,
								DateEtat,
								HashDepouillement
							)
						'

					SELECT @ReqUrnesB += 'select 
							V.IdPAP,
							U.Id, 
							U.IdBureau, 
							isnull(TU.IdQuestion,-1), 
							isnull(Q.Accord,''''),
							isnull(BT.Mode_Test,0), 
							case isnull(BT.Mode_Test,0) when 0 then T.DatabaseVote 
														else T.[TestDatabaseVote] 
														end,
							T.Id, 
							T.NTour, 
							TU.Id, 
							ETU.Libelle,
							ETU.Code,
							U.IdVote, 
							TV.Code, 
							TV.Libelle, 
							E.Id, 
							E.Nom, 
							U.IdCollege, 
							TC.Code, 
							isnull(nullif(C.Libelle,''''),
							TC.Libelle), 
							U.IdScrutin, 
							S.Code, 
							S.Libelle,
							case ETU.Code when 2 then TU.DateScellement 
											when 3 then TU.DateDepouillement 
											else null 
											end,
							case isnull(BT.Mode_Test,0) when 0 then [HashDepouillementBureau]
														else [TestHashDepouillementBureau] 
														end
						from ['+@PAPDatabase+'].dbo.URNES U
						inner join ['+@PAPDatabase+'].dbo.VOTES V on V.Id=U.IdVote
						inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						left join ['+@PAPDatabase+'].dbo.ETABLISSEMENTS E on U.IdEtablissement=E.Id
						left join ['+@PAPDatabase+'].dbo.COLLEGES C on C.id=U.IdCollege
						left join ['+@PAPDatabase+'].dbo.TYPE_COLLEGE TC on C.IdTypeCollege=TC.Id
						left join ['+@PAPDatabase+'].dbo.SCRUTINS S on S.Id=U.IdScrutin
						inner join ['+@PAPDatabase+'].dbo.TOURS T on T.IdVote=U.IdVote
						left join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on T.Id=TU.IdTour and U.id=TU.IdUrne
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on U.IdBureau=BT.IdBureau and BT.NTour=T.NTour
						left join ['+@PAPDatabase+'].dbo.ETAT_TOUR_URNE ETU on case isnull(BT.Mode_Test,0) when 0 then TU.IdEtatTourUrne else TU.[TestIdEtatTourUrne] end=ETU.Id
						left join ['+@PAPDatabase+'].dbo.QUESTIONS Q on Q.Id=TU.IdQuestion
						where T.NTour=@NTour AND V.IdPAP=@IdElection

						;with E as
						(
							select 
								Idbureau,
								case when (BT.Mode_Test=1 and EtapeDepouillementTest=2) or (BT.Mode_Test=0 and EtapeDepouillement=2) then '' (Non affiché)'' 
										else '''' 
										end as EtatUrne
							from ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT
						)
						update U set EtatUrne=U.EtatUrne+E.EtatUrne
						from @URNES U 
						inner join E on E.IdBureau=U.IdBureauUrne
						where EtatUrneCode=3
						'

					SELECT @ReqUrnesB += '
						DECLARE 
							@Debut datetime=['+@PAPDatabase+'].[dbo].[FN_CodeNonVotant_GetDateReference](),
							@Controle bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](27),
							@AgeMin int=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](28),
							@Naissance bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78),
							@Anciennete bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](31),
							@AncienneteInterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](29),
							@AncienneteExterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](30),
							@Questions bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](10),
							@Voix bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](44)

						;with E as
						(	
							select 
								U.IdTourUrne, 
								-- cf. ['+@PAPDatabase+'].dbo.FN_CodeNonVotant
								case 
								when @Questions=1 and @Voix=1 and isnull(QC.Voix,C.Voix)=0 then 4 
								when TC.Code in (4,2) then 4
								when @Controle=0 then 0
								when @Naissance=1 and datepart(yy,@Debut-convert(datetime,C.DateNaissance))-1900<@AgeMin then 1	-- Pas encore 16 ans le jour du 1er tour
								when @Anciennete=1 and C.Interne=1 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteInterne,convert(datetime,C.DateEntree))>@Debut) then 2	-- Interne : pas 3 mois dans la société
								when @Anciennete=1 and C.Interne=0 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteExterne,convert(datetime,C.DateEntree))>@Debut) then 3	-- externe : pas 6 mois dans la société
								else 0 end as CodeNonVotant,
								C.Id as IdCollaborateur,
								C.LastAction, 
								case when @Voix=1 then isnull(QC.Voix,C.Voix) else 0 end as Voix,
								case when isnull(MailProfessionnel,'''')='''' then 1 else 0 end as PAR_SMS, case when isnull(MobileProfessionnel,'''')<>'''' then 1 else 0 end as PAR_SMS_POSSIBLE
							from ['+@PAPDatabase+'].dbo.COLLABORATEURS C
							inner join ['+@PAPDatabase+'].dbo.VOTE_COLLABORATEUR_COLLEGE VCC on VCC.IdCollaborateur=C.Id
							inner join @URNES U on U.IdVote=VCC.IdVote and isnull(nullif(U.IdEtablissement,-1),VCC.IdEtablissement)=VCC.IdEtablissement and U.IdCollege=VCC.IdCollege
							inner join ['+@PAPDatabase+'].dbo.TYPE_COLLABORATEUR TC on TC.Id=C.IdTypeCollaborateur
							left join ['+@PAPDatabase+'].dbo.QUESTION_COLLABORATEUR QC on QC.IdQuestion=U.IdQuestion and QC.IdCollaborateur=C.Id)
						, ENB as
						(	
							select 
								IdTourUrne, 
								sum(case CodeNonVotant when 0 then 1 else 0 end) as Votants,
								sum(case CodeNonVotant when 0 then Voix else 0 end) as Voix,
								sum(case CodeNonVotant when 0 then 0 else 1 end) as NonVotants,
								sum(PAR_SMS) PAR_SMS, sum(PAR_SMS_POSSIBLE) PAR_SMS_POSSIBLE,
								Max(LastAction) as LastAction
							from E
							group by IdTourUrne
						)
						update U
						set NbVotants=ENB.Votants,
							VoixVotants=ENB.Voix,
							NbNonVotants=ENB.NonVotants,
							NbSms=ENB.PAR_SMS,
							NbSmsPossible=ENB.PAR_SMS_POSSIBLE,
							LastActionUrne=ENB.LastAction
						from @URNES U
						inner join ENB on isnull(U.IdTourUrne,-1)=isnull(ENB.IdTourUrne,-1)
						'

					SELECT @ReqUrnesB += '
						;with B as
						(	
							select 
								U.IdBureauUrne,
								U.IdUrne,
								U.IdQuestion,
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInScellement] else [CheckInScellement] end)) as NbScellement, 
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInDépouillement] else [CheckInDépouillement] end)) as NbDepouillement
							from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
							inner join @URNES U on U.IdBureauUrne=BM.IdBureau and BM.NTour=@NTour
							group by U.IdBureauUrne,U.IdUrne,U.IdQuestion
						)
						update @URNES set NbScellement=B.NbScellement, NbDepouillement=B.NbDepouillement, BureauMembresAction=P.BureauMembersScellementMin
						from @URNES U
						inner join B on B.IdBureauUrne=U.IdBureauUrne and U.IdUrne=B.IdUrne and U.IdQuestion=B.IdQuestion
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.id=@IdElection

						declare @Lib nvarchar(50)=''''
						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](9)=1
						begin
							set @Lib=''NB Listes''
							declare @LISTES table
							(	
								IdListe int, 
								IdUrne int, 
								IdTour int, 
								NbCandidats int
							)

							insert @LISTES 
							(
								IdListe,
								IdUrne,
								IdTour,
								NbCandidats
							)
							select 
								LC.id, 
								IdUrne,
								U.IdTour,
								count(distinct C.id)
							from @URNES U
							inner join ['+@PAPDatabase+'].dbo.LISTE_CANDIDATS LC on LC.IdTour=U.IdTour and LC.IdCollege=U.IdCollege and LC.IdEtablissement=isnull(nullif(U.IdEtablissement,-1),LC.IdEtablissement) and LC.IdScrutin=U.IdScrutin
							inner join ['+@PAPDatabase+'].dbo.CANDIDATS C on LC.Id=C.IdListeCandidats
							group by  LC.id,IdUrne,U.IdTour

							;with L as
							(	
								select 
									IdUrne,
									IdTour,
									count(distinct IdListe) as NB_Liste, 
									sum(NbCandidats) as NB_Candidats
								from @LISTES L
								group by IdUrne,IdTour
							)
							update U
							set NbListes=L.NB_Liste, NbCandidats=L.NB_Candidats
							from @URNES U
							inner join L on U.IdUrne=L.IdUrne and U.IdTour=L.IdTour
						end

						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](10)=1
						begin
							set @Lib=''NB Questions''
							;with Q as
							(	
								select 
									TU.IdUrne, 
									TU.IdTour, 
									count(distinct Q.Id) as NB
								from ['+@PAPDatabase+'].dbo.QUESTIONS Q
								inner join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on Q.Id=TU.IdQuestion
								inner join ['+@PAPDatabase+'].dbo.TOURS T on T.Id=TU.IdTour and T.NTour=@NTour
								group by TU.IdUrne, TU.IdTour
							)
							update U
							set NbListes=NB
							from @URNES U
							inner join Q on Q.IdUrne=U.IdUrne and Q.IdTour=U.IdTour
						end
						'

					SELECT @ReqUrnesB += '
						insert @P
						select * from ['+@PAPDatabase+'].dbo.[FN_GetTourParticipation](0, @NTour,1)
						order by NTour, CodeVote, CodeCollege,IdEtablissement

						update U
						set Participation=P.PARTICIPATION
						from @URNES U
						inner join @P P on P.NTour=@NTour and P.CodeVote=U.CodeVote and isnull(P.CodeCollege,0)=isnull(U.CodeCollege,0) and P.IdEtablissement=isnull(U.IdEtablissement,-1)

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) 
								Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.Modetest=0

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS_TEST 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.ModeTest=1

						declare @IU table (Id int PRIMARY KEY, Val int)
						declare @IU_NULS table (Id int, Code int, Val int PRIMARY KEY(Id,Code))
						declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY(''Edition'')) like ''%Azure%'' then 1 else 0 end)
						declare @AvecVOIX_BULLETINS bit=1

						'

					-- CURSEUR DATABASEVOTE A REMPLACER
					declare C Cursor local fast_forward
					for select distinct DatabaseVote from @DBVotes
					open C
					fetch next from C into @DatabaseVote
					begin
						SELECT @ReqUrnesB += '
							delete @IU
							insert @IU
							select IdTourUrne, count(*) as Votes from ['+@DatabaseVote+'_BULLETINS] group by IdTourUrne
							update U 
							set BULLETINS=IU.Val
							from @URNES U
							inner join @IU IU on U.IdTourUrne=IU.Id

							delete @IU_NULS
							begin try
							insert @IU_NULS
								select IdTourUrne, case when Voix=0 and IdListe=-2 then -20 else IdListe end as Code, count(*) as Votes
								from ['+@DatabaseVote+'_VOTES] where IdListe<0 group by IdTourUrne,case when Voix=0 and IdListe=-2 then -20 else IdListe end
							update U 
								set PbBulletins=IU.Val
								from @URNES U
								inner join @IU_NULS IU on U.IdTourUrne=IU.Id
								where Code=-20
							end try
							begin catch
								set @AvecVOIX_BULLETINS=0
							end catch

							update U 
							set Nuls=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-2

							update U 
							set Blancs=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-3
							'

						fetch next from C into @DatabaseVote
					end
					close C
					deallocate C

					SELECT @ReqUrnesB += '
						select 
							''URNE'' as Urne, 
							IdElection,
							IdBureauUrne,
							ModeTest,
							NTourUrne, 
							EtatUrne + '' : '' + case when DatabaseVote is null and EtatUrne =1 then ''BASE A CREER''
													when DatabaseVote is null and EtatUrne =2 then ''ERREUR BASE ABSENTE''
													else ''BASE OK'' 
													end as EtatUrne,
							isnull(convert(nvarchar,DateEtat,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,DateEtat)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,DateEtat)),2),'''') as DateEtat,
							U.Accord,
							U.NbListes as NbListes, 
							convert(nvarchar,U.NbVotants) + case U.VoixVotants when 0 then '''' 
																				else '' [''''+convert(nvarchar,VoixVotants)+'''' voix]'' 
																				end + ''(SMS='' + convert(nvarchar,U.NbSms) + ''/'' + convert(nvarchar,U.NbSmsPossible) + '')'' as ''NbVotants'', 
							U.NbNonVotants,
							Etablissement,
							College,
							ScrutinUrne,
							U.Participation,
							U.Emargement,
							U.Bulletins,
							case when U.Emargement=U.Bulletins then ''OK'' 
									else ''KO'' 
									end as CoherenceVote,
							isnull(convert(nvarchar,U.DateVote,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.DateVote)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.DateVote)),2),'''') as DateVote,
							isnull(convert(nvarchar,U.LastActionUrne,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.LastActionUrne)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.LastActionUrne)),2),'''') as LastActionUrne,
							case EtatUrneCode when 3 then convert(nvarchar,U.Blancs) 
												else ''--'' 
												end Blancs,
							case EtatUrneCode when 3 then convert(nvarchar,U.Nuls) 
												else ''--'' 
												end Nuls,
							case when EtatUrneCode<3 or @AvecVOIX_BULLETINS=0 then ''--'' 
									else convert(nvarchar,U.PbBulletins) 
									end PbBulletins,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--'' 
									else convert(nvarchar,convert(float,NbVotants)/2) 
									end as Quorum,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--''
									when (U.Emargement-U.Nuls-U.Blancs-U.PbBulletins)>convert(decimal,NbVotants)/2 then ''Oui''
									else ''Non'' 
									end as QuorumAtteint,
							BureauMembresAction, 
							NbScellement, 
							NbDepouillement,
							Vote,
							U.IdUrne,
							U.IdTour,
							isnull(IdTourUrne,-1) as IdTourUrne,
							HashDepouillement
						from @URNES U
					'
					SELECT @ReqUrnesB = @Req1 + @ReqUrnesB
			
					--print len(@ReqUrnesB)
					----print @ReqUrnesB
					--Print SubString(@ReqUrnesB, 1, 4000)
					--Print SubString(@ReqUrnesB, 4001, 8000)
					--Print SubString(@ReqUrnesB, 8001, 12000)
					--Print SubString(@ReqUrnesB, 12001, 16000)
					--Print SubString(@ReqUrnesB, 16001, 20000)

					--declare @I int=1
		   --         print '--------------------------------'
					--while @I<LEN(@ReqTourB)
		   --         begin
		   --             print (substring(@ReqTourB,@I,1000))
		   --             set @I+=1000
		   --         end
		   --         print '--------------------------------'
		   --         set @I=1
					--while @I<LEN(@ReqBureauB)
		   --         begin
		   --             print (substring(@ReqBureauB,@I,1000))
		   --             set @I+=1000
		   --         end
		   --         print '--------------------------------'
		   --         set @I=1
					--while @I<LEN(@ReqUrnesB)
		   --         begin
		   --             print (substring(@ReqUrnesB,@I,1000))
		   --             set @I+=1000
		   --         end
		   --         print '--------------------------------'

					print 'Azure 1 VB avant Insert AVT'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqTourB,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Tour
					(
						Tour,
						ScrutinTour,
						PAPDatabase,
						IdElection,
						NTourTour,
						Horaire,
						IdentificationElecteurs,
						DateScellementUrnes,
						Debut,
						Fin,
						EtatAvancement,
						AvancementTour,
						Categories,
						CategoriesRepresentees,
						DateDebutDepotListe,
						DateMaxDepotListe,
						RemoteInfo
					)
					EXEC (@Req2)

					print 'Azure 1 VB avant Insert AVBM'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqBureauB,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Bureau_Membres
					(
						Bureau,
						IdElection,
						IdBureauBureau,
						Collegial,
						EtapeScellement,
						EtapeDepouillement,
						IdMembre,
						President,
						Age,
						Nom,
						Prenoms,
						[CheckInGenerationKey],
						[CheckInScellement],
						[CheckInDepouillement],
						LastActionBureau,
						IdCollaborateur,
						[CleScellement],
						[CleScellementHoraire],
						[CleDepouillement],
						[CleDepouillementHoraire],
						MailProfessionnel,
						MailPersonnel,
						MobileProfessionnel,
						RemoteInfo
					)
					EXEC (@Req2)

					print 'Azure 1 VB avant Insert AVU'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqUrnesB,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Urnes
					(
						Urne,
						IdElection,
						IdBureauUrne,
						ModeTest,
						NTourUrne,
						EtatUrne,
						DateEtat,
						Accord,
						NbListes,
						NbVotants,
						NbNonVotants,
						Etablissement,
						College,
						ScrutinUrne,
						Participation,
						Emargement,
						Bulletins,
						CoherenceVote,
						DateVote,
						LastActionUrne,
						Blancs,
						Nuls,
						PbBulletins,
						Quorum,
						QuorumAtteint,
						BureauMembresAction,
						NbScellement,
						NbDepouillement,
						Vote,
						IdUrne,
						IdTour,
						IdTourUrne,
						HashDepouillement,
						RemoteInfo
					)
					EXEC (@Req2)
					print 'Azure 1 VB après Insert AVU'
				END

			ELSE IF @VersionAPI = 'A'
				BEGIN
					-- TOURS
					SELECT @ReqTourA = '
						;with SR as 
						(	select count(distinct IdCategorie) as NB from ['+@PAPDatabase+'].dbo.SIEGES where isnull(IdCategorie,-1)<>-1)
						, LSR as
						(	select COUNT(distinct IdCategorie) as NB
							from ['+@PAPDatabase+'].dbo.CANDIDATS CA
							where isnull(IdCategorie,-1)<>-1
						)
						select 
							''TOUR'' as Tour, 
							TV.Libelle, 
							'''+@PAPDatabase+''' as PAPDatabase, 
							P.Id as IdElection,
							NTour as NTourTour, 
							convert(nvarchar,['+@PAPDatabase+'].dbo.GetRealDate(),103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,['+@PAPDatabase+'].dbo.GetRealDate())),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,['+@PAPDatabase+'].dbo.GetRealDate())),2) as Horaire, 
							isnull(convert(nvarchar,T.DateScellementUrnes,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateScellementUrnes)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateScellementUrnes)),2),''''),
							isnull(convert(nvarchar,T.Debut,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Debut)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Debut)),2),''''),
							isnull(convert(nvarchar,T.Fin,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Fin)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Fin)),2),''''),
							P.DelaiCloseScrutin,
							A.EtatAvancement,
							case @NTour when 1 then A.EtatAvancement1erTour 
																else A.EtatAvancement2emeTour 
																end as AvancementTour, 
							@DEMO as Demo,
							MDPSize, 
							MDPAlpha,
							SR.NB as Categories, 
							LSR.NB as CategoriesRepresentees,
							isnull(convert(nvarchar,T.DateDebutDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateDebutDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateDebutDepotListe)),2),''''),
							isnull(convert(nvarchar,T.DateMaxDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateMaxDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateMaxDepotListe)),2),'''')
						from ['+@PAPDatabase+'].dbo.TOURS T
						cross apply ['+@PAPDatabase+'].dbo.FN_GetElectionAvancements(@IdElection) A
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.Id=@IdElection
						cross join SR
						cross join LSR
						cross join ['+@PAPDatabase+'].dbo.VOTES V
							inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						where NTour=@NTour
						'

					SET @ReqTourA = @Req1 + @ReqTourA


					-- BUREAU
					SELECT @ReqBureauA = '
						select 
							''BUREAU'' as Bureau, 
							C.IdPAP as IdElection,
							BM.IdBureau AS IdBureauBureau, 
							isnull(BT.Mode_Test,0) as ModeTest, 
							BM.Id as IdMembre,
							Nom,
							Prénoms AS Prenoms,
							isnull(convert(nvarchar,C.dateNaissance,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,convert(datetime,C.dateNaissance))),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,convert(datetime,C.dateNaissance))),2),'''') AS DateNaissance, 
							isnull(convert(nvarchar,C.LastAction,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,C.LastAction)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,C.LastAction)),2),'''') AS LastActionBureau,
							case ['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78) when 1 then 
								YEAR(['+@PAPDatabase+'].dbo.GetRealDate())
								-YEAR(C.dateNaissance)
								- Case when convert(date,DATEADD(yy,YEAR(['+@PAPDatabase+'].dbo.GetRealDate())-YEAR(C.dateNaissance),C.dateNaissance))<convert(date,['+@PAPDatabase+'].dbo.GetRealDate()) 
									then 1 else 0 end
							else null end as Age,
							President,
							BM.IdCollaborateur,
							case isnull(BT.Mode_Test,0) when 1 then [TestCheckInScellement] 
														else [CheckInScellement] 
														end [CheckInScellement], 
							isnull(convert(nvarchar, [CléScellement]), '''') AS [CleScellement],
							isnull(convert(nvarchar,[CléScellementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléScellementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléScellementHoraire])),2),'''') AS [CleScellementHoraire],
							case isnull(BT.Mode_Test,0) when 1 then [TestCheckInDépouillement] 
														else [CheckInDépouillement] 
														end [CheckInDepouillement], 
							isnull(convert(nvarchar, [CléDépouillement]), '''') AS [CleDepouillement],
							isnull(convert(nvarchar,[CléDépouillementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléDépouillementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléDépouillementHoraire])),2),'''') AS [CleDepouillementHoraire],
							C.MailProfessionnel,
							C.MobileProfessionnel
						from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on BM.IdBureau=BT.IdBureau and BT.NTour=BM.NTour
						inner join ['+@PAPDatabase+'].dbo.COLLABORATEURS C on BM.Idcollaborateur=C.Id
						where BM.NTour=@NTour and refus=0 AND C.IdPAP=@IdElection
						order by IdBureauBureau, case President when 1 then 0 
																else 1 
																end, 
								BM.IdCollaborateur
					'

					SET @ReqBureauA = @Req1 + @ReqBureauA


					-- URNES
					SELECT @ReqUrnesA = '

						declare @Req nvarchar(max)

						declare @URNES table
							(	
								IdElection int,
								IdUrne int, 
								IdBureauUrne int, 
								IdQuestion int, 
								Accord nvarchar(max),
								ModeTest bit, 
								DatabaseVote nvarchar(128),
								IdTour int, 
								NTourUrne tinyint, 
								IdTourUrne int, 
								EtatUrne nvarchar(max), 
								EtatUrneCode int,
								BureauMembresAction int, 
								NbScellement int, 
								NbDepouillement int,
								IdVote int, 
								CodeVote int, 
								Vote nvarchar(max),
								IdEtablissement int, 
								Etablissement nvarchar(max),
								IdCollege int, 
								CodeCollege int, 
								College nvarchar(max),
								IdScrutin int, 
								CodeScrutin int, 
								ScrutinUrne nvarchar(max),
								NbVotants int default 0, 
								VoixVotants int default 0, 
								NbNonVotants int default 0, 
								NbListes int default 0, 
								NbCandidats int default 0, 
								NbSms int default 0, 
								NbSmsPossible int default 0,
								Participation float default 0, 
								Emargement int default 0, 
								DateVote datetime, 
								LastActionUrne datetime,
								Bulletins int default 0, 
								Blancs int default 0, 
								Nuls int default 0, 
								PbBulletins int default 0,
								DateEtat datetime, 
								HashDepouillement nvarchar(max)
								PRIMARY KEY(IdUrne,IdTour,IdQuestion)
							)

						declare @P table
							(	
								NTour tinyint not null, 
								ModeTest bit,
								CodeVote int, 
								CodeCollege int, 
								College nvarchar(max), 
								CollegeLibelleVariable bit,
								IdEtablissement int, 
								Etablissement nvarchar(max), 
								ELECTEURS int, 
								VOTANTS int, 
								PARTICIPATION float
							)

						insert @URNES
							(	
								IdElection,
								IdUrne,
								IdBureauUrne,
								IdQuestion,
								Accord,
								ModeTest,
								DatabaseVote,
								IdTour,
								NTourUrne,
								IdTourUrne,
								EtatUrne,
								EtatUrneCode,
								IdVote,
								CodeVote,
								Vote,
								IdEtablissement,
								Etablissement,
								IdCollege,
								CodeCollege,
								College,
								IdScrutin,
								CodeScrutin,
								ScrutinUrne,
								DateEtat,
								HashDepouillement
							)
						'

					SELECT @ReqUrnesA += '
						select 
							V.IdPAP,
							U.Id, 
							U.IdBureau, 
							isnull(TU.IdQuestion,-1), 
							isnull(Q.Accord,''''),
							isnull(BT.Mode_Test,0), 
							case isnull(BT.Mode_Test,0) when 0 then T.DatabaseVote 
														else T.[TestDatabaseVote] 
														end,
							T.Id, 
							T.NTour, 
							TU.Id, 
							ETU.Libelle,
							ETU.Code,
							U.IdVote, 
							TV.Code, 
							TV.Libelle, 
							E.Id, 
							E.Nom, 
							U.IdCollege, 
							TC.Code, 
							isnull(nullif(C.Libelle,''''),
							TC.Libelle), 
							U.IdScrutin, 
							S.Code, 
							S.Libelle,
							case ETU.Code when 2 then TU.DateScellement 
											when 3 then TU.DateDepouillement 
											else null 
											end,
							case isnull(BT.Mode_Test,0) when 0 then [HashDepouillementBureau]
														else [TestHashDepouillementBureau] 
														end
						from ['+@PAPDatabase+'].dbo.URNES U
						inner join ['+@PAPDatabase+'].dbo.VOTES V on V.Id=U.IdVote
						inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						left join ['+@PAPDatabase+'].dbo.ETABLISSEMENTS E on U.IdEtablissement=E.Id
						left join ['+@PAPDatabase+'].dbo.COLLEGES C on C.id=U.IdCollege
						left join ['+@PAPDatabase+'].dbo.TYPE_COLLEGE TC on C.IdTypeCollege=TC.Id
						left join ['+@PAPDatabase+'].dbo.SCRUTINS S on S.Id=U.IdScrutin
						inner join ['+@PAPDatabase+'].dbo.TOURS T on T.IdVote=U.IdVote
						left join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on T.Id=TU.IdTour and U.id=TU.IdUrne
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on U.IdBureau=BT.IdBureau and BT.NTour=T.NTour
						left join ['+@PAPDatabase+'].dbo.ETAT_TOUR_URNE ETU on case isnull(BT.Mode_Test,0) when 0 then TU.IdEtatTourUrne else TU.[TestIdEtatTourUrne] end=ETU.Id
						left join ['+@PAPDatabase+'].dbo.QUESTIONS Q on Q.Id=TU.IdQuestion
						where T.NTour=@NTour AND V.IdPAP=@IdElection
						'

					SELECT @ReqUrnesA += '
						DECLARE 
							@Debut datetime=['+@PAPDatabase+'].[dbo].[FN_CodeNonVotant_GetDateReference](),
							@Controle bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](27),
							@AgeMin int=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](28),
							@Naissance bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78),
							@Anciennete bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](31),
							@AncienneteInterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](29),
							@AncienneteExterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](30),
							@Questions bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](10),
							@Voix bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](44)

						;with E as
						(	
							select 
								U.IdTourUrne, 
								-- cf. ['+@PAPDatabase+'].dbo.FN_CodeNonVotant
								case 
								when @Questions=1 and @Voix=1 and isnull(QC.Voix,C.Voix)=0 then 4 
								when TC.Code in (4,2) then 4
								when @Controle=0 then 0
								when @Naissance=1 and datepart(yy,@Debut-convert(datetime,C.DateNaissance))-1900<@AgeMin then 1	-- Pas encore 16 ans le jour du 1er tour
								when @Anciennete=1 and C.Interne=1 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteInterne,convert(datetime,C.DateEntree))>@Debut) then 2	-- Interne : pas 3 mois dans la société
								when @Anciennete=1 and C.Interne=0 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteExterne,convert(datetime,C.DateEntree))>@Debut) then 3	-- externe : pas 6 mois dans la société
								else 0 end as CodeNonVotant,
								C.Id as IdCollaborateur,
								C.LastAction, 
								case when @Voix=1 then isnull(QC.Voix,C.Voix) else 0 end as Voix,
								case when isnull(MailProfessionnel,'''')='''' then 1 else 0 end as PAR_SMS, case when isnull(MobileProfessionnel,'''')<>'''' then 1 else 0 end as PAR_SMS_POSSIBLE
							from ['+@PAPDatabase+'].dbo.COLLABORATEURS C
							inner join ['+@PAPDatabase+'].dbo.VOTE_COLLABORATEUR_COLLEGE VCC on VCC.IdCollaborateur=C.Id
							inner join @URNES U on U.IdVote=VCC.IdVote and isnull(nullif(U.IdEtablissement,-1),VCC.IdEtablissement)=VCC.IdEtablissement and U.IdCollege=VCC.IdCollege
							inner join ['+@PAPDatabase+'].dbo.TYPE_COLLABORATEUR TC on TC.Id=C.IdTypeCollaborateur
							left join ['+@PAPDatabase+'].dbo.QUESTION_COLLABORATEUR QC on QC.IdQuestion=U.IdQuestion and QC.IdCollaborateur=C.Id)
						, ENB as
						(	
							select 
								IdTourUrne, 
								sum(case CodeNonVotant when 0 then 1 else 0 end) as Votants,
								sum(case CodeNonVotant when 0 then Voix else 0 end) as Voix,
								sum(case CodeNonVotant when 0 then 0 else 1 end) as NonVotants,
								sum(PAR_SMS) PAR_SMS, sum(PAR_SMS_POSSIBLE) PAR_SMS_POSSIBLE,
								Max(LastAction) as LastAction
							from E
							group by IdTourUrne
						)
						update U
						set NbVotants=ENB.Votants,
							VoixVotants=ENB.Voix,
							NbNonVotants=ENB.NonVotants,
							NbSms=ENB.PAR_SMS,
							NbSmsPossible=ENB.PAR_SMS_POSSIBLE,
							LastActionUrne=ENB.LastAction
						from @URNES U
						inner join ENB on isnull(U.IdTourUrne,-1)=isnull(ENB.IdTourUrne,-1)
						'

					SELECT @ReqUrnesA += '
						;with B as
						(	
							select 
								U.IdBureauUrne,
								U.IdUrne,
								U.IdQuestion,
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInScellement] else [CheckInScellement] end)) as NbScellement, 
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInDépouillement] else [CheckInDépouillement] end)) as NbDepouillement
							from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
							inner join @URNES U on U.IdBureauUrne=BM.IdBureau and BM.NTour=@NTour
							group by U.IdBureauUrne,U.IdUrne,U.IdQuestion
						)
						update @URNES set NbScellement=B.NbScellement, NbDepouillement=B.NbDepouillement, BureauMembresAction=P.BureauMembersScellementMin
						from @URNES U
						inner join B on B.IdBureauUrne=U.IdBureauUrne and U.IdUrne=B.IdUrne and U.IdQuestion=B.IdQuestion
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.id=@IdElection

						declare @Lib nvarchar(50)=''''
						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](9)=1
						begin
							set @Lib=''NB Listes''
							declare @LISTES table
							(	
								IdListe int, 
								IdUrne int, 
								IdTour int, 
								NbCandidats int
							)

							insert @LISTES 
							(
								IdListe,
								IdUrne,
								IdTour,
								NbCandidats
							)
							select 
								LC.id, 
								IdUrne,
								U.IdTour,
								count(distinct C.id)
							from @URNES U
							inner join ['+@PAPDatabase+'].dbo.LISTE_CANDIDATS LC on LC.IdTour=U.IdTour and LC.IdCollege=U.IdCollege and LC.IdEtablissement=isnull(nullif(U.IdEtablissement,-1),LC.IdEtablissement) and LC.IdScrutin=U.IdScrutin
							inner join ['+@PAPDatabase+'].dbo.CANDIDATS C on LC.Id=C.IdListeCandidats
							group by  LC.id,IdUrne,U.IdTour

							;with L as
							(	
								select 
									IdUrne,
									IdTour,
									count(distinct IdListe) as NB_Liste, 
									sum(NbCandidats) as NB_Candidats
								from @LISTES L
								group by IdUrne,IdTour
							)
							update U
							set NbListes=L.NB_Liste, NbCandidats=L.NB_Candidats
							from @URNES U
							inner join L on U.IdUrne=L.IdUrne and U.IdTour=L.IdTour
						end

						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](10)=1
						begin
							set @Lib=''NB Questions''
							;with Q as
							(	
								select 
									TU.IdUrne, 
									TU.IdTour, 
									count(distinct Q.Id) as NB
								from ['+@PAPDatabase+'].dbo.QUESTIONS Q
								inner join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on Q.Id=TU.IdQuestion
								inner join ['+@PAPDatabase+'].dbo.TOURS T on T.Id=TU.IdTour and T.NTour=@NTour
								group by TU.IdUrne, TU.IdTour
							)
							update U
							set NbListes=NB
							from @URNES U
							inner join Q on Q.IdUrne=U.IdUrne and Q.IdTour=U.IdTour
						end
						'

					SELECT @ReqUrnesA += '
						insert @P
						select * from ['+@PAPDatabase+'].dbo.[FN_GetTourParticipation](0, @NTour,1)
						order by NTour, CodeVote, CodeCollege,IdEtablissement

						update U
						set Participation=P.PARTICIPATION
						from @URNES U
						inner join @P P on P.NTour=@NTour and P.CodeVote=U.CodeVote and isnull(P.CodeCollege,0)=isnull(U.CodeCollege,0) and P.IdEtablissement=isnull(U.IdEtablissement,-1)

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) 
								Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.Modetest=0

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS_TEST 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.ModeTest=1

						declare @IU table (Id int PRIMARY KEY, Val int)
						declare @IU_NULS table (Id int, Code int, Val int PRIMARY KEY(Id,Code))
						declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY(''Edition'')) like ''%Azure%'' then 1 else 0 end)
						declare @AvecVOIX_BULLETINS bit=1
						'

					-- CURSEUR DATABASEVOTE A REMPLACER
					declare C Cursor local fast_forward
					for select distinct DatabaseVote from @DBVotes
					open C
					fetch next from C into @DatabaseVote
					begin

						SELECT @ReqUrnesA += '
						delete @IU
						insert @IU
								select IdTourUrne, count(*) as Votes from ['+@DatabaseVote+'_BULLETINS] group by IdTourUrne
						update U 
							set BULLETINS=IU.Val
							from @URNES U
							inner join @IU IU on U.IdTourUrne=IU.Id

						delete @IU_NULS
						begin try
							insert @IU_NULS
										select IdTourUrne, case when Voix=0 and IdListe=-2 then -20 else IdListe end as Code, count(*) as Votes
										from ['+@DatabaseVote+'_VOTES] where IdListe<0 group by IdTourUrne,case when Voix=0 and IdListe=-2 then -20 else IdListe end

							update U 
							set PbBulletins=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-20
						end try
						begin catch
							set @AvecVOIX_BULLETINS=0
						end catch

						update U 
						set Nuls=IU.Val
						from @URNES U
						inner join @IU_NULS IU on U.IdTourUrne=IU.Id
						where Code=-2

						update U 
						set Blancs=IU.Val
						from @URNES U
						inner join @IU_NULS IU on U.IdTourUrne=IU.Id
						where Code=-3
							'
						fetch next from C into @DatabaseVote
					end
					close C
					deallocate C

					SELECT @ReqUrnesA += 'select 
							''URNE'' as Urne, 
							IdElection,
							IdBureauUrne,
							ModeTest,
							NTourUrne, 
							EtatUrne + '' : '' + case when DatabaseVote is null and EtatUrne =1 then ''BASE A CREER''
													when DatabaseVote is null and EtatUrne =2 then ''ERREUR BASE ABSENTE''
													else ''BASE OK'' 
													end as EtatUrne, 
							isnull(convert(nvarchar,DateEtat,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,DateEtat)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,DateEtat)),2),'''') as DateEtat,
							U.Accord,
							U.NbListes as NbListes, 
							convert(nvarchar,U.NbVotants) + case U.VoixVotants when 0 then '''' 
																				else '' [''''+convert(nvarchar,VoixVotants)+'''' voix]'' 
																				end + ''(SMS='' + convert(nvarchar,U.NbSms) + ''/'' + convert(nvarchar,U.NbSmsPossible) + '')'' as ''NbVotants'', 
							U.NbNonVotants,
							Etablissement,
							College,
							ScrutinUrne,
							U.Participation,
							U.Emargement,
							U.Bulletins,
							case when U.Emargement=U.Bulletins then ''OK'' 
									else ''KO'' 
									end as CoherenceVote,
							isnull(convert(nvarchar,U.DateVote,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.DateVote)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.DateVote)),2),'''') as DateVote,
							isnull(convert(nvarchar,U.LastActionUrne,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.LastActionUrne)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.LastActionUrne)),2),'''') as LastActionUrne,
							case EtatUrneCode when 3 then convert(nvarchar,U.Blancs) 
												else ''--'' 
												end Blancs,
							case EtatUrneCode when 3 then convert(nvarchar,U.Nuls) 
												else ''--'' 
												end Nuls,
							case when EtatUrneCode<3 or @AvecVOIX_BULLETINS=0 then ''--'' 
									else convert(nvarchar,U.PbBulletins) 
									end PbBulletins,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--'' 
									else convert(nvarchar,convert(float,NbVotants)/2) 
									end as Quorum,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--''
									when (U.Emargement-U.Nuls-U.Blancs-U.PbBulletins)>convert(decimal,NbVotants)/2 then ''Oui''
									else ''Non'' 
									end as QuorumAtteint,
							BureauMembresAction, 
							NbScellement, 
							NbDepouillement,
							Vote,
							U.IdUrne,
							U.IdTour,
							isnull(IdTourUrne,-1) as IdTourUrne,
							HashDepouillement
						from @URNES U
					'

					SET @ReqUrnesA = @Req1 + @ReqUrnesA

					print 'Azure 1 VA avant Insert AVT'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqTourA,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Tour
					(
						Tour,
						Libelle,
						PAPDatabase,
						IdElection,
						NTourTour,
						Horaire,
						DateScellementUrnes,
						Debut,
						Fin,
						DelaiCloseScrutin,
						EtatAvancement,
						AvancementTour,
						Demo,
						MDPSize,
						MDPAlpha,
						Categories,
						CategoriesRepresentees,
						DateDebutDepotListe,
						DateMaxDepotListe,
						RemoteInfo
					)
					EXEC (@Req2)

					print 'Azure 1 VA avant Insert AVBM'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqBureauA,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Bureau_Membres
					(
						Bureau,
						IdElection,
						IdBureauBureau,
						ModeTest,
						IdMembre,
						Nom,
						Prenoms,
						DateNaissance,
						LastActionBureau,
						Age,
						President,
						IdCollaborateur,
						[CheckInScellement],
						[CleScellement],
						[CleScellementHoraire],
						CheckInDepouillement,
						[CleDepouillement],
						[CleDepouillementHoraire],
						MailProfessionnel,
						MobileProfessionnel,
						RemoteInfo
					)
					EXEC (@Req2)

					print 'Azure 1 VA avant Insert AVU'
					SET @Req2='exec sp_execute_remote [DataSourceAdmin_'+@PAPDatabase+'], N'''+replace(@ReqUrnesA,'''','''''')+''''
					INSERT dbo.Admin_Analyse_Vote_Urnes
					(
						Urne,
						IdElection,
						IdBureauUrne,
						ModeTest,
						NTourUrne,
						EtatUrne,
						DateEtat,
						Accord,
						NbListes,
						NbVotants,
						NbNonVotants,
						Etablissement,
						College,
						ScrutinUrne,
						Participation,
						Emargement,
						Bulletins,
						CoherenceVote,
						DateVote,
						LastActionUrne,
						Blancs,
						Nuls,
						PbBulletins,
						Quorum,
						QuorumAtteint,
						BureauMembresAction,
						NbScellement,
						NbDepouillement,
						Vote,
						IdUrne,
						IdTour,
						IdTourUrne,
						HashDepouillement,
						RemoteInfo
					)
					EXEC (@Req2)
					print 'Azure 1 VA après Insert AVU'
				END			
		END

	ELSE IF @AZURE=0
		BEGIN
			insert @DBVotes (DatabaseVote)
			exec (@ReqUrnesDatabasesVotes)
			delete @DBVotes where DatabaseVote is null

			IF @VersionAPI='B'
				BEGIN
					-- TOURS
					SELECT @ReqTourB = '
						;with SR as 
						(	
							select count(distinct IdCategorie) as NB 
							from ['+@PAPDatabase+'].dbo.SIEGES 
							where isnull(IdCategorie,-1)<>-1
						)

						, LSR as
						(	
							select COUNT(distinct IdCategorie) as NB
							from ['+@PAPDatabase+'].dbo.CANDIDATS CA
							where isnull(IdCategorie,-1)<>-1
						)

						select ''TOUR'' as Tour, 
							TV.Libelle + case @DEMO when 1 then '' (DEMO)'' 
													else '''' 
													end as ScrutinTour, 
							'''+@PAPDatabase+''' as PAPDatabase, 
							P.Id as IdElection,
							NTour as NTourTour, 
							convert(nvarchar,['+@PAPDatabase+'].dbo.GetRealDate(),103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,['+@PAPDatabase+'].dbo.GetRealDate())),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,['+@PAPDatabase+'].dbo.GetRealDate())),2) as Horaire, 
							case P.IdentificationElecteurs when 0 then ''Mode simple''
															when 1 then ''Mode 1: 2 canaux''
															when 2 then ''Mode 2: 2 canaux + défi''
															when 3 then ''Mode simple + défi''
															end + '' | MDP : '' + convert(nvarchar,MDPSize)+case MDPAlpha when 1 then ''A'' 
																															else ''N'' 
																															end as IdentificationElecteurs,
							isnull(convert(nvarchar,T.DateScellementUrnes,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateScellementUrnes)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateScellementUrnes)),2),''''),
							isnull(convert(nvarchar,T.Debut,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Debut)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Debut)),2), '''') as Debut,
							isnull(convert(nvarchar,T.Fin,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Fin)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Fin)),2),'''') + case when P.DelaiCloseScrutin>0 then '' +''+convert(nvarchar,P.DelaiCloseScrutin) 
																																														else '''' end as Fin,
							A.EtatAvancement,
							case @NTour when 1 then A.EtatAvancement1erTour 
																else A.EtatAvancement2emeTour 
																end as AvancementTour, 
							SR.NB as Categories, 
							LSR.NB as CategoriesRepresentees,
							isnull(convert(nvarchar,T.DateDebutDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateDebutDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateDebutDepotListe)),2),''''),
							isnull(convert(nvarchar,T.DateMaxDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateMaxDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateMaxDepotListe)),2),'''')
						from ['+@PAPDatabase+'].dbo.TOURS T
						cross apply ['+@PAPDatabase+'].dbo.FN_GetElectionAvancements(@IdElection) A
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.Id=@IdElection
						cross join SR
						cross join LSR
						cross join ['+@PAPDatabase+'].dbo.VOTES V
							inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						where NTour=@NTour
					'

					SELECT @ReqTourB = @Req1 + @ReqTourB

					-- BUREAU
					SELECT @ReqBureauB = '
						select
							''BUREAU'' + case isnull(BT.Mode_Test,0) when 1 then '' (ModeTest)'' 
																		else '''' 
																		end + case when ([Mode_Test]=1 and [StoppedTest]=1) or ([Mode_Test]=0 and [Stopped]=1) then '' (STOP)'' 
																					else '''' end as Bureau, 
						P.Id as IdElection,
						BM.IdBureau AS IdBureauBureau, 
						case P.[BureauModeSecurite] when 0 then ''non '' 
													else '''' 
													end + ''collegial'' as Collegial,
						case [Mode_Test] when 1 then EtapeScellementTest 
										else [EtapeScellement] 
										end EtapeScellement,
						case [Mode_Test] when 1 then [EtapeDepouillementTest] 
											else [EtapeDepouillement] 
											end EtapeDepouillement,
						BM.Id as IdMembre,
						President,
						case ['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78) when 1 then 
						YEAR(['+@PAPDatabase+'].dbo.GetRealDate())
							-YEAR(C.dateNaissance)
							- Case when convert(date,DATEADD(yy,YEAR(['+@PAPDatabase+'].dbo.GetRealDate())-YEAR(C.dateNaissance),C.dateNaissance))<convert(date,['+@PAPDatabase+'].dbo.GetRealDate()) 
								then 1 else 0 end
						else null end as Age,
						Nom,
						Prénoms AS Prenoms, 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInGenerationKey] 
													else [CheckInGenerationKey] 
													end [CheckInGenerationKey], 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInScellement] 
													else [CheckInScellement] 
													end [CheckInScellement], 
						case isnull(BT.Mode_Test,0) when 1 then [TestCheckInDépouillement] 
													else [CheckInDépouillement] 
													end [CheckInDepouillement],
						isnull(convert(nvarchar,C.LastAction,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,C.LastAction)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,C.LastAction)),2),'''') AS LastActionBureau,
						BM.IdCollaborateur,
						isnull(convert(nvarchar, [CléScellement]), '''') AS [CleScellement],
						isnull(convert(nvarchar,[CléScellementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléScellementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléScellementHoraire])),2),'''') AS [CleScellementHoraire],
						isnull(convert(nvarchar, [CléDépouillement]), '''') AS [CleDepouillement],
						isnull(convert(nvarchar,[CléDépouillementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléDépouillementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléDépouillementHoraire])),2),'''') AS [CleDepouillementHoraire],
						C.MailProfessionnel,
						C.MailPersonnel,
						C.MobileProfessionnel
					from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
					cross join ['+@PAPDatabase+'].dbo.PAP P
					left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on BM.IdBureau=BT.IdBureau and BT.NTour=BM.NTour
					inner join ['+@PAPDatabase+'].dbo.COLLABORATEURS C on BM.Idcollaborateur=C.Id
					where BM.NTour=@NTour and refus=0 AND P.Id=@IdElection
					order by IdBureauBureau, case President when 1 then 0 
															else 1 
															end, 
							BM.IdCollaborateur
					'

					SELECT @ReqBureauB = @Req1 + @ReqBureauB
			

					-- URNES
					SELECT @ReqUrnesB = '

						declare @Req nvarchar(max)

						declare @URNES table
							(	
								IdElection int,
								IdUrne int, 
								IdBureauUrne int, 
								IdQuestion int, 
								Accord nvarchar(max),
								ModeTest bit, 
								DatabaseVote nvarchar(128),
								IdTour int, 
								NTourUrne tinyint, 
								IdTourUrne int, 
								EtatUrne nvarchar(max), 
								EtatUrneCode int,
								BureauMembresAction int, 
								NbScellement int, 
								NbDepouillement int,
								IdVote int, 
								CodeVote int, 
								Vote nvarchar(max),
								IdEtablissement int, 
								Etablissement nvarchar(max),
								IdCollege int, 
								CodeCollege int, 
								College nvarchar(max),
								IdScrutin int, 
								CodeScrutin int, 
								ScrutinUrne nvarchar(max),
								NbVotants int default 0, 
								VoixVotants int default 0, 
								NbNonVotants int default 0, 
								NbListes int default 0, 
								NbCandidats int default 0, 
								NbSms int default 0, 
								NbSmsPossible int default 0,
								Participation float default 0, 
								Emargement int default 0, 
								DateVote datetime, 
								LastActionUrne datetime,
								Bulletins int default 0, 
								Blancs int default 0, 
								Nuls int default 0, 
								PbBulletins int default 0,
								DateEtat datetime, 
								HashDepouillement nvarchar(max)
								PRIMARY KEY(IdUrne,IdTour,IdQuestion)
							)

						declare @P table
							(	
								NTour tinyint not null, 
								ModeTest bit,
								CodeVote int, 
								CodeCollege int, 
								College nvarchar(max), 
								CollegeLibelleVariable bit,
								IdEtablissement int, 
								Etablissement nvarchar(max), 
								ELECTEURS int, 
								VOTANTS int, 
								PARTICIPATION float
							)

						insert @URNES
							(	
								IdElection,
								IdUrne,
								IdBureauUrne,
								IdQuestion,
								Accord,
								ModeTest,
								DatabaseVote,
								IdTour,
								NTourUrne,
								IdTourUrne,
								EtatUrne,
								EtatUrneCode,
								IdVote,
								CodeVote,
								Vote,
								IdEtablissement,
								Etablissement,
								IdCollege,
								CodeCollege,
								College,
								IdScrutin,
								CodeScrutin,
								ScrutinUrne,
								DateEtat,
								HashDepouillement
							)
						'

					SELECT @ReqUrnesB += 'select 
							V.IdPAP,
							U.Id, 
							U.IdBureau, 
							isnull(TU.IdQuestion,-1), 
							isnull(Q.Accord,''''),
							isnull(BT.Mode_Test,0), 
							case isnull(BT.Mode_Test,0) when 0 then T.DatabaseVote 
														else T.[TestDatabaseVote] 
														end,
							T.Id, 
							T.NTour, 
							TU.Id, 
							ETU.Libelle,
							ETU.Code,
							U.IdVote, 
							TV.Code, 
							TV.Libelle, 
							E.Id, 
							E.Nom, 
							U.IdCollege, 
							TC.Code, 
							isnull(nullif(C.Libelle,''''),
							TC.Libelle), 
							U.IdScrutin, 
							S.Code, 
							S.Libelle,
							case ETU.Code when 2 then TU.DateScellement 
											when 3 then TU.DateDepouillement 
											else null 
											end,
							case isnull(BT.Mode_Test,0) when 0 then [HashDepouillementBureau]
														else [TestHashDepouillementBureau] 
														end
						from ['+@PAPDatabase+'].dbo.URNES U
						inner join ['+@PAPDatabase+'].dbo.VOTES V on V.Id=U.IdVote
						inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						left join ['+@PAPDatabase+'].dbo.ETABLISSEMENTS E on U.IdEtablissement=E.Id
						left join ['+@PAPDatabase+'].dbo.COLLEGES C on C.id=U.IdCollege
						left join ['+@PAPDatabase+'].dbo.TYPE_COLLEGE TC on C.IdTypeCollege=TC.Id
						left join ['+@PAPDatabase+'].dbo.SCRUTINS S on S.Id=U.IdScrutin
						inner join ['+@PAPDatabase+'].dbo.TOURS T on T.IdVote=U.IdVote
						left join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on T.Id=TU.IdTour and U.id=TU.IdUrne
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on U.IdBureau=BT.IdBureau and BT.NTour=T.NTour
						left join ['+@PAPDatabase+'].dbo.ETAT_TOUR_URNE ETU on case isnull(BT.Mode_Test,0) when 0 then TU.IdEtatTourUrne else TU.[TestIdEtatTourUrne] end=ETU.Id
						left join ['+@PAPDatabase+'].dbo.QUESTIONS Q on Q.Id=TU.IdQuestion
						where T.NTour=@NTour AND V.IdPAP=@IdElection

						;with E as
						(
							select 
								Idbureau,
								case when (BT.Mode_Test=1 and EtapeDepouillementTest=2) or (BT.Mode_Test=0 and EtapeDepouillement=2) then '' (Non affiché)'' 
										else '''' 
										end as EtatUrne
							from ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT
						)
						update U set EtatUrne=U.EtatUrne+E.EtatUrne
						from @URNES U 
						inner join E on E.IdBureau=U.IdBureauUrne
						where EtatUrneCode=3
						'

					SELECT @ReqUrnesB += '
						DECLARE 
							@Debut datetime=['+@PAPDatabase+'].[dbo].[FN_CodeNonVotant_GetDateReference](),
							@Controle bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](27),
							@AgeMin int=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](28),
							@Naissance bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78),
							@Anciennete bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](31),
							@AncienneteInterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](29),
							@AncienneteExterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](30),
							@Questions bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](10),
							@Voix bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](44)

						;with E as
						(	
							select 
								U.IdTourUrne, 
								-- cf. ['+@PAPDatabase+'].dbo.FN_CodeNonVotant
								case 
								when @Questions=1 and @Voix=1 and isnull(QC.Voix,C.Voix)=0 then 4 
								when TC.Code in (4,2) then 4
								when @Controle=0 then 0
								when @Naissance=1 and datepart(yy,@Debut-convert(datetime,C.DateNaissance))-1900<@AgeMin then 1	-- Pas encore 16 ans le jour du 1er tour
								when @Anciennete=1 and C.Interne=1 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteInterne,convert(datetime,C.DateEntree))>@Debut) then 2	-- Interne : pas 3 mois dans la société
								when @Anciennete=1 and C.Interne=0 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteExterne,convert(datetime,C.DateEntree))>@Debut) then 3	-- externe : pas 6 mois dans la société
								else 0 end as CodeNonVotant,
								C.Id as IdCollaborateur,
								C.LastAction, 
								case when @Voix=1 then isnull(QC.Voix,C.Voix) else 0 end as Voix,
								case when isnull(MailProfessionnel,'''')='''' then 1 else 0 end as PAR_SMS, case when isnull(MobileProfessionnel,'''')<>'''' then 1 else 0 end as PAR_SMS_POSSIBLE
							from ['+@PAPDatabase+'].dbo.COLLABORATEURS C
							inner join ['+@PAPDatabase+'].dbo.VOTE_COLLABORATEUR_COLLEGE VCC on VCC.IdCollaborateur=C.Id
							inner join @URNES U on U.IdVote=VCC.IdVote and isnull(nullif(U.IdEtablissement,-1),VCC.IdEtablissement)=VCC.IdEtablissement and U.IdCollege=VCC.IdCollege
							inner join ['+@PAPDatabase+'].dbo.TYPE_COLLABORATEUR TC on TC.Id=C.IdTypeCollaborateur
							left join ['+@PAPDatabase+'].dbo.QUESTION_COLLABORATEUR QC on QC.IdQuestion=U.IdQuestion and QC.IdCollaborateur=C.Id)
						, ENB as
						(	
							select 
								IdTourUrne, 
								sum(case CodeNonVotant when 0 then 1 else 0 end) as Votants,
								sum(case CodeNonVotant when 0 then Voix else 0 end) as Voix,
								sum(case CodeNonVotant when 0 then 0 else 1 end) as NonVotants,
								sum(PAR_SMS) PAR_SMS, sum(PAR_SMS_POSSIBLE) PAR_SMS_POSSIBLE,
								Max(LastAction) as LastAction
							from E
							group by IdTourUrne
						)
						update U
						set NbVotants=ENB.Votants,
							VoixVotants=ENB.Voix,
							NbNonVotants=ENB.NonVotants,
							NbSms=ENB.PAR_SMS,
							NbSmsPossible=ENB.PAR_SMS_POSSIBLE,
							LastActionUrne=ENB.LastAction
						from @URNES U
						inner join ENB on isnull(U.IdTourUrne,-1)=isnull(ENB.IdTourUrne,-1)
						'

					SELECT @ReqUrnesB += '
						;with B as
						(	
							select 
								U.IdBureauUrne,
								U.IdUrne,
								U.IdQuestion,
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInScellement] else [CheckInScellement] end)) as NbScellement, 
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInDépouillement] else [CheckInDépouillement] end)) as NbDepouillement
							from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
							inner join @URNES U on U.IdBureauUrne=BM.IdBureau and BM.NTour=@NTour
							group by U.IdBureauUrne,U.IdUrne,U.IdQuestion
						)
						update @URNES set NbScellement=B.NbScellement, NbDepouillement=B.NbDepouillement, BureauMembresAction=P.BureauMembersScellementMin
						from @URNES U
						inner join B on B.IdBureauUrne=U.IdBureauUrne and U.IdUrne=B.IdUrne and U.IdQuestion=B.IdQuestion
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.id=@IdElection

						declare @Lib nvarchar(50)=''''
						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](9)=1
						begin
							set @Lib=''NB Listes''
							declare @LISTES table
							(	
								IdListe int, 
								IdUrne int, 
								IdTour int, 
								NbCandidats int
							)

							insert @LISTES 
							(
								IdListe,
								IdUrne,
								IdTour,
								NbCandidats
							)
							select 
								LC.id, 
								IdUrne,
								U.IdTour,
								count(distinct C.id)
							from @URNES U
							inner join ['+@PAPDatabase+'].dbo.LISTE_CANDIDATS LC on LC.IdTour=U.IdTour and LC.IdCollege=U.IdCollege and LC.IdEtablissement=isnull(nullif(U.IdEtablissement,-1),LC.IdEtablissement) and LC.IdScrutin=U.IdScrutin
							inner join ['+@PAPDatabase+'].dbo.CANDIDATS C on LC.Id=C.IdListeCandidats
							group by  LC.id,IdUrne,U.IdTour

							;with L as
							(	
								select 
									IdUrne,
									IdTour,
									count(distinct IdListe) as NB_Liste, 
									sum(NbCandidats) as NB_Candidats
								from @LISTES L
								group by IdUrne,IdTour
							)
							update U
							set NbListes=L.NB_Liste, NbCandidats=L.NB_Candidats
							from @URNES U
							inner join L on U.IdUrne=L.IdUrne and U.IdTour=L.IdTour
						end

						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](10)=1
						begin
							set @Lib=''NB Questions''
							;with Q as
							(	
								select 
									TU.IdUrne, 
									TU.IdTour, 
									count(distinct Q.Id) as NB
								from ['+@PAPDatabase+'].dbo.QUESTIONS Q
								inner join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on Q.Id=TU.IdQuestion
								inner join ['+@PAPDatabase+'].dbo.TOURS T on T.Id=TU.IdTour and T.NTour=@NTour
								group by TU.IdUrne, TU.IdTour
							)
							update U
							set NbListes=NB
							from @URNES U
							inner join Q on Q.IdUrne=U.IdUrne and Q.IdTour=U.IdTour
						end
						'

					SELECT @ReqUrnesB += '
						insert @P
						select * from ['+@PAPDatabase+'].dbo.[FN_GetTourParticipation](0, @NTour,1)
						order by NTour, CodeVote, CodeCollege,IdEtablissement

						update U
						set Participation=P.PARTICIPATION
						from @URNES U
						inner join @P P on P.NTour=@NTour and P.CodeVote=U.CodeVote and isnull(P.CodeCollege,0)=isnull(U.CodeCollege,0) and P.IdEtablissement=isnull(U.IdEtablissement,-1)

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) 
								Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.Modetest=0

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS_TEST 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.ModeTest=1

						declare @IU table (Id int PRIMARY KEY, Val int)
						declare @IU_NULS table (Id int, Code int, Val int PRIMARY KEY(Id,Code))
						declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY(''Edition'')) like ''%Azure%'' then 1 else 0 end)
						declare @AvecVOIX_BULLETINS bit=1

						'

					-- CURSEUR DATABASEVOTE A REMPLACER
					declare C Cursor local fast_forward
					for select distinct DatabaseVote from @DBVotes
					open C
					fetch next from C into @DatabaseVote
					begin
						SELECT @ReqUrnesB += '
							delete @IU
							insert @IU
							select IdTourUrne, count(*) as Votes from ['+@DatabaseVote+'].dbo.[BULLETINS] group by IdTourUrne
							update U 
							set BULLETINS=IU.Val
							from @URNES U
							inner join @IU IU on U.IdTourUrne=IU.Id

							delete @IU_NULS
							begin try
								insert @IU_NULS
										select IdTourUrne, case when Voix=0 and IdListe=-2 then -20 else IdListe end as Code, count(*) as Votes
										from ['+@DatabaseVote+'].dbo.[VOTES] where IdListe<0 group by IdTourUrne,case when Voix=0 and IdListe=-2 then -20 else IdListe end
								update U 
									set PbBulletins=IU.Val
									from @URNES U
									inner join @IU_NULS IU on U.IdTourUrne=IU.Id
									where Code=-20
							end try
							begin catch
								set @AvecVOIX_BULLETINS=0
							end catch

							update U 
							set Nuls=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-2

							update U 
							set Blancs=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-3
							'

						fetch next from C into @DatabaseVote
					end
					close C
					deallocate C

					SELECT @ReqUrnesB += '
						select 
							''URNE'' as Urne, 
							IdElection,
							IdBureauUrne,
							ModeTest,
							NTourUrne, 
							EtatUrne + '' : '' + case when DatabaseVote is null and EtatUrne =1 then ''BASE A CREER''
													when DatabaseVote is null and EtatUrne =2 then ''ERREUR BASE ABSENTE''
													else ''BASE OK'' 
													end as EtatUrne,
							isnull(convert(nvarchar,DateEtat,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,DateEtat)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,DateEtat)),2),'''') as DateEtat,
							U.Accord,
							U.NbListes as NbListes, 
							convert(nvarchar,U.NbVotants) + case U.VoixVotants when 0 then '''' 
																				else '' [''''+convert(nvarchar,VoixVotants)+'''' voix]'' 
																				end + ''(SMS='' + convert(nvarchar,U.NbSms) + ''/'' + convert(nvarchar,U.NbSmsPossible) + '')'' as ''NbVotants'', 
							U.NbNonVotants,
							Etablissement,
							College,
							ScrutinUrne,
							U.Participation,
							U.Emargement,
							U.Bulletins,
							case when U.Emargement=U.Bulletins then ''OK'' 
									else ''KO'' 
									end as CoherenceVote,
							isnull(convert(nvarchar,U.DateVote,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.DateVote)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.DateVote)),2),'''') as DateVote,
							isnull(convert(nvarchar,U.LastActionUrne,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.LastActionUrne)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.LastActionUrne)),2),'''') as LastActionUrne,
							case EtatUrneCode when 3 then convert(nvarchar,U.Blancs) 
												else ''--'' 
												end Blancs,
							case EtatUrneCode when 3 then convert(nvarchar,U.Nuls) 
												else ''--'' 
												end Nuls,
							case when EtatUrneCode<3 or @AvecVOIX_BULLETINS=0 then ''--'' 
									else convert(nvarchar,U.PbBulletins) 
									end PbBulletins,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--'' 
									else convert(nvarchar,convert(float,NbVotants)/2) 
									end as Quorum,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--''
									when (U.Emargement-U.Nuls-U.Blancs-U.PbBulletins)>convert(decimal,NbVotants)/2 then ''Oui''
									else ''Non'' 
									end as QuorumAtteint,
							BureauMembresAction, 
							NbScellement, 
							NbDepouillement,
							Vote,
							U.IdUrne,
							U.IdTour,
							isnull(IdTourUrne,-1) as IdTourUrne,
							HashDepouillement
						from @URNES U
					'
					SELECT @ReqUrnesB = @Req1 + @ReqUrnesB
			
					print 'Azure 0 VB avant Insert AVT'
					INSERT dbo.Admin_Analyse_Vote_Tour
					(
						Tour,
						ScrutinTour,
						PAPDatabase,
						IdElection,
						NTourTour,
						Horaire,
						IdentificationElecteurs,
						DateScellementUrnes,
						Debut,
						Fin,
						EtatAvancement,
						AvancementTour,
						Categories,
						CategoriesRepresentees,
						DateDebutDepotListe,
						DateMaxDepotListe
					)
					EXEC (@ReqTourB)

					print 'Azure 0 VB avant Insert AVBM'
					INSERT dbo.Admin_Analyse_Vote_Bureau_Membres
					(
						Bureau,
						IdElection,
						IdBureauBureau,
						Collegial,
						EtapeScellement,
						EtapeDepouillement,
						IdMembre,
						President,
						Nom,
						Prenoms,
						[CheckInGenerationKey],
						[CheckInScellement],
						[CheckInDepouillement],
						LastActionBureau,
						IdCollaborateur,
						[CleScellement],
						[CleScellementHoraire],
						[CleDepouillement],
						[CleDepouillementHoraire],
						MailProfessionnel,
						MailPersonnel,
						MobileProfessionnel
					)
					EXEC (@ReqBureauB)

					print 'Azure 0 VB avant Insert AVU'
					INSERT dbo.Admin_Analyse_Vote_Urnes
					(
						Urne,
						IdElection,
						IdBureauUrne,
						ModeTest,
						NTourUrne,
						EtatUrne,
						DateEtat,
						Accord,
						NbListes,
						NbVotants,
						NbNonVotants,
						Etablissement,
						College,
						ScrutinUrne,
						Participation,
						Emargement,
						Bulletins,
						CoherenceVote,
						DateVote,
						LastActionUrne,
						Blancs,
						Nuls,
						PbBulletins,
						Quorum,
						QuorumAtteint,
						BureauMembresAction,
						NbScellement,
						NbDepouillement,
						Vote,
						IdUrne,
						IdTour,
						IdTourUrne,
						HashDepouillement
					)					
					EXEC (@ReqUrnesB)
					print 'Azure 0 VB après Insert AVU'
				END

			ELSE IF @VersionAPI = 'A'
				BEGIN
					-- TOURS
					SELECT @ReqTourA = '
						;with SR as 
						(	select count(distinct IdCategorie) as NB from ['+@PAPDatabase+'].dbo.SIEGES where isnull(IdCategorie,-1)<>-1)
						, LSR as
						(	select COUNT(distinct IdCategorie) as NB
							from ['+@PAPDatabase+'].dbo.CANDIDATS CA
							where isnull(IdCategorie,-1)<>-1
						)
						select 
							''TOUR'' as Tour, 
							TV.Libelle, 
							'''+@PAPDatabase+''' as PAPDatabase, 
							P.Id as IdElection,
							NTour as NTourTour, 
							convert(nvarchar,['+@PAPDatabase+'].dbo.GetRealDate(),103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,['+@PAPDatabase+'].dbo.GetRealDate())),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,['+@PAPDatabase+'].dbo.GetRealDate())),2) as Horaire, 
							isnull(convert(nvarchar,T.DateScellementUrnes,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateScellementUrnes)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateScellementUrnes)),2),''''),
							isnull(convert(nvarchar,T.Debut,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Debut)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Debut)),2),''''),
							isnull(convert(nvarchar,T.Fin,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.Fin)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.Fin)),2),''''),
							P.DelaiCloseScrutin,
							A.EtatAvancement,
							case @NTour when 1 then A.EtatAvancement1erTour 
																else A.EtatAvancement2emeTour 
																end as AvancementTour, 
							@DEMO as Demo,
							MDPSize, 
							MDPAlpha,
							SR.NB as Categories, 
							LSR.NB as CategoriesRepresentees,
							isnull(convert(nvarchar,T.DateDebutDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateDebutDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateDebutDepotListe)),2),''''),
							isnull(convert(nvarchar,T.DateMaxDepotListe,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,T.DateMaxDepotListe)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,T.DateMaxDepotListe)),2),'''')
						from ['+@PAPDatabase+'].dbo.TOURS T
						cross apply ['+@PAPDatabase+'].dbo.FN_GetElectionAvancements(@IdElection) A
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.Id=@IdElection
						cross join SR
						cross join LSR
						cross join ['+@PAPDatabase+'].dbo.VOTES V
							inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						where NTour=@NTour
						'

					SET @ReqTourA = @Req1 + @ReqTourA


					-- BUREAU
					SELECT @ReqBureauA = '
						select 
							''BUREAU'' as Bureau, 
							C.IdPAP as IdElection,
							BM.IdBureau AS IdBureauBureau, 
							isnull(BT.Mode_Test,0) as ModeTest, 
							BM.Id as IdMembre,
							Nom,
							Prénoms AS Prenoms,
							isnull(convert(nvarchar,C.dateNaissance,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(convert(datetime,HH,C.dateNaissance))),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,convert(datetime,C.dateNaissance))),2),'''') AS DateNaissance, 
							isnull(convert(nvarchar,C.LastAction,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,C.LastAction)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,C.LastAction)),2),'''') AS LastActionBureau,
							case ['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78) when 1 then 
								YEAR(['+@PAPDatabase+'].dbo.GetRealDate())
								-YEAR(C.dateNaissance)
								- Case when convert(date,DATEADD(yy,YEAR(['+@PAPDatabase+'].dbo.GetRealDate())-YEAR(C.dateNaissance),C.dateNaissance))<convert(date,['+@PAPDatabase+'].dbo.GetRealDate()) 
									then 1 else 0 end
							else null end as Age,
							President,
							BM.IdCollaborateur,
							case isnull(BT.Mode_Test,0) when 1 then [TestCheckInScellement] 
														else [CheckInScellement] 
														end [CheckInScellement], 
							isnull(convert(nvarchar, [CléScellement]), '''') AS [CleScellement],
							isnull(convert(nvarchar,[CléScellementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléScellementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléScellementHoraire])),2),'''') AS [CleScellementHoraire],
							case isnull(BT.Mode_Test,0) when 1 then [TestCheckInDépouillement] 
														else [CheckInDépouillement] 
														end [CheckInDepouillement], 
							isnull(convert(nvarchar, [CléDépouillement]), '''') AS [CleDepouillement],
							isnull(convert(nvarchar,[CléDépouillementHoraire],103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,[CléDépouillementHoraire])),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,[CléDépouillementHoraire])),2),'''') AS [CleDepouillementHoraire],
							C.MailProfessionnel,
							C.MobileProfessionnel
						from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on BM.IdBureau=BT.IdBureau and BT.NTour=BM.NTour
						inner join ['+@PAPDatabase+'].dbo.COLLABORATEURS C on BM.Idcollaborateur=C.Id
						where BM.NTour=@NTour and refus=0 AND C.IdPAP=@IdElection
						order by IdBureauBureau, case President when 1 then 0 
																else 1 
																end, 
								BM.IdCollaborateur
					'

					SET @ReqBureauA = @Req1 + @ReqBureauA


					-- URNES
					SELECT @ReqUrnesA = '

						declare @Req nvarchar(max)

						declare @URNES table
							(	
								IdElection int,
								IdUrne int, 
								IdBureauUrne int, 
								IdQuestion int, 
								Accord nvarchar(max),
								ModeTest bit, 
								DatabaseVote nvarchar(128),
								IdTour int, 
								NTourUrne tinyint, 
								IdTourUrne int, 
								EtatUrne nvarchar(max), 
								EtatUrneCode int,
								BureauMembresAction int, 
								NbScellement int, 
								NbDepouillement int,
								IdVote int, 
								CodeVote int, 
								Vote nvarchar(max),
								IdEtablissement int, 
								Etablissement nvarchar(max),
								IdCollege int, 
								CodeCollege int, 
								College nvarchar(max),
								IdScrutin int, 
								CodeScrutin int, 
								ScrutinUrne nvarchar(max),
								NbVotants int default 0, 
								VoixVotants int default 0, 
								NbNonVotants int default 0, 
								NbListes int default 0, 
								NbCandidats int default 0, 
								NbSms int default 0, 
								NbSmsPossible int default 0,
								Participation float default 0, 
								Emargement int default 0, 
								DateVote datetime, 
								LastActionUrne datetime,
								Bulletins int default 0, 
								Blancs int default 0, 
								Nuls int default 0, 
								PbBulletins int default 0,
								DateEtat datetime, 
								HashDepouillement nvarchar(max)
								PRIMARY KEY(IdUrne,IdTour,IdQuestion)
							)

						declare @P table
							(	
								NTour tinyint not null, 
								ModeTest bit,
								CodeVote int, 
								CodeCollege int, 
								College nvarchar(max), 
								CollegeLibelleVariable bit,
								IdEtablissement int, 
								Etablissement nvarchar(max), 
								ELECTEURS int, 
								VOTANTS int, 
								PARTICIPATION float
							)

						insert @URNES
							(	
								IdElection,
								IdUrne,
								IdBureauUrne,
								IdQuestion,
								Accord,
								ModeTest,
								DatabaseVote,
								IdTour,
								NTourUrne,
								IdTourUrne,
								EtatUrne,
								EtatUrneCode,
								IdVote,
								CodeVote,
								Vote,
								IdEtablissement,
								Etablissement,
								IdCollege,
								CodeCollege,
								College,
								IdScrutin,
								CodeScrutin,
								ScrutinUrne,
								DateEtat,
								HashDepouillement
							)
						'

					SELECT @ReqUrnesA += '
						select 
							V.IdPAP,
							U.Id, 
							U.IdBureau, 
							isnull(TU.IdQuestion,-1), 
							isnull(Q.Accord,''''),
							isnull(BT.Mode_Test,0), 
							case isnull(BT.Mode_Test,0) when 0 then T.DatabaseVote 
														else T.[TestDatabaseVote] 
														end,
							T.Id, 
							T.NTour, 
							TU.Id, 
							ETU.Libelle,
							ETU.Code,
							U.IdVote, 
							TV.Code, 
							TV.Libelle, 
							E.Id, 
							E.Nom, 
							U.IdCollege, 
							TC.Code, 
							isnull(nullif(C.Libelle,''''),
							TC.Libelle), 
							U.IdScrutin, 
							S.Code, 
							S.Libelle,
							case ETU.Code when 2 then TU.DateScellement 
											when 3 then TU.DateDepouillement 
											else null 
											end,
							case isnull(BT.Mode_Test,0) when 0 then [HashDepouillementBureau]
														else [TestHashDepouillementBureau] 
														end
						from ['+@PAPDatabase+'].dbo.URNES U
						inner join ['+@PAPDatabase+'].dbo.VOTES V on V.Id=U.IdVote
						inner join ['+@PAPDatabase+'].dbo.TYPE_VOTE TV on TV.Id=V.IdTypeVote
						left join ['+@PAPDatabase+'].dbo.ETABLISSEMENTS E on U.IdEtablissement=E.Id
						left join ['+@PAPDatabase+'].dbo.COLLEGES C on C.id=U.IdCollege
						left join ['+@PAPDatabase+'].dbo.TYPE_COLLEGE TC on C.IdTypeCollege=TC.Id
						left join ['+@PAPDatabase+'].dbo.SCRUTINS S on S.Id=U.IdScrutin
						inner join ['+@PAPDatabase+'].dbo.TOURS T on T.IdVote=U.IdVote
						left join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on T.Id=TU.IdTour and U.id=TU.IdUrne
						left join ['+@PAPDatabase+'].dbo.BUREAU_TOURS BT on U.IdBureau=BT.IdBureau and BT.NTour=T.NTour
						left join ['+@PAPDatabase+'].dbo.ETAT_TOUR_URNE ETU on case isnull(BT.Mode_Test,0) when 0 then TU.IdEtatTourUrne else TU.[TestIdEtatTourUrne] end=ETU.Id
						left join ['+@PAPDatabase+'].dbo.QUESTIONS Q on Q.Id=TU.IdQuestion
						where T.NTour=@NTour AND V.IdPAP=@IdElection
						'

					SELECT @ReqUrnesA += '
						DECLARE 
							@Debut datetime=['+@PAPDatabase+'].[dbo].[FN_CodeNonVotant_GetDateReference](),
							@Controle bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](27),
							@AgeMin int=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](28),
							@Naissance bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](78),
							@Anciennete bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](31),
							@AncienneteInterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](29),
							@AncienneteExterne int =['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionEntier](30),
							@Questions bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](10),
							@Voix bit=['+@PAPDatabase+'].[dbo].[FN_GetVoteOptionActivation](44)

						;with E as
						(	
							select 
								U.IdTourUrne, 
								-- cf. ['+@PAPDatabase+'].dbo.FN_CodeNonVotant
								case 
								when @Questions=1 and @Voix=1 and isnull(QC.Voix,C.Voix)=0 then 4 
								when TC.Code in (4,2) then 4
								when @Controle=0 then 0
								when @Naissance=1 and datepart(yy,@Debut-convert(datetime,C.DateNaissance))-1900<@AgeMin then 1	-- Pas encore 16 ans le jour du 1er tour
								when @Anciennete=1 and C.Interne=1 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteInterne,convert(datetime,C.DateEntree))>@Debut) then 2	-- Interne : pas 3 mois dans la société
								when @Anciennete=1 and C.Interne=0 and (convert(date,@Debut)<C.DateEntree or dateadd(mm,@AncienneteExterne,convert(datetime,C.DateEntree))>@Debut) then 3	-- externe : pas 6 mois dans la société
								else 0 end as CodeNonVotant,
								C.Id as IdCollaborateur,
								C.LastAction, 
								case when @Voix=1 then isnull(QC.Voix,C.Voix) else 0 end as Voix,
								case when isnull(MailProfessionnel,'''')='''' then 1 else 0 end as PAR_SMS, case when isnull(MobileProfessionnel,'''')<>'''' then 1 else 0 end as PAR_SMS_POSSIBLE
							from ['+@PAPDatabase+'].dbo.COLLABORATEURS C
							inner join ['+@PAPDatabase+'].dbo.VOTE_COLLABORATEUR_COLLEGE VCC on VCC.IdCollaborateur=C.Id
							inner join @URNES U on U.IdVote=VCC.IdVote and isnull(nullif(U.IdEtablissement,-1),VCC.IdEtablissement)=VCC.IdEtablissement and U.IdCollege=VCC.IdCollege
							inner join ['+@PAPDatabase+'].dbo.TYPE_COLLABORATEUR TC on TC.Id=C.IdTypeCollaborateur
							left join ['+@PAPDatabase+'].dbo.QUESTION_COLLABORATEUR QC on QC.IdQuestion=U.IdQuestion and QC.IdCollaborateur=C.Id)
						, ENB as
						(	
							select 
								IdTourUrne, 
								sum(case CodeNonVotant when 0 then 1 else 0 end) as Votants,
								sum(case CodeNonVotant when 0 then Voix else 0 end) as Voix,
								sum(case CodeNonVotant when 0 then 0 else 1 end) as NonVotants,
								sum(PAR_SMS) PAR_SMS, sum(PAR_SMS_POSSIBLE) PAR_SMS_POSSIBLE,
								Max(LastAction) as LastAction
							from E
							group by IdTourUrne
						)
						update U
						set NbVotants=ENB.Votants,
							VoixVotants=ENB.Voix,
							NbNonVotants=ENB.NonVotants,
							NbSms=ENB.PAR_SMS,
							NbSmsPossible=ENB.PAR_SMS_POSSIBLE,
							LastActionUrne=ENB.LastAction
						from @URNES U
						inner join ENB on isnull(U.IdTourUrne,-1)=isnull(ENB.IdTourUrne,-1)
						'

					SELECT @ReqUrnesA += '
						;with B as
						(	
							select 
								U.IdBureauUrne,
								U.IdUrne,
								U.IdQuestion,
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInScellement] else [CheckInScellement] end)) as NbScellement, 
								sum(convert(int,case U.ModeTest when 1 then [TestCheckInDépouillement] else [CheckInDépouillement] end)) as NbDepouillement
							from ['+@PAPDatabase+'].dbo.BUREAU_MEMBRES BM
							inner join @URNES U on U.IdBureauUrne=BM.IdBureau and BM.NTour=@NTour
							group by U.IdBureauUrne,U.IdUrne,U.IdQuestion
						)
						update @URNES set NbScellement=B.NbScellement, NbDepouillement=B.NbDepouillement, BureauMembresAction=P.BureauMembersScellementMin
						from @URNES U
						inner join B on B.IdBureauUrne=U.IdBureauUrne and U.IdUrne=B.IdUrne and U.IdQuestion=B.IdQuestion
						inner join ['+@PAPDatabase+'].dbo.PAP P on P.id=@IdElection

						declare @Lib nvarchar(50)=''''
						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](9)=1
						begin
							set @Lib=''NB Listes''
							declare @LISTES table
							(	
								IdListe int, 
								IdUrne int, 
								IdTour int, 
								NbCandidats int
							)

							insert @LISTES 
							(
								IdListe,
								IdUrne,
								IdTour,
								NbCandidats
							)
							select 
								LC.id, 
								IdUrne,
								U.IdTour,
								count(distinct C.id)
							from @URNES U
							inner join ['+@PAPDatabase+'].dbo.LISTE_CANDIDATS LC on LC.IdTour=U.IdTour and LC.IdCollege=U.IdCollege and LC.IdEtablissement=isnull(nullif(U.IdEtablissement,-1),LC.IdEtablissement) and LC.IdScrutin=U.IdScrutin
							inner join ['+@PAPDatabase+'].dbo.CANDIDATS C on LC.Id=C.IdListeCandidats
							group by  LC.id,IdUrne,U.IdTour

							;with L as
							(	
								select 
									IdUrne,
									IdTour,
									count(distinct IdListe) as NB_Liste, 
									sum(NbCandidats) as NB_Candidats
								from @LISTES L
								group by IdUrne,IdTour
							)
							update U
							set NbListes=L.NB_Liste, NbCandidats=L.NB_Candidats
							from @URNES U
							inner join L on U.IdUrne=L.IdUrne and U.IdTour=L.IdTour
						end

						if ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](10)=1
						begin
							set @Lib=''NB Questions''
							;with Q as
							(	
								select 
									TU.IdUrne, 
									TU.IdTour, 
									count(distinct Q.Id) as NB
								from ['+@PAPDatabase+'].dbo.QUESTIONS Q
								inner join ['+@PAPDatabase+'].dbo.TOUR_URNE TU on Q.Id=TU.IdQuestion
								inner join ['+@PAPDatabase+'].dbo.TOURS T on T.Id=TU.IdTour and T.NTour=@NTour
								group by TU.IdUrne, TU.IdTour
							)
							update U
							set NbListes=NB
							from @URNES U
							inner join Q on Q.IdUrne=U.IdUrne and Q.IdTour=U.IdTour
						end
						'

					SELECT @ReqUrnesA = +'
						insert @P
						select * from ['+@PAPDatabase+'].dbo.[FN_GetTourParticipation](0, @NTour,1)
						order by NTour, CodeVote, CodeCollege,IdEtablissement

						update U
						set Participation=P.PARTICIPATION
						from @URNES U
						inner join @P P on P.NTour=@NTour and P.CodeVote=U.CodeVote and isnull(P.CodeCollege,0)=isnull(U.CodeCollege,0) and P.IdEtablissement=isnull(U.IdEtablissement,-1)

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) 
								Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.Modetest=0

						;with E as
						(	
							select 
								IdTourUrne, 
								count(*) Emargements, 
								Max(dateVote) as DateVote 
							from ['+@PAPDatabase+'].dbo.EMARGEMENTS_TEST 
							group by IdTourUrne
						)
						update U
						set Emargement=Emargements,DateVote=E.DateVote
						from @URNES U
						inner join E on U.IdTourUrne=E.IdTourUrne
						where U.ModeTest=1

						declare @IU table (Id int PRIMARY KEY, Val int)
						declare @IU_NULS table (Id int, Code int, Val int PRIMARY KEY(Id,Code))
						declare @AZURE bit= convert(bit,case when convert(nvarchar,SERVERPROPERTY(''Edition'')) like ''%Azure%'' then 1 else 0 end)
						declare @AvecVOIX_BULLETINS bit=1
						'

					-- CURSEUR DATABASEVOTE A REMPLACER
					declare C Cursor local fast_forward
					for select distinct DatabaseVote from @DBVotes
					open C
					fetch next from C into @DatabaseVote
					begin
						SELECT @ReqUrnesA += '
							delete @IU
							insert @IU
							select IdTourUrne, count(*) as Votes from ['+@DatabaseVote+'].dbo.[BULLETINS] group by IdTourUrne
							update U 
							set BULLETINS=IU.Val
							from @URNES U
							inner join @IU IU on U.IdTourUrne=IU.Id

							delete @IU_NULS
							begin try
								insert @IU_NULS
								select IdTourUrne, case when Voix=0 and IdListe=-2 then -20 else IdListe end as Code, count(*) as Votes
								from ['+@DatabaseVote+'].dbo.[VOTES] where IdListe<0 group by IdTourUrne,case when Voix=0 and IdListe=-2 then -20 else IdListe end
								update U 
									set PbBulletins=IU.Val
								from @URNES U
								inner join @IU_NULS IU on U.IdTourUrne=IU.Id
								where Code=-20
							end try
							begin catch
								set @AvecVOIX_BULLETINS=0
							end catch

							update U 
							set Nuls=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-2

							update U 
							set Blancs=IU.Val
							from @URNES U
							inner join @IU_NULS IU on U.IdTourUrne=IU.Id
							where Code=-3
							'
						
						fetch next from C into @DatabaseVote
					end
					close C
					deallocate C

					SELECT @ReqUrnesA += 'select 
							''URNE'' as Urne, 
							IdElection,
							IdBureauUrne,
							ModeTest,
							NTourUrne, 
							EtatUrne + '' : '' + case when DatabaseVote is null and EtatUrne =1 then ''BASE A CREER''
													when DatabaseVote is null and EtatUrne =2 then ''ERREUR BASE ABSENTE''
													else ''BASE OK'' 
													end as EtatUrne, 
							isnull(convert(nvarchar,DateEtat,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,DateEtat)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,DateEtat)),2),'''') as DateEtat,
							U.Accord,
							U.NbListes as NbListes, 
							convert(nvarchar,U.NbVotants) + case U.VoixVotants when 0 then '''' 
																				else '' [''''+convert(nvarchar,VoixVotants)+'''' voix]'' 
																				end + ''(SMS='' + convert(nvarchar,U.NbSms) + ''/'' + convert(nvarchar,U.NbSmsPossible) + '')'' as ''NbVotants'', 
							U.NbNonVotants,
							Etablissement,
							College,
							ScrutinUrne,
							U.Participation,
							U.Emargement,
							U.Bulletins,
							case when U.Emargement=U.Bulletins then ''OK'' 
									else ''KO'' 
									end as CoherenceVote,
							isnull(convert(nvarchar,U.DateVote,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.DateVote)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.DateVote)),2),'''') as DateVote,
							isnull(convert(nvarchar,U.LastActionUrne,103)+'' ''+RIGHT(''00''+convert(nvarchar,DATEPART(HH,U.LastActionUrne)),2)+'':''+RIGHT(''00''+convert(nvarchar,DATEPART(MI,U.LastActionUrne)),2),'''') as LastActionUrne,
							case EtatUrneCode when 3 then convert(nvarchar,U.Blancs) 
												else ''--'' 
												end Blancs,
							case EtatUrneCode when 3 then convert(nvarchar,U.Nuls) 
												else ''--'' 
												end Nuls,
							case when EtatUrneCode<3 or @AvecVOIX_BULLETINS=0 then ''--'' 
									else convert(nvarchar,U.PbBulletins) 
									end PbBulletins,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--'' 
									else convert(nvarchar,convert(float,NbVotants)/2) 
									end as Quorum,
							case when NTourUrne=2 or ['+@PAPDatabase+'].dbo.[FN_GetVoteOptionActivation](60)=0 then ''--''
									when (U.Emargement-U.Nuls-U.Blancs-U.PbBulletins)>convert(decimal,NbVotants)/2 then ''Oui''
									else ''Non'' 
									end as QuorumAtteint,
							BureauMembresAction, 
							NbScellement, 
							NbDepouillement,
							Vote,
							U.IdUrne,
							U.IdTour,
							isnull(IdTourUrne,-1) as IdTourUrne,
							HashDepouillement
						from @URNES U
					'

					SET @ReqUrnesA = @Req1 + @ReqUrnesA
					
					print 'Azure 0 VA avant Insert AVT'
					INSERT dbo.Admin_Analyse_Vote_Tour
					(
						Tour,
						Libelle,
						PAPDatabase,
						IdElection,
						NTourTour,
						Horaire,
						DateScellementUrnes,
						Debut,
						Fin,
						DelaiCloseScrutin,
						EtatAvancement,
						AvancementTour,
						Demo,
						MDPSize,
						MDPAlpha,
						Categories,
						CategoriesRepresentees,
						DateDebutDepotListe,
						DateMaxDepotListe
					)
					EXEC (@ReqTourA)

					print 'Azure 0 VA avant Insert AVBM'
					INSERT dbo.Admin_Analyse_Vote_Bureau_Membres
					(
						Bureau,
						IdElection,
						IdBureauBureau,
						ModeTest,
						IdMembre,
						Nom,
						Prenoms,
						DateNaissance,
						LastActionBureau,
						Age,
						President,
						IdCollaborateur,
						[CheckInScellement],
						[CleScellement],
						[CleScellementHoraire],
						CheckInDepouillement,
						[CleDepouillement],
						[CleDepouillementHoraire],
						MailProfessionnel,
						MobileProfessionnel
					)
					EXEC (@ReqBureauA)

					print 'Azure 0 VA avant Insert AVU'
					INSERT dbo.Admin_Analyse_Vote_Urnes
					(
						Urne,
						IdElection,
						IdBureauUrne,
						ModeTest,
						NTourUrne,
						EtatUrne,
						DateEtat,
						Accord,
						NbListes,
						NbVotants,
						NbNonVotants,
						Etablissement,
						College,
						ScrutinUrne,
						Participation,
						Emargement,
						Bulletins,
						CoherenceVote,
						DateVote,
						LastActionUrne,
						Blancs,
						Nuls,
						PbBulletins,
						Quorum,
						QuorumAtteint,
						BureauMembresAction,
						NbScellement,
						NbDepouillement,
						Vote,
						IdUrne,
						IdTour,
						IdTourUrne,
						HashDepouillement
					)
					EXEC (@ReqUrnesA)
					print 'Azure 0 VA après Insert AVU'
				END
		END

	SELECT @Req2=
						'IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = N''DataSourceAdmin_'+@PAPDatabase+''')
							DROP EXTERNAL DATA SOURCE DataSourceAdmin_'+@PAPDatabase
	EXEC (@Req2)
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Support_Analyse_Vote_Bureau_Membres]    Script Date: 21/07/2021 11:14:50 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Support_Analyse_Vote_Bureau_Membres]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Bureau_Membres] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 21/07/2021
-- Description:	Lecture de la Table [dbo].[Admin_Analyse_Vote_Bureau_Membres] pour afficher le deuxième tableau de [dbo].[_Admin_Support_Analyse_Vote]
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Bureau_Membres]
	@IdElection INT

AS
BEGIN
	SET NOCOUNT ON
    SET XACT_ABORT ON 
    SET FMTONLY OFF

    SELECT * FROM [dbo].[Admin_Analyse_Vote_Bureau_Membres] WHERE IdElection = @IdElection
END

GO


/****** Object:  StoredProcedure [dbo].[_Admin_Support_Analyse_Vote_Tour]    Script Date: 21/07/2021 11:14:48 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Support_Analyse_Vote_Tour]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Tour] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 21/07/2021
-- Description:	Lecture de la Table [dbo].[Admin_Analyse_Vote_Tour] pour afficher le premier tableau de [dbo].[_Admin_Support_Analyse_Vote]
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Tour]
	@IdElection INT

AS
BEGIN
	SET NOCOUNT ON
    SET XACT_ABORT ON 
    SET FMTONLY OFF

    SELECT * FROM [dbo].[Admin_Analyse_Vote_Tour] WHERE IdElection = @IdElection
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_Support_Analyse_Vote_Urnes]    Script Date: 21/07/2021 11:14:51 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_Support_Analyse_Vote_Urnes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Urnes] AS' 
END
GO
-- =============================================
-- Author:		Anne-Laure Bonnefond
-- Create date: 21/07/2021
-- Description:	Lecture de la Table [dbo].[Admin_Analyse_Vote_Urnes] pour afficher le troisième tableau de [dbo].[_Admin_Support_Analyse_Vote]
-- =============================================
ALTER PROCEDURE [dbo].[_Admin_Support_Analyse_Vote_Urnes]
	@IdElection INT

AS
BEGIN
	SET NOCOUNT ON
    SET XACT_ABORT ON 
    SET FMTONLY OFF

    SELECT * FROM [dbo].[Admin_Analyse_Vote_Urnes] WHERE IdElection = @IdElection
END
GO


/****** Object:  StoredProcedure [dbo].[_Admin_SAV_Scrutins_MB]    Script Date: 22/11/2021 22:19:55 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_Admin_SAV_Scrutins_MB]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[_Admin_SAV_Scrutins_MB] AS' 
END
GO
ALTER PROCEDURE [dbo].[_Admin_SAV_Scrutins_MB] 
    @Recherche NVARCHAR(MAX),
    @IdUser INT,
	@FiltreCode INT,
	@Page INT,
	@PageSize INT,
	@Count INT OUTPUT
AS
BEGIN
    --SET NOCOUNT ON;
    SET XACT_ABORT ON 
    SET FMTONLY OFF
	SET LANGUAGE FRENCH

    SELECT @Recherche = UPPER(TRIM(@Recherche));
    --SELECT @Recherche --à mettre en comm

    -- TABLE DES CHAINES DE CARACTERES ENREGISTREES SEPAREMENT
    DECLARE @ChaineDeRecherche TABLE (Chaine nvarchar(max))
    INSERT @ChaineDeRecherche
    SELECT Chaine FROM Split(@Recherche)

	-- TABLE ROLE POUR LES ROLES ADMIN (1), COMMERCIAUX (2), SAV (6), MB (7)
	DECLARE @R TABLE 
	(
		Role INT, 
		IdUser INT
	)

	INSERT @R
	SELECT 
		R.Code, 
		@IdUser
	FROM ROLES R
	INNER JOIN [dbo].[UTILISATEUR_ROLES] UR ON R.Code = UR.IdRole AND UR.IdUser = @IdUser
	WHERE R.Code IN (1,2,6,7)

    -- TABLE DU TYPE DE VOTE : CONTIENT LE TYPE SOUS FORMAT CHAINE ET CODE
    DECLARE @V TABLE (ChaineVote NVARCHAR(MAX), CodeVote INT)
    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
    BEGIN
        INSERT @V
        SELECT DISTINCT
            Chaine, 
            CASE WHEN Chaine = 'CSE' THEN 4
                WHEN Chaine = 'REFERUNDUM' OR Chaine ='REF' THEN 5
                WHEN Chaine = 'CONSULTATION' OR Chaine = 'CONS' THEN 7
                WHEN Chaine = 'ARP' THEN 8
                WHEN Chaine = 'AG' THEN 6
                WHEN Chaine = 'ELECTION' OR Chaine ='ELEC' THEN 11
                WHEN Chaine = 'FCPE' THEN 10
                ELSE 0
            END as CodeVote
        FROM @ChaineDeRecherche
        WHERE Chaine IN ('CSE', 'REFERUNDUM', 'REF', 'CONSULTATION', 'CONS', 'ARP', 'AG', 'ELECTION', 'ELEC', 'FCPE')
    END

    IF EXISTS (SELECT * FROM @ChaineDeRecherche)
        DELETE CDR FROM @ChaineDeRecherche CDR INNER JOIN @V V ON V.ChaineVote = CDR.Chaine
  
    -- TABLE DE SORTIE
    DECLARE @T TABLE 
    (
		IdElection INT PRIMARY KEY,
        IdCompany INT,
        CompanyName NVARCHAR(MAX),
        TypeScrutin INT,
        NbSalaries INT,
		Date1erTourScellement DATETIME,
		Date1erTourDebut DATETIME not null, 
		Date1erTourFin DATETIME not null,
		Date2emeTourScellement DATETIME,
		Date2emeTourDebut DATETIME,
		Date2emeTourFin DATETIME,
        -- Temporaire
        Avancement int,
        Avancement1erTour int,
        Avancement2ndTour int,
        -- Pour le résultat
        AvancementScrutin NVARCHAR(MAX),
		Statut INT,
		Buttons NVARCHAR(MAX),
		VersionAPI NVARCHAR(50),
		EtatSimulationPAP INT,
		Marque INT
    )

	declare @Role1 bit=0, @Role6 bit=0, @Role7 bit=0
	select @Role1=1 from @R where Role=1
	select @Role6=1 from @R where Role=6
	select @Role7=1 from @R where Role=7

	IF (@Role1=1 or (@Role6=1 and @Role7=1))
		BEGIN
			IF EXISTS (SELECT * FROM @ChaineDeRecherche)
				BEGIN
					UPDATE @ChaineDeRecherche SET Chaine = '%' + Chaine + '%' WHERE CHARINDEX('%', Chaine) = 0 --va préparer le LIKE   

					INSERT @T 
						(IdCompany,
						IdElection,
						CompanyName, 
						TypeScrutin,
						NbSalaries, 
						AvancementScrutin,
						Avancement, Avancement1erTour, Avancement2ndTour,
						Date1erTourScellement,
						Date1erTourDebut, 
						Date1erTourFin,
						Date2emeTourScellement,
						Date2emeTourDebut,
						Date2emeTourFin,
						Statut,
						Buttons,
						VersionAPI,
						EtatSimulationPAP,
						Marque)
					SELECT DISTINCT
						C.Id,
						SP.Id, 
						C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
						AEI.CodeVote, 
						AEI.NbSalaries, 
						-- Avancement
						'' as AvancementScrutin, 
						AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
						AEI.Date1erScellementUrnes,
						ISNULL(AEI.Date1erTourDebut, 0), 
						ISNULL(AEI.Date1erTourFin, 0),
						AEI.Date2emeScellementUrnes,
						AEI.Date2emeTourDebut,
						AEI.Date2emeTourFin,
						CASE 
							WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
							WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
							WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
							ELSE 3
							END,
						'',
						SP.VersionAPI,
						ESP.Code,
						SP.Marque
					FROM COMPANY C
					left join APE on C.IdBrancheActivite = APE.Id
					inner join CONTACTS Ct on C.Id = Ct.IdCompany
					inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
					inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
					inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
					inner join @ChaineDeRecherche CH ON (C.Nom LIKE CH.Chaine OR Ct.Nom LIKE CH.Chaine OR Ct.Prenoms LIKE CH.Chaine OR Ct.Email LIKE CH.Chaine OR convert(varchar, AEI.Date1erTourDebut, 103) LIKE CH.Chaine OR convert(varchar, AEI.Date2emeTourDebut, 103) LIKE CH.Chaine OR SP.Id LIKE CH.Chaine OR APE.Code LIKE CH.Chaine)
					WHERE (ESP.Code IN (1,2,4,5)) AND Marque > 0
						--AND SP.Demo=0
				END
			ELSE
				BEGIN
					INSERT @T 
						(IdCompany,
						IdElection,
						CompanyName, 
						TypeScrutin,
						NbSalaries, 
						AvancementScrutin,
						Avancement, Avancement1erTour, Avancement2ndTour,
						Date1erTourScellement,
						Date1erTourDebut, 
						Date1erTourFin,
						Date2emeTourScellement,
						Date2emeTourDebut,
						Date2emeTourFin,
						Statut,
						Buttons,
						VersionAPI,
						EtatSimulationPAP,
						Marque)
					SELECT DISTINCT
						C.Id,
						SP.Id,
						C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
						AEI.CodeVote, 
						AEI.NbSalaries, 
						-- Avancement
						'' as AvancementScrutin, 
						AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
						AEI.Date1erScellementUrnes,
						ISNULL(AEI.Date1erTourDebut, 0), 
						ISNULL(AEI.Date1erTourFin, 0),
						AEI.Date2emeScellementUrnes,
						AEI.Date2emeTourDebut,
						AEI.Date2emeTourFin,
						CASE 
							WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
							WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
							WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
							ELSE 3
							END,
						'',
						SP.VersionAPI,
						ESP.Code,
						SP.Marque
					FROM COMPANY C
					cross join @R R
					left join APE on C.IdBrancheActivite = APE.Id
					inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
					inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
					inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
					WHERE ESP.Code IN (1,2,5) AND Marque > 0
						--AND SP.Demo=0
				END
		END
	ELSE --IF ((SELECT Role FROM @R) = 7)
		BEGIN
			IF EXISTS (SELECT * FROM @ChaineDeRecherche)
				BEGIN
					UPDATE @ChaineDeRecherche SET Chaine = '%' + Chaine + '%' WHERE CHARINDEX('%', Chaine) = 0 --va préparer le LIKE   

					INSERT @T 
						(IdCompany,
						IdElection,
						CompanyName, 
						TypeScrutin,
						NbSalaries, 
						AvancementScrutin,
						Avancement, Avancement1erTour, Avancement2ndTour,
						Date1erTourScellement,
						Date1erTourDebut, 
						Date1erTourFin,
						Date2emeTourScellement,
						Date2emeTourDebut,
						Date2emeTourFin,
						Statut,
						Buttons,
						VersionAPI,
						EtatSimulationPAP,
						Marque)
					SELECT DISTINCT
						C.Id,
						SP.Id, 
						C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
						AEI.CodeVote, 
						AEI.NbSalaries, 
						-- Avancement
						'' as AvancementScrutin, 
						AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
						AEI.Date1erScellementUrnes,
						ISNULL(AEI.Date1erTourDebut, 0), 
						ISNULL(AEI.Date1erTourFin, 0),
						AEI.Date2emeScellementUrnes,
						AEI.Date2emeTourDebut,
						AEI.Date2emeTourFin,
						CASE 
							WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
							WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
							WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
							ELSE 3
							END,
						'',
						SP.VersionAPI,
						ESP.Code,
						SP.Marque
					FROM COMPANY C
					left join APE on C.IdBrancheActivite = APE.Id
					inner join CONTACTS Ct on C.Id = Ct.IdCompany
					inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
					inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
					inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
					inner join @ChaineDeRecherche CH ON (C.Nom LIKE CH.Chaine OR Ct.Nom LIKE CH.Chaine OR Ct.Prenoms LIKE CH.Chaine OR Ct.Email LIKE CH.Chaine OR convert(varchar, AEI.Date1erTourDebut, 103) LIKE CH.Chaine OR convert(varchar, AEI.Date2emeTourDebut, 103) LIKE CH.Chaine OR SP.Id LIKE CH.Chaine OR APE.Code LIKE CH.Chaine)
					INNER JOIN UTILISATEURS U ON U.Id = @IdUser
					WHERE (ESP.Code IN (1,2,4,5)) AND @IdUser = U.Id AND SP.Marque = U.Marque
						--AND SP.Demo=0
				END
			ELSE
				BEGIN
					INSERT @T 
						(IdCompany,
						IdElection,
						CompanyName, 
						TypeScrutin,
						NbSalaries, 
						AvancementScrutin,
						Avancement, Avancement1erTour, Avancement2ndTour,
						Date1erTourScellement,
						Date1erTourDebut, 
						Date1erTourFin,
						Date2emeTourScellement,
						Date2emeTourDebut,
						Date2emeTourFin,
						Statut,
						Buttons,
						VersionAPI,
						EtatSimulationPAP,
						Marque)
					SELECT DISTINCT
						C.Id,
						SP.Id,
						C.Nom + ' - '+ ISNULL(SP.VersionAPI,'A') , 
						AEI.CodeVote, 
						AEI.NbSalaries, 
						-- Avancement
						'' as AvancementScrutin, 
						AEI.Avancement, AEI.Avancement1erTour, AEI.Avancement2ndTour,
						AEI.Date1erScellementUrnes,
						ISNULL(AEI.Date1erTourDebut, 0), 
						ISNULL(AEI.Date1erTourFin, 0),
						AEI.Date2emeScellementUrnes,
						AEI.Date2emeTourDebut,
						AEI.Date2emeTourFin,
						CASE 
							WHEN dbo.GetRealDate() between AEI.Date1erTourDebut and AEI.Date1erTourFin THEN 1
							WHEN dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date1erTourDebut) and AEI.Date1erTourDebut THEN 2
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between AEI.Date2emeTourDebut and AEI.Date2emeTourFin THEN 1
							WHEN AEI.Date2emeTourDebut is not null AND dbo.GetRealDate() between DATEADD(dd,-7,AEI.Date2emeTourDebut) and AEI.Date2emeTourDebut THEN 2
							WHEN AEI.Avancement IN (1,2) AND dbo.GetRealDate() > DATEADD(dd, 1, AEI.Date1erTourDebut) THEN 4
							ELSE 3
							END,
						'',
						SP.VersionAPI,
						ESP.Code,
						SP.Marque
					FROM COMPANY C
					cross join @R R
					left join APE on C.IdBrancheActivite = APE.Id
					inner join SIMULATION_PAP SP on C.Id = SP.IdCompany
					inner join Admin_Election_Infos AEI on SP.Id = AEI.IdElection
					inner join ETAT_SIMULATION_PAP ESP on ESP.Id = SP.IdEtat
					INNER JOIN UTILISATEURS U ON U.Id = @IdUser
					WHERE ESP.Code IN (1,2,5) AND @IdUser = U.Id AND SP.Marque = U.Marque
						--AND SP.Demo=0
				END
		END





    

    -- Delete des scrutin absents de la table @V s'il y a des filtres sur le type de vote
    IF EXISTS (SELECT * FROM @V)
        DELETE T FROM @T T LEFT JOIN @V V ON V.CodeVote=T.TypeScrutin WHERE V.CodeVote IS NULL

    -- Update AvancementScrutin pour le résultats
    UPDATE @T
    SET AvancementScrutin = CASE WHEN Avancement = 1 AND TypeScrutin = 4 THEN 'PAP'
								WHEN Avancement = 1 AND TypeScrutin <> 4 THEN 'Périmètre'
                                WHEN Avancement = 2 THEN 'Liste Electorale'
                                WHEN Avancement = 3 THEN 'Délais des 3 jours'
                                WHEN Avancement = 4 AND Avancement1erTour = 1 AND TypeScrutin = 4 THEN 'Liste de candidats 1er tour'
                                WHEN Avancement = 4 AND Avancement1erTour = 1 AND TypeScrutin <> 4 THEN 'Liste de candidats' -- <> : différent
                                WHEN Avancement = 4 AND Avancement1erTour = 2 AND TypeScrutin = 4 THEN 'Bureau de vote 1er tour'
                                WHEN Avancement = 4 AND Avancement1erTour = 2 AND TypeScrutin <> 4 THEN 'Bureau de vote' -- <> : différent
                                WHEN Avancement = 4 AND Avancement1erTour = 3 THEN 'Attente scrutin'
                                WHEN Avancement = 4 AND Avancement1erTour = 4 THEN 'Scrutin en cours'
								WHEN Avancement = 4 AND Avancement1erTour = 5 AND TypeScrutin = 4 THEN '1er tour terminé'
								WHEN Avancement = 4 AND Avancement1erTour = 5 AND TypeScrutin <> 4 THEN 'Terminé'
                                WHEN Avancement = 5 AND Avancement2ndTour = 1 AND TypeScrutin = 4 THEN 'Liste de candidats 2nd tour'
                                WHEN Avancement = 5 AND Avancement2ndTour = 1 AND TypeScrutin <> 4 THEN 'Liste de candidats' -- <> : différent
                                WHEN Avancement = 5 AND Avancement2ndTour = 2 AND TypeScrutin = 4 THEN 'Bureau de vote 2nd tour'
                                WHEN Avancement = 5 AND Avancement2ndTour = 2 AND TypeScrutin <> 4 THEN 'Bureau de vote' -- <> : différent
                                WHEN Avancement = 5 AND Avancement2ndTour = 3 THEN 'Attente scrutin'
                                WHEN Avancement = 5 AND Avancement2ndTour = 4 THEN 'Scrutin en cours'
								WHEN Avancement = 5 AND Avancement2ndTour = 5 THEN '2nd tour terminé'
                                WHEN Avancement = 6 THEN 'Terminé'
                                ELSE 'Inconnu'
                            END


	-- Delete par rapport à un nouveau champ filtre par rapport à ma procédure : calcul le statut puis delete les élections qui me concernent pas si le filtre est mis
    IF @FiltreCode=1
	DELETE @T WHERE ISNULL(Statut,3)=3

	SELECT *, ROW_NUMBER() OVER(ORDER BY IdElection DESC) AS RowNumber
	INTO #T
	FROM @T T

	SELECT 
		@Count=COUNT(*)
	FROM #T

	DELETE #T WHERE NOT (@PageSize=0 OR (RowNumber BETWEEN (@Page-1)*@PageSize+1 AND @Page*@PageSize))

	--Aller sur le site de paramétrage
	UPDATE #T 
	SET Buttons = CASE
					WHEN EtatSimulationPAP IN (1,2,5) THEN ISNULL(Buttons, '') + CASE -- si le bouton est null : chaine vide
																WHEN ISNULL(Buttons, '')='' THEN '' -- chaine vide
																ELSE ',' -- sinon on rajoute une virgule aux boutons existants
																END + '0' -- 0 : site de parametrage
				END
	FROM @R R
	where R.Role in (1,6,7)

	-- Quand on est dans avancement = 3 => code 1 du bouton // si on est en avancement 2 ou 3 => on peut revenir en phase 1 avec le bouton code 2
	UPDATE #T
	SET Buttons = CASE 
					WHEN Avancement = 3 THEN ISNULL(Buttons, '') + CASE -- bouton rempli ou vide
														WHEN ISNULL(Buttons, '')='' THEN '' -- bouton null ou vide
														ELSE ',' -- si pas vide on rajoute une virgule aux autres chiffres
														END +'1,2' --> va rajouter 1 et 2 à vide OU déjà 0 et 3
					WHEN Avancement = 2 THEN isnull(Buttons, '') + CASE 
														WHEN isnull(Buttons, '')='' THEN '' 
														ELSE ',' 
														END +'2'
					ELSE Buttons
				END
	FROM @R R
	where R.Role in (1,6,7)

	UPDATE #T
		SET Buttons = CASE WHEN DATEPART(dw,Date1erTourScellement) in (1,7) THEN ISNULL(Buttons, '') + CASE
															WHEN isnull(Buttons, '')='' THEN '' 
															ELSE ',' 
															END +'4'
							Else Buttons
						END
	FROM @R R
	where R.Role in (1,6,7)

	UPDATE #T
		SET Buttons = CASE WHEN DATEPART(dw,Date2emeTourScellement) in (1,7) THEN ISNULL(Buttons, '') + CASE
															WHEN isnull(Buttons, '')='' THEN '' 
															ELSE ',' 
															END +'5'
							Else Buttons
						END
	FROM @R R
	where R.Role in (1,6,7) AND Date2emeTourScellement IS NOT NULL

	

	
	SELECT 
		Marque,
		CompanyName,
		Ct.Nom,
		Ct.Prenoms,
		Ct.Email,
		Ct.Telephone,
		IdElection, 
		TypeScrutin,
		NbSalaries,
		AvancementScrutin, Avancement, Avancement1erTour, Avancement2ndTour,
		Date1erTourScellement,
		Date1erTourDebut, 
		Date1erTourFin,
		Date2emeTourScellement,
		Date2emeTourDebut,
		Date2emeTourFin,
		Statut,
		ISNULL(Buttons,'') AS Buttons,
		VersionAPI
	FROM #T T
	left join CONTACTS Ct on T.IdCompany = Ct.IdCompany
	order by IdElection desc
END
GO

BEGIN TRAN
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Scrutins', ForInit=0 where Code='ADMIN_SCRUTINS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_LABEL','fr-FR','Scrutins',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que vous retrouverez tout vos scrutins.', ForInit=0 where Code='ADMIN_SCRUTINS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que vous retrouverez tout vos scrutins.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les scrutins', ForInit=0 where Code='ADMIN_SCRUTINS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_LABEL_AIDE_TITLE','fr-FR','Les scrutins',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACTS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Contacts', ForInit=0 where Code='ADMIN_CONTACTS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACTS_LABEL','fr-FR','Contacts',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que vous retrouverez tout vos contacts.', ForInit=0 where Code='ADMIN_CONTACTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACTS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que vous retrouverez tout vos contacts.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les contacts', ForInit=0 where Code='ADMIN_CONTACTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACTS_LABEL_AIDE_TITLE','fr-FR','Les contacts',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORTS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Support', ForInit=0 where Code='ADMIN_SUPPORTS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORTS_LABEL','fr-FR','Support',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que le support technique va retrouver toutes les informations de suivis des élections complètes.', ForInit=0 where Code='ADMIN_SUPPORTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORTS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que le support technique va retrouver toutes les informations de suivis des élections complètes.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Le support SAV', ForInit=0 where Code='ADMIN_SUPPORTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORTS_LABEL_AIDE_TITLE','fr-FR','Le support SAV',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Scrutins potentiels', ForInit=0 where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_LABEL','fr-FR','Scrutins potentiels',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que vous retrouverez les scrutins à venir.', ForInit=0 where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que vous retrouverez les scrutins à venir.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les scrutins à venir', ForInit=0 where Code='ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_LABEL_AIDE_TITLE','fr-FR','Les scrutins à venir',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_DOCUMENTS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Documents', ForInit=0 where Code='ADMIN_DOCUMENTS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_DOCUMENTS_LABEL','fr-FR','Documents',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_DOCUMENTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que vous retrouverez tout vos documents.', ForInit=0 where Code='ADMIN_DOCUMENTS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_DOCUMENTS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que vous retrouverez tout vos documents.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_DOCUMENTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les documents', ForInit=0 where Code='ADMIN_DOCUMENTS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_DOCUMENTS_LABEL_AIDE_TITLE','fr-FR','Les documents',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_USERS_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Utilisateurs', ForInit=0 where Code='ADMIN_USERS_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_USERS_LABEL','fr-FR','Utilisateurs',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_USERS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='C''est ici que vous retrouverez tous les utilisateurs ayant accès au site de paramétrage.', ForInit=0 where Code='ADMIN_USERS_LABEL_AIDE_CONTENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_USERS_LABEL_AIDE_CONTENT','fr-FR','C''est ici que vous retrouverez tous les utilisateurs ayant accès au site de paramétrage.',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_USERS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les utilisateurs', ForInit=0 where Code='ADMIN_USERS_LABEL_AIDE_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_USERS_LABEL_AIDE_TITLE','fr-FR','Les utilisateurs',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_ERROR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nous ne sommes pas parvenus à vous identifier', ForInit=0 where Code='ADMIN_ERROR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_ERROR','fr-FR','Nous ne sommes pas parvenus à vous identifier',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_COMPANY_NAME' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom de l''entreprise', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_COMPANY_NAME' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_COMPANY_NAME','fr-FR','Nom de l''entreprise',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_LIBELLE_APE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Secteur d''activité', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_LIBELLE_APE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_LIBELLE_APE','fr-FR','Secteur d''activité',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_NAME' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom du contact', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_NAME' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_NAME','fr-FR','Nom du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_QUALITE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Qualité du contact', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_QUALITE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_QUALITE','fr-FR','Qualité du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_TELEPHONE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Téléphone du contact', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_TELEPHONE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_TELEPHONE','fr-FR','Téléphone du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_EMAIL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Email du contact', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_EMAIL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_CONTACT_EMAIL','fr-FR','Email du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_ID_ELECTION' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Numéro du scrutin', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_ID_ELECTION' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_ID_ELECTION','fr-FR','Numéro du scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_TYPE_SCRUTIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Type', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_TYPE_SCRUTIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_TYPE_SCRUTIN','fr-FR','Type',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_NB_SALARIES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre d''électeurs', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_NB_SALARIES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_NB_SALARIES','fr-FR','Nombre d''électeurs',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etat d''avancement du scrutin', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_AVANCEMENT','fr-FR','Etat d''avancement du scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_DATE_1ER_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date 1er tour', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_DATE_1ER_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_DATE_1ER_TOUR','fr-FR','Date 1er tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_DATE_2EME_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date 2nd tour', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_DATE_2EME_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_DATE_2EME_TOUR','fr-FR','Date 2nd tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Statut', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_STATUT','fr-FR','Statut',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Actions', ForInit=1 where Code='ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_ENTETE_TITLE_BUTTONS','fr-FR','Actions',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_LIST_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='scrutins', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_LIST_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_LIST_LABEL','fr-FR','scrutins',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='scrutin', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_LIST_LABEL_1','fr-FR','scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les scrutins en cours', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_CONTAINER_TITLE','fr-FR','Les scrutins en cours',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_TITLE_BUTTONS_LIST' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Actions', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_TITLE_BUTTONS_LIST' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_TITLE_BUTTONS_LIST','fr-FR','Actions',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Aller sur le site de paramétrage', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_TABLEAU_PARAMETRAGE','fr-FR','Aller sur le site de paramétrage',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_DELAI_3J' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Raccourcir le délai de 3j', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_DELAI_3J' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_DELAI_3J','fr-FR','Raccourcir le délai de 3j',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_REVENIR_PHASE_1' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Revenir en phase 1', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_REVENIR_PHASE_1' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_REVENIR_PHASE_1','fr-FR','Revenir en phase 1',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_SUPPRIMER' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Supprimer le scrutin', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_SUPPRIMER' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_SUPPRIMER','fr-FR','Supprimer le scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_1ER_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Changer la date de scellement du 1er tour', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_1ER_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_1ER_TOUR','fr-FR','Changer la date de scellement du 1er tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_2ND_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Changer la date de scellement du 2nd tour', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_2ND_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_CHANGER_DATE_SCELLEMENT_2ND_TOUR','fr-FR','Changer la date de scellement du 2nd tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_6' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Réduire l''éligibilité à 6mois', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_6' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_6','fr-FR','Réduire l''éligibilité à 6mois',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_3' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Réduire l''éligibilité à 3mois', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_3' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_ELIGIBILITE_3','fr-FR','Réduire l''éligibilité à 3mois',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_NON_COLLEGIAL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Passer en mode non collégial', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_NON_COLLEGIAL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_NON_COLLEGIAL','fr-FR','Passer en mode non collégial',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SCRUTIN_SUPPRIMER_CONFIRM' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Êtes-vous sûr de vouloir supprimer ce scrutin ?', ForInit=1 where Code='ADMIN_BUTTON_SCRUTIN_SUPPRIMER_CONFIRM' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SCRUTIN_SUPPRIMER_CONFIRM','fr-FR','Êtes-vous sûr de vouloir supprimer ce scrutin ?',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_CONTACT_LIST_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='contacts', ForInit=1 where Code='ADMINISTRATION_CONTACT_LIST_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_CONTACT_LIST_LABEL','fr-FR','contacts',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_CONTACT_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='contact', ForInit=1 where Code='ADMINISTRATION_CONTACT_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_CONTACT_LIST_LABEL_1','fr-FR','contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_CONTACT_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Les contacts', ForInit=1 where Code='ADMINISTRATION_CONTACT_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_CONTACT_CONTAINER_TITLE','fr-FR','Les contacts',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom de l''entreprise', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_COMPANY','fr-FR','Nom de l''entreprise',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_FIRSTNAME' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Prénom', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_FIRSTNAME' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_FIRSTNAME','fr-FR','Prénom',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_LASTNAME' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_LASTNAME' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_LASTNAME','fr-FR','Nom',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_QUALITY' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Qualité', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_QUALITY' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_QUALITY','fr-FR','Qualité',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_EMAIL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Email', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_EMAIL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_EMAIL','fr-FR','Email',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_TELEPHONE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Téléphone', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_TELEPHONE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_TELEPHONE','fr-FR','Téléphone',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_CONTACT_ENTETE_TITLE_ADRESSE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Adresse', ForInit=1 where Code='ADMIN_CONTACT_ENTETE_TITLE_ADRESSE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_CONTACT_ENTETE_TITLE_ADRESSE','fr-FR','Adresse',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_BUTTONS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Actions', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_BUTTONS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_BUTTONS','fr-FR','Actions',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_MARQUE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Marque', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_MARQUE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_MARQUE','fr-FR','Marque',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Entreprise', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_COMPANY','fr-FR','Entreprise',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_ETAT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etat', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_ETAT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_ETAT','fr-FR','Etat',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_CODEVOTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Numéro et type de vote', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_CODEVOTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_CODEVOTE','fr-FR','Numéro et type de vote',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_PAPDATABASE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='PAPDatabase', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_PAPDATABASE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_PAPDATABASE','fr-FR','PAPDatabase',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_VERSIONAPI' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Version', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_VERSIONAPI' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_VERSIONAPI','fr-FR','Version',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Avancement', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_AVANCEMENT','fr-FR','Avancement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_QUAND' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Quand', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_QUAND' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_QUAND','fr-FR','Quand',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_SECURITE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Sécurite', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_SECURITE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_SECURITE','fr-FR','Sécurite',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_TOURLABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Tour', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_TOURLABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_TOURLABEL','fr-FR','Tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_NBLISTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de listes', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_NBLISTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_NBLISTE','fr-FR','Nombre de listes',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_NBSALARIESREELS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de salariés', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_NBSALARIESREELS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_NBSALARIESREELS','fr-FR','Nombre de salariés',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_VOTANTS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Votants', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_VOTANTS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_VOTANTS','fr-FR','Votants',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_EMARGEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Emargement', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_EMARGEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_EMARGEMENT','fr-FR','Emargement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_URL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Url', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_URL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_URL','fr-FR','Url',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTETE_TITLE_PAPWEBSITE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Site de vote', ForInit=1 where Code='ADMIN_SUPPORT_ENTETE_TITLE_PAPWEBSITE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTETE_TITLE_PAPWEBSITE','fr-FR','Site de vote',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ENTENTE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Statut', ForInit=1 where Code='ADMIN_SUPPORT_ENTENTE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ENTENTE_TITLE_STATUT','fr-FR','Statut',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Tour', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_TOUR','fr-FR','Tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_SCRUTIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Scrutin', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_SCRUTIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_SCRUTIN','fr-FR','Scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATABASE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Database', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATABASE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATABASE','fr-FR','Database',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NTOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° Tour', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NTOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NTOUR','fr-FR','N° Tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HORAIRE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Horaire', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HORAIRE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HORAIRE','fr-FR','Horaire',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDENTIFICATION_ELECTEURS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Identification Electeurs', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDENTIFICATION_ELECTEURS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDENTIFICATION_ELECTEURS','fr-FR','Identification Electeurs',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_SCELLEMENT_URNES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date Scéllement Urnes', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_SCELLEMENT_URNES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_SCELLEMENT_URNES','fr-FR','Date Scéllement Urnes',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEBUT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Début', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEBUT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEBUT','fr-FR','Début',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_FIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Fin', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_FIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_FIN','fr-FR','Fin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_AVANCEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etat d''avancement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_AVANCEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_AVANCEMENT','fr-FR','Etat d''avancement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AVANCEMENT_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Avancement Tour', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AVANCEMENT_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AVANCEMENT_TOUR','fr-FR','Avancement Tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Catégories', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES','fr-FR','Catégories',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES_REPRESENTEES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Catégories Représentées', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES_REPRESENTEES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CATEGORIES_REPRESENTEES','fr-FR','Catégories Représentées',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_DEBUT_DEPOT_LISTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date début dépôt liste', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_DEBUT_DEPOT_LISTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_DEBUT_DEPOT_LISTE','fr-FR','Date début dépôt liste',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_MAX_DEPOT_LISTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date max dépôt liste', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_MAX_DEPOT_LISTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_MAX_DEPOT_LISTE','fr-FR','Date max dépôt liste',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LIBELLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Libelle', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LIBELLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LIBELLE','fr-FR','Libelle',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DELAI_CLOSE_SCRUTIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Délai Close Scrutin', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DELAI_CLOSE_SCRUTIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DELAI_CLOSE_SCRUTIN','fr-FR','Délai Close Scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEMO' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Démo', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEMO' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DEMO','fr-FR','Démo',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPSIZE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Taille du mot de passe', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPSIZE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPSIZE','fr-FR','Taille du mot de passe',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPALPHA' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mot de passe alpha', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPALPHA' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MDPALPHA','fr-FR','Mot de passe alpha',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° du scrutin', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_IDELECTION','fr-FR','N° du scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Bureau', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU','fr-FR','Bureau',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° du bureau', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU','fr-FR','N° du bureau',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGIAL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mode collégial', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGIAL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGIAL','fr-FR','Mode collégial',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_SCELLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etape du Scellement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_SCELLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_SCELLEMENT','fr-FR','Etape du Scellement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etape du Dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAPE_DEPOUILLEMENT','fr-FR','Etape du Dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_MEMBRE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Id du membre', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_MEMBRE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_MEMBRE','fr-FR','Id du membre',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRESIDENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Présence président', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRESIDENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRESIDENT','fr-FR','Présence président',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NOM' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NOM' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NOM','fr-FR','Nom',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRENOMS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Prénoms', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRENOMS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PRENOMS','fr-FR','Prénoms',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_GENERATION_KEY' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Vérification de la Clé de génération', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_GENERATION_KEY' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_GENERATION_KEY','fr-FR','Vérification de la Clé de génération',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_SCELLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Vérification du scellement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_SCELLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_SCELLEMENT','fr-FR','Vérification du scellement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Vérification du dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CHECK_IN_DEPOUILLEMENT','fr-FR','Vérification du dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LAST_ACTION' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Dernière action', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LAST_ACTION' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_LAST_ACTION','fr-FR','Dernière action',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_COLLABORATEUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° du collaborateur', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_COLLABORATEUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_COLLABORATEUR','fr-FR','N° du collaborateur',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Clé de scellement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT','fr-FR','Clé de scellement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT_HORAIRE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Horaire de la clé de scellement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT_HORAIRE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_SCELLEMENT_HORAIRE','fr-FR','Horaire de la clé de scellement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Clé de dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT','fr-FR','Clé de dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT_HORAIRE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Horaire de la clé de dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT_HORAIRE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_CLE_DEPOUILLEMENT_HORAIRE','fr-FR','Horaire de la clé de dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PROFESSIONNEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mail professionnel', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PROFESSIONNEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PROFESSIONNEL','fr-FR','Mail professionnel',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PERSONNEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mail personnel', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PERSONNEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MAIL_PERSONNEL','fr-FR','Mail personnel',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MOBILE_PROFESSIONNEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mobile professionnel', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MOBILE_PROFESSIONNEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MOBILE_PROFESSIONNEL','fr-FR','Mobile professionnel',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MODE_TEST' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Mode Test', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MODE_TEST' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_MODE_TEST','fr-FR','Mode Test',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_NAISSANCE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date de naissance', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_NAISSANCE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_NAISSANCE','fr-FR','Date de naissance',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AGE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Age', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AGE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_AGE','fr-FR','Age',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_URNE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Urne', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_URNE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_URNE','fr-FR','Urne',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° du bureau', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_BUREAU','fr-FR','N° du bureau',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_URNE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etat urne', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_URNE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETAT_URNE','fr-FR','Etat urne',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_ETAT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date Etat', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_ETAT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_ETAT','fr-FR','Date Etat',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ACCORD' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Accord', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ACCORD' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ACCORD','fr-FR','Accord',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_LISTES_OU_QUESTIONS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de listes ou questions', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_LISTES_OU_QUESTIONS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_LISTES_OU_QUESTIONS','fr-FR','Nombre de listes ou questions',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_VOTANTS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de votants', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_VOTANTS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_VOTANTS','fr-FR','Nombre de votants',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_NON_VOTANTS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de non votants', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_NON_VOTANTS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_NON_VOTANTS','fr-FR','Nombre de non votants',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETABLISSEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etablissement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETABLISSEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ETABLISSEMENT','fr-FR','Etablissement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Collège', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COLLEGE','fr-FR','Collège',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PARTICIPATION' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Participation', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PARTICIPATION' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PARTICIPATION','fr-FR','Participation',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_EMARGEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Emargement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_EMARGEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_EMARGEMENT','fr-FR','Emargement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BULLETINS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Bulletins', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BULLETINS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BULLETINS','fr-FR','Bulletins',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COHERENCE_VOTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Cohérence Vote', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COHERENCE_VOTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_COHERENCE_VOTE','fr-FR','Cohérence Vote',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_VOTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date de vote', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_VOTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_DATE_VOTE','fr-FR','Date de vote',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BLANCS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Blancs', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BLANCS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BLANCS','fr-FR','Blancs',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NULS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nuls', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NULS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NULS','fr-FR','Nuls',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PB_BULLETINS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Problème bulletins', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PB_BULLETINS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_PB_BULLETINS','fr-FR','Problème bulletins',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Quorum', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM','fr-FR','Quorum',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM_ATTEINT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Quorum atteint', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM_ATTEINT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_QUORUM_ATTEINT','fr-FR','Quorum atteint',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU_MEMBRES_ACTIONS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Actions des membres du bureau', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU_MEMBRES_ACTIONS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_BUREAU_MEMBRES_ACTIONS','fr-FR','Actions des membres du bureau',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_SCELLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de scellement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_SCELLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_SCELLEMENT','fr-FR','Nombre de scellement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_NB_DEPOUILLEMENT','fr-FR','Nombre de dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_VOTE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Vote', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_VOTE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_VOTE','fr-FR','Vote',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_URNE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° Urne', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_URNE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_URNE','fr-FR','N° Urne',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° Tour', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR','fr-FR','N° Tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR_URNE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='N° Tour Urne', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR_URNE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_ID_TOUR_URNE','fr-FR','N° Tour Urne',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HASH_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Hash du dépouillement', ForInit=1 where Code='ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HASH_DEPOUILLEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SUPPORT_ANALYSE_ENTETE_TITLE_HASH_DEPOUILLEMENT','fr-FR','Hash du dépouillement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SUPPORT_REFRESH' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Rafraichir', ForInit=1 where Code='ADMIN_BUTTON_SUPPORT_REFRESH' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SUPPORT_REFRESH','fr-FR','Rafraichir',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_BUTTON_SUPPORT_DEROULEMENT_SCRUTIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Déroulement du scrutin', ForInit=1 where Code='ADMIN_BUTTON_SUPPORT_DEROULEMENT_SCRUTIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_BUTTON_SUPPORT_DEROULEMENT_SCRUTIN','fr-FR','Déroulement du scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DATE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DATE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DATE','fr-FR','Date',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PLANNING' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Planning', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PLANNING' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PLANNING','fr-FR','Planning',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS_POTENTIELLES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Elections Potentielles', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS_POTENTIELLES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS_POTENTIELLES','fr-FR','Elections Potentielles',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Elections Réalisées', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTIONS','fr-FR','Elections Réalisées',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_POTENTIELS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Electeurs Potentiels', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_POTENTIELS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_POTENTIELS','fr-FR','Electeurs Potentiels',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_PREVUS' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Electeurs Prévus', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_PREVUS' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_PREVUS','fr-FR','Electeurs Prévus',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_CONNECTES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Electeurs Connectés', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_CONNECTES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_ELECTEURS_CONNECTES','fr-FR','Electeurs Connectés',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PERCENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='% Electeurs connectés par rapports aux prévus', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PERCENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_PERCENT','fr-FR','% Electeurs connectés par rapports aux prévus',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DEMANDE_DE_CODE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre de demande de code', ForInit=1 where Code='ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DEMANDE_DE_CODE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTINS_POTENTIELS_ENTETE_TITLE_DEMANDE_DE_CODE','fr-FR','Nombre de demande de code',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='dates', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL','fr-FR','dates',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='date', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL_1' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL_1','fr-FR','date',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Le planning à venir', ForInit=1 where Code='ADMINISTRATION_SCRUTIN_POTENTIEL_CONTAINER_TITLE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMINISTRATION_SCRUTIN_POTENTIEL_CONTAINER_TITLE','fr-FR','Le planning à venir',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_DOWNLOAD_BUTTON_LABEL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Télécharger …', ForInit=1 where Code='ADMIN_DOWNLOAD_BUTTON_LABEL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_DOWNLOAD_BUTTON_LABEL','fr-FR','Télécharger …',1,null)
if exists (select * from DICTIONNAIRE where Code='FICHIER_ADMINISTRATION_EXPORT_1' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Contacts', ForInit=0 where Code='FICHIER_ADMINISTRATION_EXPORT_1' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('FICHIER_ADMINISTRATION_EXPORT_1','fr-FR','Contacts',0,null)
if exists (select * from DICTIONNAIRE where Code='FICHIER_ADMINISTRATION_EXPORT_2' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Contacts au format La Poste', ForInit=0 where Code='FICHIER_ADMINISTRATION_EXPORT_2' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('FICHIER_ADMINISTRATION_EXPORT_2','fr-FR','Contacts au format La Poste',0,null)
if exists (select * from DICTIONNAIRE where Code='FICHIER_ADMINISTRATION_EXPORT_3' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Contacts newsletter', ForInit=0 where Code='FICHIER_ADMINISTRATION_EXPORT_3' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('FICHIER_ADMINISTRATION_EXPORT_3','fr-FR','Contacts newsletter',0,null)
if exists (select * from DICTIONNAIRE where Code='FICHIER_ADMINISTRATION_EXPORT_4' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Liste des marques blanches', ForInit=0 where Code='FICHIER_ADMINISTRATION_EXPORT_4' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('FICHIER_ADMINISTRATION_EXPORT_4','fr-FR','Liste des marques blanches',0,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nom de l''entreprise', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_COMPANY' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_COMPANY','fr-FR','Nom de l''entreprise',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_TYPE_SCRUTIN' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Type de scrutin', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_TYPE_SCRUTIN' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_TYPE_SCRUTIN','fr-FR','Type de scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_NB_SALARIES' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Nombre d''employés', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_NB_SALARIES' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_NB_SALARIES','fr-FR','Nombre d''employés',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Etat d''avancement', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_AVANCEMENT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_AVANCEMENT','fr-FR','Etat d''avancement',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_1ER_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date 1er tour', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_1ER_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_1ER_TOUR','fr-FR','Date 1er tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_2EME_TOUR' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Date 2nd tour', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_2EME_TOUR' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_DATE_2EME_TOUR','fr-FR','Date 2nd tour',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_EMAIL' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Email du contact', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_EMAIL' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_EMAIL','fr-FR','Email du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_NAME' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Prénom et nom du contact', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_NAME' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_NAME','fr-FR','Prénom et nom du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_TELEPHONE' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Téléphone du contact', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_TELEPHONE' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_CONTACT_TELEPHONE','fr-FR','Téléphone du contact',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_ID_ELECTION' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Numéro du scrutin', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_ID_ELECTION' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_ID_ELECTION','fr-FR','Numéro du scrutin',1,null)
if exists (select * from DICTIONNAIRE where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null) update DICTIONNAIRE set date=getdate(),Valeur='Statut de l''élection', ForInit=1 where Code='ADMIN_SCRUTIN_MB_ENTETE_TITLE_STATUT' and Culture='fr-FR' and CodeVote is null else insert DICTIONNAIRE(Code,Culture,Valeur,ForInit,CodeVote) values ('ADMIN_SCRUTIN_MB_ENTETE_TITLE_STATUT','fr-FR','Statut de l''élection',1,null)

COMMIT
GO