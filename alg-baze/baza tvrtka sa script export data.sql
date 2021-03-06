USE [tvrtka]
GO
/****** Object:  Table [dbo].[Odjeli]    Script Date: 25.1.2021. 18:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odjeli](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nchar](10) NOT NULL,
	[Opis] [nvarchar](50) NULL,
 CONSTRAINT [PK_Odjeli] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skladista]    Script Date: 25.1.2021. 18:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skladista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mjesto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Skladista] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposlenici]    Script Date: 25.1.2021. 18:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposlenici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IDSefa] [int] NULL,
	[IdOdjela] [int] NULL,
	[Skladiste_id] [int] NOT NULL,
 CONSTRAINT [PK_Zaposlenici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Odjeli] ON 

INSERT [dbo].[Odjeli] ([ID], [Naziv], [Opis]) VALUES (1, N'Prodaja   ', N'Prodajemo maglu')
INSERT [dbo].[Odjeli] ([ID], [Naziv], [Opis]) VALUES (2, N'Marketing ', N'Reklamiramo maglu')
INSERT [dbo].[Odjeli] ([ID], [Naziv], [Opis]) VALUES (3, N'Skladiste ', N'Skladište za svašta')
SET IDENTITY_INSERT [dbo].[Odjeli] OFF
SET IDENTITY_INSERT [dbo].[Skladista] ON 

INSERT [dbo].[Skladista] ([id], [mjesto]) VALUES (1, N'Zagreb')
INSERT [dbo].[Skladista] ([id], [mjesto]) VALUES (2, N'Sisak')
INSERT [dbo].[Skladista] ([id], [mjesto]) VALUES (3, N'Sisak')
INSERT [dbo].[Skladista] ([id], [mjesto]) VALUES (4, N'Rijeka')
SET IDENTITY_INSERT [dbo].[Skladista] OFF
SET IDENTITY_INSERT [dbo].[Zaposlenici] ON 

INSERT [dbo].[Zaposlenici] ([ID], [Ime], [Prezime], [Adresa], [Email], [IDSefa], [IdOdjela], [Skladiste_id]) VALUES (1, N'Pero', N'Peric', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Zaposlenici] ([ID], [Ime], [Prezime], [Adresa], [Email], [IDSefa], [IdOdjela], [Skladiste_id]) VALUES (2, N'Djuro', N'Djuric', N'Neka', NULL, 1, 2, 1)
INSERT [dbo].[Zaposlenici] ([ID], [Ime], [Prezime], [Adresa], [Email], [IDSefa], [IdOdjela], [Skladiste_id]) VALUES (3, N'Miro', N'Miric', NULL, NULL, 2, 3, 2)
INSERT [dbo].[Zaposlenici] ([ID], [Ime], [Prezime], [Adresa], [Email], [IDSefa], [IdOdjela], [Skladiste_id]) VALUES (4, N'Laura', N'Larci', NULL, NULL, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Zaposlenici] OFF
ALTER TABLE [dbo].[Zaposlenici]  WITH CHECK ADD  CONSTRAINT [FK_Zaposlenici_Odjeli] FOREIGN KEY([IdOdjela])
REFERENCES [dbo].[Odjeli] ([ID])
GO
ALTER TABLE [dbo].[Zaposlenici] CHECK CONSTRAINT [FK_Zaposlenici_Odjeli]
GO
ALTER TABLE [dbo].[Zaposlenici]  WITH CHECK ADD  CONSTRAINT [FK_Zaposlenici_Skladista] FOREIGN KEY([Skladiste_id])
REFERENCES [dbo].[Skladista] ([id])
GO
ALTER TABLE [dbo].[Zaposlenici] CHECK CONSTRAINT [FK_Zaposlenici_Skladista]
GO
ALTER TABLE [dbo].[Zaposlenici]  WITH CHECK ADD  CONSTRAINT [FK_Zaposlenici_Zaposlenici] FOREIGN KEY([IDSefa])
REFERENCES [dbo].[Zaposlenici] ([ID])
GO
ALTER TABLE [dbo].[Zaposlenici] CHECK CONSTRAINT [FK_Zaposlenici_Zaposlenici]
GO
ALTER TABLE [dbo].[Skladista]  WITH CHECK ADD  CONSTRAINT [CK_Skladista] CHECK  (([mjesto]='Sisak' OR [mjesto]='Zagreb' OR [mjesto]='Rijeka'))
GO
ALTER TABLE [dbo].[Skladista] CHECK CONSTRAINT [CK_Skladista]
GO
