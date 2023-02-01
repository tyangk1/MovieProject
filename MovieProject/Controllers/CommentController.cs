using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieProject.Controllers
{
    public class CommentController : Controller
    {
        // GET: Comment
        MovieProjectDbcontext db = new MovieProjectDbcontext();
        [HashCredential(RoleID = "VIEW_USER")]
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddReview(int movieID, FormCollection getReview)
        {

            Comment r = new Comment();
            r.MovieID = movieID;
            r.Content = getReview["message"];
            r.CreatedDate = DateTime.Now;

            db.Comments.Add(r);
            db.SaveChanges();
            return RedirectToAction("Index");

        }


    }
}