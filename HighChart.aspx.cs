using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;

namespace HighChart
{
    public partial class HighChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetChart();
            }
        }

        protected void GetChart()
        {
            DataSet dsDates = new DataSet();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("USP_GetDistinctProductionDates", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dsDates);
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("<div id=\"container\"></div>");
            sb.Append("<script>");
            sb.Append("Highcharts.chart('container', {");
            sb.Append("    chart: { type: 'column' },");
            sb.Append("    title: { text: 'Product Quantity by Date' },");
            sb.Append("    xAxis: { type: 'category' },");
            sb.Append("    yAxis: { title: { text: 'Quantity' } },");
            sb.Append("    series: [{");
            sb.Append("        name: 'Products',");
            sb.Append("        colorByPoint: true,");
            sb.Append("        data: [");

            foreach (DataRow row in dsDates.Tables[0].Rows)
            {
                DataSet dsProducts = new DataSet();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("USP_GetProductQuantityByDate", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductionDate", row["ProductionDate"]);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dsProducts);
                }

                foreach (DataRow productRow in dsProducts.Tables[0].Rows)
                {
                    sb.Append($"{{ name: '{productRow["ProductName"]}', y: {productRow["ProductQuantity"]} }},");
                }
            }

            sb.Append("        ]");
            sb.Append("    }]");
            sb.Append("});");
            sb.Append("</script>");

            containerClient.InnerHtml = sb.ToString();
        }

    }
}
