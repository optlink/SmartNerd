﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartNerd.Models.Menu
{
    public class Category
    {
        public int CategoryID { get; set; }
        public String CategoryName { get; set; }
    }
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
    public class MenuPage
    {
        public List<Category> Categories { get; set; }
        public List<Product> Products { get; set; }
    }
}