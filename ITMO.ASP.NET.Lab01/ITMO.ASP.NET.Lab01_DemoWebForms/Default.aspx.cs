using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITMO.ASP.NET.Lab01_DemoWebForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TitleLiteral.Text = $"Hello from code! Now is: {DateTime.Now}";
        }
    }
}