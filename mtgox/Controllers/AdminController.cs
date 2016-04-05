using SmartNerd.Models.Admin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartNerd.Controllers {
    public class AdminController: Controller {
        // GET: Admin
        [Authorize(Roles = "Administrator")]
        public ActionResult Index() {
            MTGOXDataContext _context = new MTGOXDataContext();
            var rprt = (from p in _context.Payments
                        join o in _context.Orders on p.OrderID equals o.OrderID
                        where o.DatePlaced != null
                        group new { p,o } by o.DatePlaced.Value.Year + "-" + o.DatePlaced.Value.Month + "-" + o.DatePlaced.Value.Day into agg
                        select new Models.Admin.ReportEntry {
                            DatePlaced = DateTime.Parse(agg.Key),
                            NumberOfOrders = agg.Count(),
                            DailyTotal = agg.Sum(a => a.o.OrderTotal)
                        }).ToList();

            var frq = (from p in _context.Payments
                       join o in _context.Orders on p.OrderID equals o.OrderID
                       join op in _context.OrderProducts on o.OrderID equals op.OrderID
                       join pr in _context.Products on op.ProductID equals pr.ProductID
                       where o.DatePlaced != null
                       group new { p,o,op,pr } by new { op.ProductID,pr.Name } into agg
                       select new Models.Admin.FrequentEntry {
                           ProductID = agg.Key.ProductID,
                           Name = agg.Key.Name,
                           TotalRevenue = agg.Sum(a => a.op.Quantity) * agg.First().pr.Price,
                           NumberOrdered = agg.Sum(a => a.op.Quantity)
                       }).OrderByDescending(f => f.TotalRevenue).Take(5).ToList();

            return View(new Models.Admin.ReportPage {
                DailyReport = rprt,
                FrequentProducts = frq
            });
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Browse(int? categoryID = null) {
            MTGOXDataContext dc = new MTGOXDataContext();
            List<Product> prods;
            //get all products
            if(categoryID == null) {
                prods = (from p in dc.Products
                         select new Product {
                             ProductName = p.Name,
                             ProductID = p.ProductID,
                             Price = p.Price,
                             Description = p.Description
                         }).ToList();
            } else {
                prods = (from c in dc.Categories
                         join ce in dc.CategoryEntries on c.CategoryID equals ce.CategoryID
                         join p in dc.Products on ce.ProductID equals p.ProductID
                         where c.CategoryID == categoryID.Value
                         select new Product {
                             ProductName = p.Name,
                             ProductID = p.ProductID,
                             Price = p.Price,
                             Description = p.Description
                         }).ToList();
            }
            BrowsePage mp = new BrowsePage {
                Categories = (from c in dc.Categories
                              select new Category {
                                  CategoryID = c.CategoryID,
                                  CategoryName = c.Name
                              }).ToList(),
                Products = prods
            };
            return View(mp);
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Search(SearchPage model) {
            MTGOXDataContext dc = new MTGOXDataContext();

            List<Product> products = null;

            if(model.SearchTerm != null) {
                products = (from a in dc.Products
                            where a.Name.Contains(model.SearchTerm)
                            select new Product {
                                Description = a.Description,
                                Price = a.Price,
                                ProductID = a.ProductID,
                                ProductName = a.Name
                            }).ToList();
            }

            model.Products = products;

            return View(model);
        }

        public ActionResult Product(int productID,int? categoryID = null) {
            if(TempData["ModelState"] != null && !ModelState.Equals(TempData["ModelState"]))
                ModelState.Merge((ModelStateDictionary)TempData["ModelState"]);


            MTGOXDataContext _context = new MTGOXDataContext();

            Product prod = (from p in _context.Products
                            where p.ProductID == productID
                            select new Product {
                                ProductID = p.ProductID,
                                Price = p.Price,
                                ProductName = p.Name,
                                Description = p.Description,
                                Inventory = p.Inventory
                            }).First();

            return View(prod);
        }

        [HttpPost]
        public ActionResult Product(Product model) {
            MTGOXDataContext db = new MTGOXDataContext();

            var prod = db.Products.Single(a => a.ProductID == model.ProductID);
            prod.Description = model.Description;
            prod.Name = model.ProductName;
            prod.Price = model.Price;
            prod.Inventory = model.Inventory;

            db.SubmitChanges();

            return View(model);
        }

        [HttpPost]
        public ActionResult DeleteProduct(Product model) {
            MTGOXDataContext db = new MTGOXDataContext();

            var entries = (from a in db.CategoryEntries
                           where a.ProductID == model.ProductID
                           select a).ToList();

            foreach(var entry in entries) db.CategoryEntries.DeleteOnSubmit(entry);

            var orderEntries = (from a in db.OrderProducts
                                where a.ProductID == model.ProductID
                                select a);

            foreach(var orderEntry in orderEntries) db.OrderProducts.DeleteOnSubmit(orderEntry);

            var orders = (from a in db.Orders
                          join b in db.OrderProducts on a.OrderID equals b.OrderID
                          where b.ProductID == model.ProductID
                          select a);

            foreach(var order in orders) {
                var payment = db.Payments.SingleOrDefault(a => a.OrderID == order.OrderID);
                if(payment != null) db.Payments.DeleteOnSubmit(payment); 

                db.Orders.DeleteOnSubmit(order);
            }

            var prod = db.Products.Single(a => a.ProductID == model.ProductID);
            db.Products.DeleteOnSubmit(prod);

            db.SubmitChanges();

            return RedirectToAction("Browse");
        }

        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase file,Product model) {
            if(file != null && file.ContentLength > 0 && file.ContentType == "image/png") {
                var path = Path.Combine(Server.MapPath("~/Images/p"),model.ProductID.ToString() + ".png");
                file.SaveAs(path);
            } else {
                ModelState.AddModelError("","Product Image must be a valid PNG");
                TempData["ModelState"] = ModelState;
            }


            return RedirectToAction("Product",model);
        }

        public ActionResult CreateProduct(Product model) {
            if(TempData["ModelState"] != null && !ModelState.Equals(TempData["ModelState"]))
                ModelState.Merge((ModelStateDictionary)TempData["ModelState"]);

            MTGOXDataContext db = new MTGOXDataContext();
            if(model.Categories == null) {
                var categories = db.Categories.ToList();

                model.Categories = new List<Product.Tuple>();
                foreach(var category in categories) {
                    model.Categories.Add(
                        new Product.Tuple {
                            Item1 = category.CategoryID,
                            Item2 = category.Name,
                            Item3 = false
                        }
                    );
                }
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult CreateProduct(HttpPostedFileBase file,Product model) {
            MTGOXDataContext db = new MTGOXDataContext();

            if(file == null || file.ContentLength == 0 || file.ContentType != "image/png") {
                ModelState.AddModelError("","Product Image must be a valid PNG");
                TempData["ModelState"] = ModelState;
            }

            if(ModelState.IsValid) {
                var prod = new DataModels.Product {
                    Description = model.Description,
                    Inventory = model.Inventory,
                    Name = model.ProductName,
                    Price = model.Price
                };

                db.Products.InsertOnSubmit(prod);
                db.SubmitChanges();

                foreach(var cat in model.Categories)
                    if(cat.Item3)
                        db.CategoryEntries.InsertOnSubmit(new DataModels.CategoryEntry {
                            CategoryID = cat.Item1,
                            ProductID = prod.ProductID
                        });
                db.SubmitChanges();

                var path = Path.Combine(Server.MapPath("~/Images/p"),prod.ProductID.ToString() + ".png");
                file.SaveAs(path);
                return RedirectToAction("Product",new { productID = prod.ProductID });
            }


            return RedirectToAction("CreateProduct",model);
        }

        public ActionResult Recovery(Boolean? recover) {
            MTGOXDataContext db = new MTGOXDataContext();

            if(recover.HasValue) {
                ModelState.AddModelError("","System recovered");

                FileInfo file = new FileInfo(Server.MapPath("~/Recovery/ddl.sql"));
                string script = file.OpenText().ReadToEnd();
                try {
                    db.ExecuteCommand(script);
                } catch {

                }
                try {
                    db.ExecuteCommand(script);
                } catch {

                }

                file = new FileInfo(Server.MapPath("~/Recovery/menu.sql"));
                script = file.OpenText().ReadToEnd();
                try {
                    db.ExecuteCommand(script);
                } catch {

                }

                Directory.Delete(Server.MapPath("~/Images/p"),true);

                Directory.CreateDirectory(Server.MapPath("~/Images/p"));
                foreach(String image in Directory.GetFiles(Server.MapPath("~/Recovery/p"))) {
                    String fileName = Path.GetFileName(image);
                    String destFile = Path.Combine(Server.MapPath("~/Images/p"),fileName);
                    System.IO.File.Copy(image,destFile,true);
                }
            }
            return View(recover);
        }

        public ActionResult CreateCategory() {
            if(TempData["ModelState"] != null && !ModelState.Equals(TempData["ModelState"]))
                ModelState.Merge((ModelStateDictionary)TempData["ModelState"]);

            return View();
        }

        [HttpPost]
        public ActionResult CreateCategory(HttpPostedFileBase file,Category model) {
            MTGOXDataContext db = new MTGOXDataContext();

            if(file == null || file.ContentLength == 0 || file.ContentType != "image/png") {
                ModelState.AddModelError("","Category Image must be a valid PNG");
                TempData["ModelState"] = ModelState;
            }

            if(ModelState.IsValid) {
                var cat = new DataModels.Category {
                    Name = model.CategoryName
                };

                db.Categories.InsertOnSubmit(cat);
                db.SubmitChanges();

                var path = Path.Combine(Server.MapPath("~/Images/m"),cat.CategoryID.ToString() + ".png");
                file.SaveAs(path);
                return RedirectToAction("Index");
            }


            return RedirectToAction("CreateCategory",model);
        }
    }
}