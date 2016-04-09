<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .rating {
        unicode-bidi: bidi-override;
        direction: rtl;
        text-align: left;
        }
        .rating > span {
        display: inline-block;
        position: relative;
        width: 1.1em;
        }
        .rating > span:hover,
        .rating > span:hover ~ span {
        color: transparent;
        }
        .rating > span:hover:before,
        .rating > span:hover ~ span:before {
        content: "\2605";
        position: absolute;
        left: 0; 
        color: gold;
        }
    </style>
    <script type="text/javascript">
        function AddToOrder(Name, Cost) {
            document.getElementById("MainContent_txtOrder").innerHTML += Name;
            document.getElementById("MainContent_txtOrder").innerHTML += '\n';
            var cost = parseFloat(document.getElementById("MainContent_txtCost").value) + parseFloat(Cost);
            cost = Math.round(cost * 100) / 100;
            var tax = cost / 10;
            tax = Math.round(tax * 100) / 100;
            var total = cost + tax;
            total = Math.round(total * 100) / 100;
            document.getElementById("MainContent_txtCost").value = cost;
            document.getElementById("MainContent_txtTax").value = tax;
            document.getElementById("MainContent_txtTotalPrice").value = total;
            return false;
        }
    </script>
    <div class="row" >
        <div class="col-md-4" style="width:600px">
            <h1>Getting started</h1>
            <p>
                <h2>Chicken Wings $9.99</h2>
                <img src="https://h2savecom.files.wordpress.com/2014/01/easy-honety-bbq-chicken-wings.jpg" alt="some_text" style="width:150px;height:100px;">
                <h3>ingredients:</h3> Chicken wings, unsalted butter, clove garlic, hot sauce.
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>

            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('Chicken Wings, $9.99', 9.99); return false;"/>
            </p>
            <p>
                <h2>Buffalo Wings $12.99</h2>
                <img src="http://paleoaholic.com/wp-content/uploads/2013/08/buffalowing.jpg" alt="some_text" style="width:150px;height:100px;">
                <h3>ingredients:</h3>
                Chicken wings, melted butter, paprika, hot pepper sauce, salt, cayenne pepper, black pepper.
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>

            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd2" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('Buffalo Wings, $12.99', 12.99); return false;"/>
            </p>
            <p>
                <h2>French Fries $5</h2>
                <img src="https://cowcrumbs.files.wordpress.com/2015/06/french-fries-wallpaper-1.jpg" alt="some_text" style="width:150px;height:100px;">
                <h3>ingredients:</h3>
                Potatoes, Vegetable Oil, Natural Beef Flavor, Citric Acid, Dextrose, Sodium Acid Pyrophosphate, Salt.
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd3" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('French Fries, $5', 5); return false;"/>
            </p>
            <p>
                <h2>Black Bean Patty Burger $6.25</h2>
                <img src="http://mealexmailex.com/wp-content/uploads/2014/10/double-cheese-beef-burger.jpg?a1ef18" alt="some_text" style="width:150px;height:100px;">
                <h3>ingredients:</h3>
                Black Bean Patty, Salad, Buns, Cheese, Mayo, Tomato Sauce, Siracha.
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd4" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('Black Bean Patty Burger, $6.25', 6.25); return false;"/>
            </p>
            <p>
                <h2>Chicken Tandoori $15.99</h2>
                <img src="http://aramkitchen.com/wp-content/uploads/2013/09/legfinal1-piece-short.jpg" alt="some_text" style="width:150px;height:100px;">
                <h3>ingredients:</h3>
                Ginger and garlic paste, red chilli paste, chaat masala, tandoori masala, oil, curd, salt and lemon juice.
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd5" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('Chicken Tandoori, $15.99', 15.99); return false;"/>
            </p>
            <p>
                <h2>Tres Leches $5.35</h2>
                <img src="http://static.wixstatic.com/media/aaa310_468b9c05de384f94a46ff76114cd241c.gif" alt="some_text" style="width:150px;height:100px;">
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
            </p>
            <p>
                <asp:Button runat="server" ID="btnAdd6" class="btn btn-default" Text="Add To Order" OnClientClick="AddToOrder('Tres Leches, $5.35', 5.35); return false;"/>
            </p>
        </div>
        <div class="col-md-4" style="position:fixed; top: 2em; right: 1em">
            <h1>Your Order</h1>
            <asp:TextBox runat="server" ID="txtOrder" ReadOnly="true" TextMode="multiline" Rows="20" Columns="30"  style="opacity:0.6"></asp:TextBox>
            <br />
            <table runat="server" ID="tblAddToOrder">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Cost: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCost" ReadOnly="true" Text="0" style="opacity:0.6"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>    
                        <asp:Label runat="server" Text="Tax:  "></asp:Label>
                    </td>
                    <td>
                       <asp:TextBox runat="server" ID="txtTax"  ReadOnly="true" Text="0" style="opacity:0.6"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Total: $"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtTotalPrice" ReadOnly="true" Text="0" style="opacity:0.6"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button runat="server" ID="btnPlaceOrder" class="btn btn-default" Text="Place Order" />
        </div>
    </div>

</asp:Content>
