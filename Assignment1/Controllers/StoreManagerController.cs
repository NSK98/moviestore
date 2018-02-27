using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Assignment1.Models;

namespace Assignment1.Controllers
{
    public class StoreManagerController : Controller
    {
        private MovieStoreModel db = new MovieStoreModel();

        // GET: StoreManager
        public ActionResult Index()
        {
            var movies = db.Movies.Include(m => m.Director).Include(m => m.Genre);
            ViewBag.MovieCount = movies.Count();
            return View(movies.OrderBy(m => m.Director.Name).ThenBy(m => m.Title).ToList());
        }


        // POST: StoreManager
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(String Title)
        {
            if (Title == "")
            {
                return RedirectToAction("Index");
            }
            else
            {
                var movies = db.Movies.Include(a => a.Director).Include(a => a.Genre).Where(a => a.Title.Contains(Title));
                ViewBag.MovieCount = movies.Count();
                ViewBag.Keywords = Title;
                return View(movies.OrderBy(a => a.Director.Name).ThenBy(a => a.Title).ToList());
            }
        }

        // GET: StoreManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // GET: StoreManager/Create
        public ActionResult Create()
        {
            ViewBag.DirectorId = new SelectList(db.Directors.OrderBy(m => m.Name), "DirectorId", "Name");
            ViewBag.GenreId = new SelectList(db.Genres.OrderBy(g => g.Name), "GenreId", "Name");
            return View();
        }

        // POST: StoreManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MovieId,GenreId,DirectorId,Title,Price,MovieArtUrl")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                // upload cover image if any
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];

                    if (file.FileName != null && file.ContentLength > 0)
                    {
                        if (file.ContentType.Equals("image/png") || file.ContentType.Equals("image/jpeg"))
                        {
                            string path = Server.MapPath("~/Content/Images/") + file.FileName;
                            file.SaveAs(path);
                            movie.MovieArtUrl = "/Content/Images/" + file.FileName;
                        }
                        else
                        {
                            return View("Error");
                        }
                    }
                }
                db.Movies.Add(movie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DirectorId = new SelectList(db.Directors, "DirectorId", "Name", movie.DirectorId);
            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "Name", movie.GenreId);
            return View(movie);
        }

        // GET: StoreManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            ViewBag.DirectorId = new SelectList(db.Directors.OrderBy(m => m.Name), "DirectorId", "Name", movie.DirectorId);
            ViewBag.GenreId = new SelectList(db.Genres.OrderBy(g => g.Name), "GenreId", "Name", movie.GenreId);
            return View(movie);
        }

        // POST: StoreManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MovieId,GenreId,DirectorId,Title,Price,MovieArtUrl")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                // upload cover image if any
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];

                    if (file.FileName != null && file.ContentLength > 0)
                    {
                        if (file.ContentType.Equals("image/png") || file.ContentType.Equals("image/jpeg"))
                        {
                            string path = Server.MapPath("~/Content/Images/") + file.FileName;
                            file.SaveAs(path);
                            movie.MovieArtUrl = "/Content/Images/" + file.FileName;
                        }
                        else
                        {
                            return View("Error");
                        }
                    }
                }
                db.Entry(movie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DirectorId = new SelectList(db.Directors, "DirectorId", "Name", movie.DirectorId);
            ViewBag.GenreId = new SelectList(db.Genres, "GenreId", "Name", movie.GenreId);
            return View(movie);
        }

        // GET: StoreManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = db.Movies.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: StoreManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Movie movie = db.Movies.Find(id);
            db.Movies.Remove(movie);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
