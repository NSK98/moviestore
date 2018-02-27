namespace Assignment1.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MovieStoreModel : DbContext
    {
        public MovieStoreModel()
            : base("name=Default_Connection")
        {
        }

        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<Director> Directors { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cart>()
                .Property(e => e.CartId)
                .IsUnicode(false);

            modelBuilder.Entity<Director>()
                .HasMany(e => e.Movies)
                .WithRequired(e => e.Director)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Genre>()
                .HasMany(e => e.Movies)
                .WithRequired(e => e.Genre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Movie>()
                .Property(e => e.Price)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Movie>()
                .HasMany(e => e.Carts)
                .WithRequired(e => e.Movie)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Movie>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Movie)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.Total)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.UnitPrice)
                .HasPrecision(10, 2);
        }
    }
}
