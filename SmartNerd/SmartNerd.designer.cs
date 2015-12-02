﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34209
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartNerd
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="db_jmcdonne")]
	public partial class SmartNerdDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertCategory(DataModels.Category instance);
    partial void UpdateCategory(DataModels.Category instance);
    partial void DeleteCategory(DataModels.Category instance);
    partial void InsertCategoryEntry(DataModels.CategoryEntry instance);
    partial void UpdateCategoryEntry(DataModels.CategoryEntry instance);
    partial void DeleteCategoryEntry(DataModels.CategoryEntry instance);
    partial void InsertOrderProduct(DataModels.OrderProduct instance);
    partial void UpdateOrderProduct(DataModels.OrderProduct instance);
    partial void DeleteOrderProduct(DataModels.OrderProduct instance);
    partial void InsertOrder(DataModels.Order instance);
    partial void UpdateOrder(DataModels.Order instance);
    partial void DeleteOrder(DataModels.Order instance);
    partial void InsertProduct(DataModels.Product instance);
    partial void UpdateProduct(DataModels.Product instance);
    partial void DeleteProduct(DataModels.Product instance);
    #endregion
		
		public SmartNerdDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public SmartNerdDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SmartNerdDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SmartNerdDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SmartNerdDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<DataModels.Category> Categories
		{
			get
			{
				return this.GetTable<DataModels.Category>();
			}
		}
		
		public System.Data.Linq.Table<DataModels.CategoryEntry> CategoryEntries
		{
			get
			{
				return this.GetTable<DataModels.CategoryEntry>();
			}
		}
		
		public System.Data.Linq.Table<DataModels.OrderProduct> OrderProducts
		{
			get
			{
				return this.GetTable<DataModels.OrderProduct>();
			}
		}
		
		public System.Data.Linq.Table<DataModels.Order> Orders
		{
			get
			{
				return this.GetTable<DataModels.Order>();
			}
		}
		
		public System.Data.Linq.Table<DataModels.Product> Products
		{
			get
			{
				return this.GetTable<DataModels.Product>();
			}
		}
	}
}
namespace DataModels
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="jmcdonne.Category")]
	public partial class Category : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _CategoryID;
		
		private string _Name;
		
		private EntitySet<CategoryEntry> _CategoryEntries;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCategoryIDChanging(int value);
    partial void OnCategoryIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public Category()
		{
			this._CategoryEntries = new EntitySet<CategoryEntry>(new Action<CategoryEntry>(this.attach_CategoryEntries), new Action<CategoryEntry>(this.detach_CategoryEntries));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CategoryID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int CategoryID
		{
			get
			{
				return this._CategoryID;
			}
			set
			{
				if ((this._CategoryID != value))
				{
					this.OnCategoryIDChanging(value);
					this.SendPropertyChanging();
					this._CategoryID = value;
					this.SendPropertyChanged("CategoryID");
					this.OnCategoryIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Category_CategoryEntry", Storage="_CategoryEntries", ThisKey="CategoryID", OtherKey="CategoryID")]
		public EntitySet<CategoryEntry> CategoryEntries
		{
			get
			{
				return this._CategoryEntries;
			}
			set
			{
				this._CategoryEntries.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_CategoryEntries(CategoryEntry entity)
		{
			this.SendPropertyChanging();
			entity.Category = this;
		}
		
		private void detach_CategoryEntries(CategoryEntry entity)
		{
			this.SendPropertyChanging();
			entity.Category = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="jmcdonne.CategoryEntry")]
	public partial class CategoryEntry : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _CategoryEntryID;
		
		private int _CategoryID;
		
		private int _ProductID;
		
		private EntityRef<Category> _Category;
		
		private EntityRef<Product> _Product;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCategoryEntryIDChanging(int value);
    partial void OnCategoryEntryIDChanged();
    partial void OnCategoryIDChanging(int value);
    partial void OnCategoryIDChanged();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    #endregion
		
		public CategoryEntry()
		{
			this._Category = default(EntityRef<Category>);
			this._Product = default(EntityRef<Product>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CategoryEntryID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int CategoryEntryID
		{
			get
			{
				return this._CategoryEntryID;
			}
			set
			{
				if ((this._CategoryEntryID != value))
				{
					this.OnCategoryEntryIDChanging(value);
					this.SendPropertyChanging();
					this._CategoryEntryID = value;
					this.SendPropertyChanged("CategoryEntryID");
					this.OnCategoryEntryIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CategoryID", DbType="Int NOT NULL")]
		public int CategoryID
		{
			get
			{
				return this._CategoryID;
			}
			set
			{
				if ((this._CategoryID != value))
				{
					if (this._Category.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnCategoryIDChanging(value);
					this.SendPropertyChanging();
					this._CategoryID = value;
					this.SendPropertyChanged("CategoryID");
					this.OnCategoryIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int NOT NULL")]
		public int ProductID
		{
			get
			{
				return this._ProductID;
			}
			set
			{
				if ((this._ProductID != value))
				{
					if (this._Product.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnProductIDChanging(value);
					this.SendPropertyChanging();
					this._ProductID = value;
					this.SendPropertyChanged("ProductID");
					this.OnProductIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Category_CategoryEntry", Storage="_Category", ThisKey="CategoryID", OtherKey="CategoryID", IsForeignKey=true)]
		public Category Category
		{
			get
			{
				return this._Category.Entity;
			}
			set
			{
				Category previousValue = this._Category.Entity;
				if (((previousValue != value) 
							|| (this._Category.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Category.Entity = null;
						previousValue.CategoryEntries.Remove(this);
					}
					this._Category.Entity = value;
					if ((value != null))
					{
						value.CategoryEntries.Add(this);
						this._CategoryID = value.CategoryID;
					}
					else
					{
						this._CategoryID = default(int);
					}
					this.SendPropertyChanged("Category");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_CategoryEntry", Storage="_Product", ThisKey="ProductID", OtherKey="ProductID", IsForeignKey=true)]
		public Product Product
		{
			get
			{
				return this._Product.Entity;
			}
			set
			{
				Product previousValue = this._Product.Entity;
				if (((previousValue != value) 
							|| (this._Product.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Product.Entity = null;
						previousValue.CategoryEntries.Remove(this);
					}
					this._Product.Entity = value;
					if ((value != null))
					{
						value.CategoryEntries.Add(this);
						this._ProductID = value.ProductID;
					}
					else
					{
						this._ProductID = default(int);
					}
					this.SendPropertyChanged("Product");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="jmcdonne.OrderProduct")]
	public partial class OrderProduct : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _OrderProductID;
		
		private int _ProductID;
		
		private int _OrderID;
		
		private int _Quantity;
		
		private EntityRef<Order> _Order;
		
		private EntityRef<Product> _Product;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderProductIDChanging(int value);
    partial void OnOrderProductIDChanged();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    partial void OnOrderIDChanging(int value);
    partial void OnOrderIDChanged();
    partial void OnQuantityChanging(int value);
    partial void OnQuantityChanged();
    #endregion
		
		public OrderProduct()
		{
			this._Order = default(EntityRef<Order>);
			this._Product = default(EntityRef<Product>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderProductID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int OrderProductID
		{
			get
			{
				return this._OrderProductID;
			}
			set
			{
				if ((this._OrderProductID != value))
				{
					this.OnOrderProductIDChanging(value);
					this.SendPropertyChanging();
					this._OrderProductID = value;
					this.SendPropertyChanged("OrderProductID");
					this.OnOrderProductIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int NOT NULL")]
		public int ProductID
		{
			get
			{
				return this._ProductID;
			}
			set
			{
				if ((this._ProductID != value))
				{
					if (this._Product.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnProductIDChanging(value);
					this.SendPropertyChanging();
					this._ProductID = value;
					this.SendPropertyChanged("ProductID");
					this.OnProductIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", DbType="Int NOT NULL")]
		public int OrderID
		{
			get
			{
				return this._OrderID;
			}
			set
			{
				if ((this._OrderID != value))
				{
					if (this._Order.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnOrderIDChanging(value);
					this.SendPropertyChanging();
					this._OrderID = value;
					this.SendPropertyChanged("OrderID");
					this.OnOrderIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Quantity", DbType="Int NOT NULL")]
		public int Quantity
		{
			get
			{
				return this._Quantity;
			}
			set
			{
				if ((this._Quantity != value))
				{
					this.OnQuantityChanging(value);
					this.SendPropertyChanging();
					this._Quantity = value;
					this.SendPropertyChanged("Quantity");
					this.OnQuantityChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Order_OrderProduct", Storage="_Order", ThisKey="OrderID", OtherKey="OrderID", IsForeignKey=true)]
		public Order Order
		{
			get
			{
				return this._Order.Entity;
			}
			set
			{
				Order previousValue = this._Order.Entity;
				if (((previousValue != value) 
							|| (this._Order.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Order.Entity = null;
						previousValue.OrderProducts.Remove(this);
					}
					this._Order.Entity = value;
					if ((value != null))
					{
						value.OrderProducts.Add(this);
						this._OrderID = value.OrderID;
					}
					else
					{
						this._OrderID = default(int);
					}
					this.SendPropertyChanged("Order");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_OrderProduct", Storage="_Product", ThisKey="ProductID", OtherKey="ProductID", IsForeignKey=true)]
		public Product Product
		{
			get
			{
				return this._Product.Entity;
			}
			set
			{
				Product previousValue = this._Product.Entity;
				if (((previousValue != value) 
							|| (this._Product.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Product.Entity = null;
						previousValue.OrderProducts.Remove(this);
					}
					this._Product.Entity = value;
					if ((value != null))
					{
						value.OrderProducts.Add(this);
						this._ProductID = value.ProductID;
					}
					else
					{
						this._ProductID = default(int);
					}
					this.SendPropertyChanged("Product");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="jmcdonne.Orders")]
	public partial class Order : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _OrderID;
		
		private int _AccountID;
		
		private System.Guid _CartID;
		
		private System.Nullable<decimal> _OrderTotal;
		
		private System.DateTime _DateCreated;
		
		private System.Nullable<System.DateTime> _DatePlaced;
		
		private EntitySet<OrderProduct> _OrderProducts;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderIDChanging(int value);
    partial void OnOrderIDChanged();
    partial void OnAccountIDChanging(int value);
    partial void OnAccountIDChanged();
    partial void OnCartIDChanging(System.Guid value);
    partial void OnCartIDChanged();
    partial void OnOrderTotalChanging(System.Nullable<decimal> value);
    partial void OnOrderTotalChanged();
    partial void OnDateCreatedChanging(System.DateTime value);
    partial void OnDateCreatedChanged();
    partial void OnDatePlacedChanging(System.Nullable<System.DateTime> value);
    partial void OnDatePlacedChanged();
    #endregion
		
		public Order()
		{
			this._OrderProducts = new EntitySet<OrderProduct>(new Action<OrderProduct>(this.attach_OrderProducts), new Action<OrderProduct>(this.detach_OrderProducts));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int OrderID
		{
			get
			{
				return this._OrderID;
			}
			set
			{
				if ((this._OrderID != value))
				{
					this.OnOrderIDChanging(value);
					this.SendPropertyChanging();
					this._OrderID = value;
					this.SendPropertyChanged("OrderID");
					this.OnOrderIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AccountID", DbType="Int NOT NULL")]
		public int AccountID
		{
			get
			{
				return this._AccountID;
			}
			set
			{
				if ((this._AccountID != value))
				{
					this.OnAccountIDChanging(value);
					this.SendPropertyChanging();
					this._AccountID = value;
					this.SendPropertyChanged("AccountID");
					this.OnAccountIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CartID", AutoSync=AutoSync.OnInsert, DbType="UniqueIdentifier NOT NULL", IsDbGenerated=true)]
		public System.Guid CartID
		{
			get
			{
				return this._CartID;
			}
			set
			{
				if ((this._CartID != value))
				{
					this.OnCartIDChanging(value);
					this.SendPropertyChanging();
					this._CartID = value;
					this.SendPropertyChanged("CartID");
					this.OnCartIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderTotal", DbType="Decimal(18,0)")]
		public System.Nullable<decimal> OrderTotal
		{
			get
			{
				return this._OrderTotal;
			}
			set
			{
				if ((this._OrderTotal != value))
				{
					this.OnOrderTotalChanging(value);
					this.SendPropertyChanging();
					this._OrderTotal = value;
					this.SendPropertyChanged("OrderTotal");
					this.OnOrderTotalChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateCreated", AutoSync=AutoSync.OnInsert, DbType="DateTime NOT NULL", IsDbGenerated=true)]
		public System.DateTime DateCreated
		{
			get
			{
				return this._DateCreated;
			}
			set
			{
				if ((this._DateCreated != value))
				{
					this.OnDateCreatedChanging(value);
					this.SendPropertyChanging();
					this._DateCreated = value;
					this.SendPropertyChanged("DateCreated");
					this.OnDateCreatedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DatePlaced", DbType="DateTime", IsDbGenerated=true)]
		public System.Nullable<System.DateTime> DatePlaced
		{
			get
			{
				return this._DatePlaced;
			}
			set
			{
				if ((this._DatePlaced != value))
				{
					this.OnDatePlacedChanging(value);
					this.SendPropertyChanging();
					this._DatePlaced = value;
					this.SendPropertyChanged("DatePlaced");
					this.OnDatePlacedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Order_OrderProduct", Storage="_OrderProducts", ThisKey="OrderID", OtherKey="OrderID")]
		public EntitySet<OrderProduct> OrderProducts
		{
			get
			{
				return this._OrderProducts;
			}
			set
			{
				this._OrderProducts.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_OrderProducts(OrderProduct entity)
		{
			this.SendPropertyChanging();
			entity.Order = this;
		}
		
		private void detach_OrderProducts(OrderProduct entity)
		{
			this.SendPropertyChanging();
			entity.Order = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="jmcdonne.Product")]
	public partial class Product : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ProductID;
		
		private string _Name;
		
		private string _Description;
		
		private decimal _Price;
		
		private System.DateTime _DateCreated;
		
		private EntitySet<CategoryEntry> _CategoryEntries;
		
		private EntitySet<OrderProduct> _OrderProducts;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnPriceChanging(decimal value);
    partial void OnPriceChanged();
    partial void OnDateCreatedChanging(System.DateTime value);
    partial void OnDateCreatedChanged();
    #endregion
		
		public Product()
		{
			this._CategoryEntries = new EntitySet<CategoryEntry>(new Action<CategoryEntry>(this.attach_CategoryEntries), new Action<CategoryEntry>(this.detach_CategoryEntries));
			this._OrderProducts = new EntitySet<OrderProduct>(new Action<OrderProduct>(this.attach_OrderProducts), new Action<OrderProduct>(this.detach_OrderProducts));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int ProductID
		{
			get
			{
				return this._ProductID;
			}
			set
			{
				if ((this._ProductID != value))
				{
					this.OnProductIDChanging(value);
					this.SendPropertyChanging();
					this._ProductID = value;
					this.SendPropertyChanged("ProductID");
					this.OnProductIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this.OnDescriptionChanging(value);
					this.SendPropertyChanging();
					this._Description = value;
					this.SendPropertyChanged("Description");
					this.OnDescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="Decimal(18,0) NOT NULL")]
		public decimal Price
		{
			get
			{
				return this._Price;
			}
			set
			{
				if ((this._Price != value))
				{
					this.OnPriceChanging(value);
					this.SendPropertyChanging();
					this._Price = value;
					this.SendPropertyChanged("Price");
					this.OnPriceChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateCreated", AutoSync=AutoSync.OnInsert, DbType="DateTime NOT NULL", IsDbGenerated=true)]
		public System.DateTime DateCreated
		{
			get
			{
				return this._DateCreated;
			}
			set
			{
				if ((this._DateCreated != value))
				{
					this.OnDateCreatedChanging(value);
					this.SendPropertyChanging();
					this._DateCreated = value;
					this.SendPropertyChanged("DateCreated");
					this.OnDateCreatedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_CategoryEntry", Storage="_CategoryEntries", ThisKey="ProductID", OtherKey="ProductID")]
		public EntitySet<CategoryEntry> CategoryEntries
		{
			get
			{
				return this._CategoryEntries;
			}
			set
			{
				this._CategoryEntries.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_OrderProduct", Storage="_OrderProducts", ThisKey="ProductID", OtherKey="ProductID")]
		public EntitySet<OrderProduct> OrderProducts
		{
			get
			{
				return this._OrderProducts;
			}
			set
			{
				this._OrderProducts.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_CategoryEntries(CategoryEntry entity)
		{
			this.SendPropertyChanging();
			entity.Product = this;
		}
		
		private void detach_CategoryEntries(CategoryEntry entity)
		{
			this.SendPropertyChanging();
			entity.Product = null;
		}
		
		private void attach_OrderProducts(OrderProduct entity)
		{
			this.SendPropertyChanging();
			entity.Product = this;
		}
		
		private void detach_OrderProducts(OrderProduct entity)
		{
			this.SendPropertyChanging();
			entity.Product = null;
		}
	}
}
#pragma warning restore 1591
