﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartNerd.Controllers
{
    public class BaseController : Controller
    {
        Cart Cart { get; set; }
	}
}