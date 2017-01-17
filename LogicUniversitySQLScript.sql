
CREATE DATABASE [LogicUniversity]
 
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nchar](10) NOT NULL,
	[CategoryName] [nchar](20) NULL,
	[Remarks] [nchar](10) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CollectionPoint]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionPoint](
	[CollectionPointID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionPoint] [nchar](30) NOT NULL,
 CONSTRAINT [PK_CollectionPoint] PRIMARY KEY CLUSTERED 
(
	[CollectionPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DeparmentCode] [nchar](10) NOT NULL,
	[DepartmentName] [nchar](20) NOT NULL,
	[ContactName] [nchar](20) NULL,
	[DepartmentPhone] [nchar](10) NULL,
	[DepartmentFax] [nchar](10) NULL,
	[HodID] [int] NULL,
	[CollectionPointID] [int] NULL,
	[RepresentativeID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disbursement]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disbursement](
	[DisbursementID] [int] IDENTITY(1,1) NOT NULL,
	[DisbursementNumber] [nchar](20) NOT NULL,
	[DisbursementDate] [date] NULL,
	[Receiver] [int] NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Disbursement] PRIMARY KEY CLUSTERED 
(
	[DisbursementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[BaseItemID] [int] IDENTITY(1,1) NOT NULL,
	[BaseItemCode] [nchar](15) NOT NULL,
	[BaseItemName] [nchar](30) NULL,
	[Description] [nchar](50) NULL,
	[UOM] [nchar](10) NULL,
	[BasePrice] [float] NULL,
	[Status] [nchar](10) NULL,
	[CategoryID] [int] NULL,
	[ReorderLevel] [int] NULL,
	[ReorderQuantity] [int] NULL,
 CONSTRAINT [PK_BaseItem] PRIMARY KEY CLUSTERED 
(
	[BaseItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] NULL,
	[Type] [nchar](10) NULL,
	[Description] [nchar](20) NULL,
	[SenderUserID] [int] NULL,
	[ReciverUserID] [int] NULL,
	[status] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[PuchaseOrderNo] [nchar](15) NOT NULL,
	[OrderDate] [date] NULL,
	[DeliveryAddress] [nchar](20) NULL,
	[POStatus] [nchar](10) NULL,
	[SupplierID] [int] NULL,
	[OrderEmpID] [int] NULL,
	[DONumber] [nchar](20) NULL,
	[PORemark] [nchar](10) NULL,
	[ExpectedDeliveryDate] [date] NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderItem]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderItem](
	[PurchaeOrderItemID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[RequestedQuantity] [int] NULL,
	[ActualQuantity] [int] NULL,
	[ReceivedQuantity] [int] NULL,
	[UnitPrice] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisition](
	[ReqID] [int] IDENTITY(1,1) NOT NULL,
	[ReqNumber] [nchar](10) NOT NULL,
	[RequesterID] [int] NOT NULL,
	[ReqDate] [date] NOT NULL,
	[Status] [nchar](10) NULL,
	[ApprovedRejectedByID] [int] NULL,
	[RecieveByID] [int] NULL,
	[DapartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED 
(
	[ReqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequisitionItem]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionItem](
	[ReqItemID] [int] NOT NULL,
	[ReqID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[NeededQuantity] [int] NULL,
	[RetirevedQuantity] [int] NULL,
	[DisbursedQuantity] [int] NULL,
	[DisbursementID] [int] NULL,
	[RetrievalID] [int] NULL,
	[IsOutstanding] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Retrieval]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retrieval](
	[RetrievalID] [int] IDENTITY(1,1) NOT NULL,
	[RetrievalNumber] [nchar](20) NOT NULL,
	[RetrievalDate] [date] NULL,
	[Retriever] [int] NULL,
 CONSTRAINT [PK_Retrieval] PRIMARY KEY CLUSTERED 
(
	[RetrievalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [nchar](10) NOT NULL,
	[RoleName] [nchar](30) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockAdjustment]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAdjustment](
	[StockAdjustmentID] [int] IDENTITY(1,1) NOT NULL,
	[SockAdjustmentNumber] [nchar](20) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_StockAdjustment] PRIMARY KEY CLUSTERED 
(
	[StockAdjustmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockAdjustmentItem]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAdjustmentItem](
	[StockAdjustmentItemID] [int] IDENTITY(1,1) NOT NULL,
	[StockAdjustmentID] [int] NOT NULL,
	[ItemID] [int] NULL,
	[Status] [nchar](20) NULL,
	[AdjustType] [nchar](20) NULL,
	[CountQuantity] [int] NULL,
	[CountPerson] [nchar](30) NULL,
	[CountDate] [date] NULL,
	[Remark] [nchar](60) NULL,
	[AdjustQuantity] [int] NULL,
 CONSTRAINT [PK_StockAdjustmentItem] PRIMARY KEY CLUSTERED 
(
	[StockAdjustmentItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockCard]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCard](
	[ItemID] [int] NOT NULL,
	[OnHandQuantity] [int] NULL,
	[Remarks] [nchar](10) NULL,
	[BinNumber] [nchar](10) NULL,
	[StockCardID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StockCard_1] PRIMARY KEY CLUSTERED 
(
	[StockCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nchar](10) NULL,
	[SupplierName] [nchar](20) NULL,
	[SupplierContact] [nchar](15) NULL,
	[SupplierPhone] [nchar](10) NULL,
	[SupplierFax] [nchar](10) NULL,
	[SupplierAddress] [nchar](40) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierItem]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierItem](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[BaseItemID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Price] [nchar](10) NULL,
	[ActiveSupplier] [bit] NULL,
	[SupplierPriority] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 17-Jan-17 3:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](20) NULL,
	[FirstName] [nchar](10) NULL,
	[LastName] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nchar](15) NULL,
	[Address] [nchar](25) NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [DepartmentCode_Unique]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [DepartmentCode_Unique] ON [dbo].[Department]
(
	[DeparmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RecieverID]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_RecieverID] ON [dbo].[Notification]
(
	[ReciverUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SenderUserID]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SenderUserID] ON [dbo].[Notification]
(
	[SenderUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ReqNumber_Unique]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [ReqNumber_Unique] ON [dbo].[Requisition]
(
	[ReqNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_StockAdjustmentNumber]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_StockAdjustmentNumber] ON [dbo].[StockAdjustment]
(
	[SockAdjustmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RoleID]    Script Date: 17-Jan-17 3:23:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_RoleID] ON [dbo].[User]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_CollectionPoint] FOREIGN KEY([CollectionPointID])
REFERENCES [dbo].[CollectionPoint] ([CollectionPointID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_CollectionPoint]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Category]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([SenderUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([ReciverUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[SupplierItem] ([ItemId])
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_Item]
GO
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder]
GO
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_Department] FOREIGN KEY([DapartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_Department]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Disbursement] FOREIGN KEY([DisbursementID])
REFERENCES [dbo].[Disbursement] ([DisbursementID])
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Disbursement]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[SupplierItem] ([ItemId])
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Item]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Requisition] FOREIGN KEY([ReqID])
REFERENCES [dbo].[Requisition] ([ReqID])
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Requisition]
GO
ALTER TABLE [dbo].[RequisitionItem]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionItem_Retrieval] FOREIGN KEY([RetrievalID])
REFERENCES [dbo].[Retrieval] ([RetrievalID])
GO
ALTER TABLE [dbo].[RequisitionItem] CHECK CONSTRAINT [FK_RequisitionItem_Retrieval]
GO
ALTER TABLE [dbo].[StockAdjustmentItem]  WITH CHECK ADD  CONSTRAINT [FK_StockAdjustmentItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[SupplierItem] ([ItemId])
GO
ALTER TABLE [dbo].[StockAdjustmentItem] CHECK CONSTRAINT [FK_StockAdjustmentItem_Item]
GO
ALTER TABLE [dbo].[StockAdjustmentItem]  WITH CHECK ADD  CONSTRAINT [FK_StockAdjustmentItem_StockAdjustment] FOREIGN KEY([StockAdjustmentID])
REFERENCES [dbo].[StockAdjustment] ([StockAdjustmentID])
GO
ALTER TABLE [dbo].[StockAdjustmentItem] CHECK CONSTRAINT [FK_StockAdjustmentItem_StockAdjustment]
GO
ALTER TABLE [dbo].[StockCard]  WITH CHECK ADD  CONSTRAINT [FK_StockCard_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[SupplierItem] ([ItemId])
GO
ALTER TABLE [dbo].[StockCard] CHECK CONSTRAINT [FK_StockCard_Item]
GO
ALTER TABLE [dbo].[SupplierItem]  WITH CHECK ADD  CONSTRAINT [FK_BaseItem] FOREIGN KEY([BaseItemID])
REFERENCES [dbo].[Item] ([BaseItemID])
GO
ALTER TABLE [dbo].[SupplierItem] CHECK CONSTRAINT [FK_BaseItem]
GO
ALTER TABLE [dbo].[SupplierItem]  WITH CHECK ADD  CONSTRAINT [FK_Item_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierItem] CHECK CONSTRAINT [FK_Item_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [LogicUniversity] SET  READ_WRITE 
GO
