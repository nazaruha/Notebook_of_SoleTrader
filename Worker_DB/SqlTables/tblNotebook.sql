IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tblNotebook]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE [dbo].[tblNotebook](
  [Id] [int] IDENTITY PRIMARY KEY NOT NULL,
  [Date] [date] NOT NULL,
  [ProductId] [int] NOT NULL,
  [ManufacturerId] [int] NOT NULL,
  [Count] [int] NOT NULL,
  [TotalSum] [int] NOT NULL,
  [CustomerId] [int] NOT NULL,
  [Discount] [int] NULL,

  CONSTRAINT [FK_tblNotebook_tblCustomers] FOREIGN KEY([CustomerId])
   REFERENCES [dbo].[tblCustomers] ([Id]),

  CONSTRAINT [FK_tblNotebook_tblManufacturers] FOREIGN KEY([ManufacturerId])
   REFERENCES [dbo].[tblManufacturers] ([Id]),

  CONSTRAINT [FK_tblNotebook_tblGroceries] FOREIGN KEY([ProductId])
   REFERENCES [dbo].[tblGroceries] ([Id]),

);'