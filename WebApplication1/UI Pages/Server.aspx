<%@ Page Title="Server Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Server.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        .ontop {
				z-index: 999;
				width: 30%;
				height: 40%;
				display: none;
                top: 45%;
				left: 45%;
				position: fixed;
                margin-top: -100px;
				margin-left: -150px;
			}
        #close {
            float:right;
            display:inline-block;
            padding:2px 5px;
            background:#ccc;
        }
        
    </style>
    <script type="text/javascript">
        function AddToMenu() {
            
            return false;
        }
        function pop(AddEdit) {
            document.getElementById('popDiv').style.display = 'block';
            if (AddEdit == 'Add') {
                document.getElementById('MainContent_btnEditAddItem').value = 'Add Item To Menu';
                document.getElementById('MainContent_lblAddEditItem').innerHTML = 'Add Item To Menu';
            }
            else if (AddEdit == 'Edit') {
                document.getElementById('MainContent_btnEditAddItem').value = 'Make Changes';
                document.getElementById('MainContent_lblAddEditItem').innerHTML = 'Edit Item';
            }
            document.getElementById('divMain').style.opacity = '0.4';
            return false;
        }
        function hide() {
            document.getElementById('popDiv').style.display = 'none';
            document.getElementById('divMain').style.opacity = '1';
            return false;
        }
        function removeItem(div)
        {
            //alert(div.id);
            var elem = document.getElementById(div);
            if (elem) {
                elem.parentNode.removeChild(elem);
                elem.style.display = 'none';
            }
            
            return false;
            
        }
        function AddEditItem() {
            if (document.getElementById('MainContent_lblAddEditItem').innerHTML == 'Add Item To Menu') {
                AddItem();
            }
            else if (document.getElementById('MainContent_lblAddEditItem').innerHTML == 'Edit Item') {
                EditItem();
            }
            hide();
        }
        function AddItem() {
            var baseName = document.getElementById('MainContent_txtName').value;
            baseName = baseName.replace(/\s+/g, '');
            var div = document.createElement('div');
            div.id = "div" + baseName;
            div.innerHTML = '<br/>\
                            <asp:Label runat="server" style="font-size:large">' + document.getElementById('MainContent_txtName').value + '</asp:Label>\
                            <br/>\
                            <asp:Label runat="server" style="font-size:large">' + document.getElementById('MainContent_txtCost').value + '</asp:Label>\
                            <br/>\
                            <img src="' + document.getElementById('MainContent_txtImageUrl').value + '" alt="some_text" style="width:150px;height:100px;">\
                            <h3>Ingredients:</h3> \
                            <asp:Label runat="server">' + document.getElementById('MainContent_txtIngredients').value + '</asp:Label>\
                            <div class="rating">\
                            <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>\
                            </div>\
                            <asp:Button runat="server" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem(); return false;"/>\
                            <input type="button" runat="server" class="btn btn-default" onclick="pop(\'Edit\'); return false" name="EditItem" value="Edit Item"/>';
            document.getElementById('divMenuItems').appendChild(div);
        }
        function EditItem() {

        }
    </script>
    <div class="row" >
        <div id="divMain" class="col-md-4" style="width:100%">
            <h1>Getting started</h1>
             <p>
                <asp:Button runat="server" ID="Button1" class="btn btn-default" Text="Add Item To Menu" OnClientClick="pop('Add'); return false;"/>
            </p>
            <div id ="divMenuItems" class="col-md-4">
                <div id="divChickenWings">
                    <asp:Label runat="server" ID="lblChickenWings" style="font-size:large">Chicken Wings</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="lblChickenWingsPrice">$9.99</asp:Label>
                    <br/>
                    <img src="https://h2savecom.files.wordpress.com/2014/01/easy-honety-bbq-chicken-wings.jpg" ID="imgChickenWings" alt="some_text" style="width:150px;height:100px;">
                    <h3>Ingredients:</h3> 
                    <asp:Label runat="server" ID="lblChickenWingsIngredients">Chicken wings, unsalted butter, clove garlic, hot sauce.</asp:Label>
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveChickenWings" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divChickenWings'); return true;"/>
                    <asp:Button runat="server" ID="btnEditChickeWings" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit'); return false;"/>
                </div>
                <div id="divBuffaloWings">
                    <br />
                    <asp:Label runat="server" ID="lblBuffaloWings" style="font-size:large">Buffalo Wings</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="lblBuffaloWingsPrice">$12.99</asp:Label>
                    <br/>
                    <img src="http://paleoaholic.com/wp-content/uploads/2013/08/buffalowing.jpg" id="imgBuffaloWings" alt="some_text" style="width:150px;height:100px;">
                    <h3>Ingredients:</h3>
                    <asp:Label runat="server" ID="lblBuffaloWingsIngredients">Chicken wings, melted butter, paprika, hot pepper sauce, salt, cayenne pepper, black pepper.</asp:Label>
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveBuffaloWings" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divBuffaloWings'); return true;"/>
                    <asp:Button runat="server" ID="btnEditBuffaloWings" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit'); return false;"/>
                </div>
                <div id="divFrenchFries">
                    <br />
                    <asp:Label runat="server" ID="lblFrenchFries" style="font-size:large">French Fries</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="lblFrenchFriesPrice">$5</asp:Label>
                    <br/>
                    <img src="https://cowcrumbs.files.wordpress.com/2015/06/french-fries-wallpaper-1.jpg" id="imgFrenchFries" alt="some_text" style="width:150px;height:100px;">
                    <h3>Ingredients:</h3>
                    <asp:Label runat="server" ID="lblFrenchFriesIngredients">Potatoes, Vegetable Oil, Natural Beef Flavor, Citric Acid, Dextrose, Sodium Acid Pyrophosphate, Salt.</asp:Label>
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveFrenchFries" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divFrenchFries'); return true;"/>
                    <asp:Button runat="server" ID="btnEditFrenchFries" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit'); return false;"/>
                </div>
                <div id="divBlackBeanPattyBurger">
                    <br />
                    <asp:Label runat="server" ID="lblBlackBeanPattyBurger" style="font-size:large">Black Bean Patty Burger</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="lblBlackBeanPattyBurgerPrice">$5</asp:Label>
                    <br/>
                    <img src="http://mealexmailex.com/wp-content/uploads/2014/10/double-cheese-beef-burger.jpg?a1ef18" id="imgBlackBeanPattyBurger" alt="some_text" style="width:150px;height:100px;">
                    <h3>Ingredients:</h3>
                    <asp:Label runat="server" ID="lblBlackBeanPattyBurgerIngredients">Black Bean Patty, Salad, Buns, Cheese, Mayo, Tomato Sauce, Siracha.</asp:Label>
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveBlackBeanPattyBurger" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divBlackBeanPattyBurger'); return true;"/>
                    <asp:Button runat="server" ID="btnEditBlackBeanPattyBurger" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit'); return false;"/>
                </div>
                <div id="divChickenTandoori">
                    <br />
                    <asp:Label runat="server" ID="lblChickenTandoori" style="font-size:large">Chicken Tandoori</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="ChickenTandooriPrice">$15.99</asp:Label>
                    <br/>
                    <img src="http://aramkitchen.com/wp-content/uploads/2013/09/legfinal1-piece-short.jpg" id="imgChickenTandoori" alt="some_text" style="width:150px;height:100px;">
                    <h3>Ingredients:</h3>
                    <asp:Label runat="server" ID="lblChickenTandooriIngredients">Ginger and garlic paste, red chilli paste, chaat masala, tandoori masala, oil, curd, salt and lemon juice.</asp:Label>
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveChickenTandoori" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divChickenTandoori'); return true;"/>
                    <asp:Button runat="server" ID="btnEditChickenTandoori" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit'); return false;"/>
                </div>
                <div id="divTresLeches">
                    <br />
                    <asp:Label runat="server" ID="lblTresLeches" style="font-size:large">Tres Leches</asp:Label>
                    <br/>
                    <asp:Label runat="server" style="font-size:large" ID="lblTresLechesPrice">$5.35</asp:Label>
                    <br/>
                    <img src="http://static.wixstatic.com/media/aaa310_468b9c05de384f94a46ff76114cd241c.gif" id="imgTresLeches" alt="some_text" style="width:150px;height:100px;">
                    <div class="rating">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <asp:Button runat="server" ID="btnRemoveTresLeches" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divTresLeches'); return true;"/>
                    <input type="button" runat="server" class="btn btn-default" id="btnEditTresLeches" onclick="pop('Edit'); return false" name="EditItem" value="Edit Item"/>
                    
                </div>
            </div>
        </div>
        <div id="popDiv" class="ontop" style="background-image:url(http://www.everydayinterviewtips.com/wp-content/uploads/2014/10/66082123-whitestorm-table-setting-restaurant.jpg)" >
            <asp:Label runat="server" ID="lblAddEditItem" style="font-size:larger;color:white" ></asp:Label>
            <span id='close' onclick="hide(); return true;">x</span>
            <table runat="server" ID="tblAddEditItem">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Name of Item" style="color:white"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtName" style="opacity:0.6"></asp:TextBox>
                    </td>
                </tr> 
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Cost" style="color:white"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCost"  style="opacity:0.6"></asp:TextBox> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="ImageUrl" style="color:white"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtImageUrl" style="opacity:0.6"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label runat="server" Text="Ingredients" style="color:white"></asp:Label>
                    </td>
                    <td>
                        <textarea runat="server" ID="txtIngredients" style="opacity:0.6" rows="5" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnEditAddItem" class="btn btn-default" OnClientClick="AddEditItem();return false;" />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnCancel" class="btn btn-default" Text="Cancel" OnClientClick="hide();" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
