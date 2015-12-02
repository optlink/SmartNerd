﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartNerd
{
    public class Cart
    {
        private SmartNerdDataContext _context;
        private DataModels.Order _order;
        private List<OrderProduct> _products;

        public Cart()
        {
            _context = new SmartNerdDataContext();
            _order = new DataModels.Order();
            _context.Orders.InsertOnSubmit(_order);
        }
        public Cart(Guid cartID)
        {
            _context = new SmartNerdDataContext();
            _order = (from o in _context.Orders
                      where o.CartID == cartID
                      select o).First();
        }

        #region Properties
        public int OrderID {
            get {
                return _order.OrderID;
            }
            //we don't ever want to change this, so no set
        }
        public Guid CartID
        {
            get
            {
                return _order.CartID;
            }
        }
        public Guid? AccountID
        {
            get
            {
                return _order.AccountID;
            }
            set
            {
                _order.AccountID = value;
            }
        }
        #endregion

        #region "Public Methods"
        public List<OrderProduct> Products
        {
            get
            {
                if (_products == null)
                {
                    _products = (from op in _context.OrderProducts
                                 where op.OrderID == _order.OrderID
                                 select new OrderProduct(op)).ToList();
                }
                return _products.ToList();
            }
            //we'll use methods to modify the products 
        }
        public void AddProduct(Models.Menu.Product prod)
        {
            DataModels.OrderProduct op = new DataModels.OrderProduct
            {
                Quantity = prod.Quantity,
                ProductID = prod.ProductID,
                OrderID = _order.OrderID
            };
            _context.OrderProducts.InsertOnSubmit(op);
            OrderProduct orderProd = new OrderProduct(op);
            orderProd.Price = (from p in _context.Products
                               where p.ProductID == prod.ProductID
                               select p.Price).First();
            Products.Add(orderProd);
        }
        public void Save()
        {
            decimal total = 0;
            foreach(OrderProduct p in Products)
            {
                total += p.Price * p.Quantity;
            }
            _order.OrderTotal = total;
            _context.SubmitChanges();
        }
        #endregion
    }
}