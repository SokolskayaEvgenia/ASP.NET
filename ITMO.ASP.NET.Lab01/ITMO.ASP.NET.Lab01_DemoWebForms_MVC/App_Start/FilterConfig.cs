using System.Web;
using System.Web.Mvc;

namespace ITMO.ASP.NET.Lab01_DemoWebForms_MVC
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
