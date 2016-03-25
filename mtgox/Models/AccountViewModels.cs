﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SmartNerd.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }
    }

    public class ManageUserViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [Display(Name = "Username")]
        public string UserName { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Email Address")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Phone Number")]
        public string Phone { get; set; }
    }

    public class Address
    {
        public int AddressID { get; set; }
        [Display(Name="Full Name")]
        [Required]
        [StringLength(100)]
        public String FullName { get; set; }
        [Display(Name = "Address Line 1")]
        [Required]
        [StringLength(100)]
        public string Line1 { get; set; }
        [Display(Name = "Address Line 2")]
        [StringLength(100)]
        public string Line2 { get; set; }
        [Display(Name = "City")]
        [Required]
        [StringLength(50)]
        public string City { get; set; }
        [Display(Name = "State")]
        [Required]
        [StringLength(2)]
        public string StateOrProvince { get; set; }
        [Display(Name = "Zip Code")]
        [Required]
        [StringLength(20)]
        public string ZipCode { get; set; }
        [Display(Name = "County")]
        [Required]
        [StringLength(2)]
        public string County { get; set; }
    }
    public class AccountAddress : Address
    {
        public Guid AccountID { get; set; }
        public string AddressType { get; set; }
    }
}