﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartNerd
{
    public class OrderProduct
    {
        private DataModels.OrderProduct _product;

        public OrderProduct(DataModels.OrderProduct p)
        {
            _product = p;
        }
        public int ProductID
        {
            get
            {
                return _product.ProductID;
            }
        }
        public int Quantity
        {
            get
            {
                return _product.Quantity;
            }
            set
            {
                _product.Quantity = value;
            }
        }
        public decimal Price
        {
            get
            {
                return _product.Product.Price;
            }
        }
    }
}