using System;
using System.Linq;
using System.Net.Http;
using System.Web.UI.WebControls;
using WingtipToys.Business;
using WingtipToys.Data;
using WingtipToys.Data.Models;

namespace WingtipToys
{
    public partial class ProductCreate : System.Web.UI.Page
    {
        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        
        private readonly HttpClient _httpClient = new HttpClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreRender(EventArgs e)
        {
            if (IsPostBack && IsValid)
            {
                CreateProductForm.Visible = false;
                SuccessBlock.Visible = true;
            }
        }

        public IQueryable<Category> GetCategories()
        {
            return _service.GetAllCategories().AsQueryable();
        }

        protected void ValidationImageExistence(object source, ServerValidateEventArgs args)
        {
            var request = new HttpRequestMessage(HttpMethod.Head, args.Value);
            try
            {
                using (var response = AsyncHelper.RunSync(() => _httpClient.SendAsync(request)))
                {
                    args.IsValid = response.IsSuccessStatusCode && response.Content.Headers.ContentType.MediaType.StartsWith("image/");
                }
            }
            catch (HttpRequestException)
            {
                args.IsValid = false;
            }
        }

        protected void CreateProductButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var product = new Product
                {
                    ProductName = ProductName.Text,
                    UnitPrice = decimal.Parse(UnitPrice.Text),
                    ImagePath = ImagePath.Text,
                    CategoryID = int.Parse(ProductCategoryList.SelectedValue),
                    Description = ProductDescription.Value
                };
                var created = _service.CreateProduct(product);
                MesageProductName.Text = created.ProductName;
                MessageProductID.Text = created.ProductID.ToString();
            }
        }
    }
}
