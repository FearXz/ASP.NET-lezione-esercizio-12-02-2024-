using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNet_1
{
    public partial class _Default : Page
    {
        // Evento di caricamento della pagina
        protected void Page_Load(object sender, EventArgs e)
        {
            // Se è stata effettuata una richiesta di postback
            if (IsPostBack)
            {

                List<object> orderList = (List<object>)Session["order"];
                UpdateOrderListDisplay(orderList);
            }
            // Altrimenti inizializzo la lista degli ordini
            else
            {
                Session["order"] = new List<object>();

            }
        }

        // Evento di click del bottone 1
        protected void Button1_Click(object sender, EventArgs e)
        {
            parag1.InnerText = ConfigurationManager.AppSettings["Nome"] + " " + ConfigurationManager.AppSettings["Cognome"];
        }



        // Evento di click del bottone + del menu
        protected void ButtonPlus_Click(object sender, EventArgs e)
        {
            string parametro = ((Button)sender).CommandArgument;
            string[] parametroSplit = parametro.Split('-');

            dynamic order = new
            {
                Nome = parametroSplit[0],
                Prezzo = parametroSplit[1],
            };

            List<object> orderList = (List<object>)Session["order"];

            orderList.Add(order);

            Session["order"] = orderList;

            UpdateOrderListDisplay(orderList);
        }
        protected void ButtonMinus_Click(object sender, EventArgs e)
        {
            string parametro = ((Button)sender).CommandArgument;
            string[] parametroSplit = parametro.Split('-');

            string nomeProdotto = parametroSplit[0];

            List<object> orderList = (List<object>)Session["order"];

            // Cerca l'elemento nella lista in base al nome del prodotto
            dynamic orderToRemove = orderList.Find(obj => ((dynamic)obj).Nome == nomeProdotto);

            // Se l'elemento è stato trovato, rimuovilo dalla lista
            if (orderToRemove != null)
            {
                orderList.Remove(orderToRemove);
            }

            Session["order"] = orderList;

            UpdateOrderListDisplay(orderList);
        }


        // metodo per aggiornare la lista degli ordini e il totale nella pagina
        private void UpdateOrderListDisplay(List<object> orderList)
        {
            OrderRepeater.DataSource = orderList;
            OrderRepeater.DataBind();

            total.InnerHtml = "<p>Totale: " + CalculateTotal(orderList) + "€</p>";
        }

        // metodo per calcolare il totale degli ordini
        private string CalculateTotal(List<object> orderList)
        {
            decimal total = 0;

            foreach (dynamic order in orderList)
            {
                total += Convert.ToDecimal(order.Prezzo);
            }

            return total.ToString();
        }
    }
}