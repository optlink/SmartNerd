using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.Mvc;

namespace SmartNerd.Controllers {
    [RequireHttps]
    public class BaseController: Controller {
        private Cart _cart;
        protected override void Initialize(System.Web.Routing.RequestContext requestContext) {
            base.Initialize(requestContext);
            MTGOXDataContext _context = new MTGOXDataContext();
            ViewBag.Categories = (from c in _context.Categories
                                  select new Models.Menu.Category {
                                      CategoryID = c.CategoryID,
                                      CategoryName = c.Name
                                  }).ToList();
        }
        public Cart Cart {
            get {
                if(_cart == null) {
                    if(Session["CartID"] == null) {
                        _cart = new Cart();
                        String accountID = User.Identity.GetUserId();
                        if(accountID != null && Guid.Parse(accountID) != Guid.Empty) {
                            _cart.AccountID = Guid.Parse(accountID);
                        }
                    } else {
                        _cart = new Cart((Guid)Session["CartID"]);
                    }
                }
                return _cart;
            }
        }
    }
}