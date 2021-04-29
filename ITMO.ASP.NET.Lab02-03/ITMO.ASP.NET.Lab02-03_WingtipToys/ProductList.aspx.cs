using System;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using WingtipToys.Business;
using WingtipToys.Data;
using WingtipToys.Data.Models;


namespace WingtipToys
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Browser.IsMobileDevice == true)
            {
                productListView.GroupItemCount = 3;
                
            }
        }

        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId, [RouteData] string categoryName)
        {
            if (categoryId.HasValue && categoryId > 0)
            {
                return _service.GetProductByCategoryId(categoryId.Value).AsQueryable();
            }

            if (!string.IsNullOrEmpty(categoryName))
            {
                return _service.GetProductByCategoryName(categoryName).AsQueryable();
            }
            return _service.GetAllProducts().AsQueryable();
        }


    }

}