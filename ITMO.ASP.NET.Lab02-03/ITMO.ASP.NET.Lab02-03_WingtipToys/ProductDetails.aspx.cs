using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.ModelBinding;
using WingtipToys.Business;
using WingtipToys.Data;
using WingtipToys.Data.Models;


namespace WingtipToys
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        public IQueryable<Product> GetProduct([RouteData("productId")] int? productId)
        {
            if (!productId.HasValue || productId.Value == 0)
            {
                return null;
            }
            return new List<Product>(1) { _service.GetProduct(productId.Value) }.AsQueryable();
        }

        


    }
}