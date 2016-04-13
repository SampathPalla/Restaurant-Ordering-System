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
        function pop(AddEdit, div) {
            document.getElementById('popDiv').style.display = 'block';
            if (AddEdit == 'Add') {
                document.getElementById('MainContent_btnEditAddItem').value = 'Add Item To Menu';
                document.getElementById('MainContent_lblAddEditItem').innerHTML = 'Add Item To Menu';
                document.getElementById('MainContent_txtName').value = "";
                document.getElementById('MainContent_txtCost').value = "";
                document.getElementById('MainContent_txtImageUrl').value = "";
                document.getElementById('MainContent_txtIngredients').value = "";
            }
            else if (AddEdit == 'Edit') {
                baseName = div.replace("div", "");
                var lblName = 'lbl' + baseName;
                var lblCost = 'lbl' + baseName + 'Price';
                var lblImage = 'img' + baseName;
                var lblIngredients = 'lbl' + baseName + 'Ingredients';
                document.getElementById('MainContent_btnEditAddItem').value = 'Make Changes';
                document.getElementById('MainContent_lblAddEditItem').innerHTML = 'Edit Item';
                document.getElementById('MainContent_txtName').value = document.getElementById(lblName).innerHTML;
                document.getElementById('MainContent_txtCost').value = document.getElementById(lblCost).innerHTML;
                document.getElementById('MainContent_txtImageUrl').value = document.getElementById(lblImage).src;
                document.getElementById('MainContent_txtIngredients').value = document.getElementById(lblIngredients).innerHTML;
                document.getElementById('hdnEditFieldValue').value = baseName;
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
            var elem = document.getElementById(div);
            if (elem) {
                elem.parentNode.removeChild(elem);
                elem.style.display = 'none';
            }
            
            return false;
            
        }
        function AddEditItem() {
            //Making Name and Cost Fields Non Empty
            if (document.getElementById('MainContent_txtName').value == "") {
                alert("Can't have Name Field Empty. Please enter a name or click Cancel");
                return false;
            }
            else if (document.getElementById('MainContent_txtCost').value == "") {
                alert("Can't have Cost Field Empty. Please enter a name or click Cancel");
                return false;
            }
            else {
                if (document.getElementById('MainContent_lblAddEditItem').innerHTML == 'Add Item To Menu') {
                    AddItem();
                }
                else if (document.getElementById('MainContent_lblAddEditItem').innerHTML == 'Edit Item') {
                    EditItem();
                }
                hide();
            }
        }
        function AddItem() {

            var baseName = document.getElementById('MainContent_txtName').value;
            baseName = baseName.replace(/\s+/g, '');

            //Create Item Div
            var div = document.createElement('div');
            div.setAttribute("id", "div" + baseName);
            div.innerHTML += '<br/>';

            //Add Name Label to the div
            var labelName = document.createElement("label");
            labelName.innerHTML = document.getElementById('MainContent_txtName').value;
            labelName.setAttribute("style", "font-size:large");
            labelName.setAttribute("id", "lbl" + baseName);
            div.appendChild(labelName);
            div.innerHTML += '<br/>';

            //Add Cost Label to the div
            var labelCost = document.createElement("label");
            labelCost.innerHTML = document.getElementById('MainContent_txtCost').value;
            labelCost.setAttribute("style", "font-size:large");
            labelCost.setAttribute("id", "lbl" + baseName + "Price");
            div.appendChild(labelCost);
            div.innerHTML += '<br/>';

            //Add Image to the div
            var image = document.createElement("image");
            image.setAttribute("src", document.getElementById('MainContent_txtImageUrl').value);
            image.setAttribute("style", "width:150px;height:100px;");
            image.setAttribute("id", "img" + baseName);
            div.appendChild(image);
            
            //Add Ingredients to the div
            div.innerHTML += '<h3>Ingredients:</h3>';
            var labelIngredients = document.createElement("label");
            labelIngredients.innerHTML = document.getElementById('MainContent_txtIngredients').value;
            labelIngredients.setAttribute("id", "lbl" + baseName + "Ingredients");
            div.appendChild(labelIngredients);
            div.innerHTML += '<br/>';

            //Add Ratings to the div
            div.innerHTML += '<div class="rating">\
                                <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>\
                              </div>';

            //Add Remove button to the div
            var btnRemove = document.createElement("button");
            btnRemove.innerHTML = 'Remove Item From Menu';
            btnRemove.setAttribute("id", "btnRemove" + baseName);
            btnRemove.setAttribute("class", "btn btn-default");
            btnRemove.setAttribute("onclick", "removeItem('div" + baseName + "',''); return false;");
            div.appendChild(btnRemove);

            //Add Edit button to the div
            var btnEdit = document.createElement("button");
            btnEdit.innerHTML = 'Edit Item';
            btnEdit.setAttribute("id", "btnEdit" + baseName);
            btnEdit.setAttribute("class", "btn btn-default");
            btnEdit.setAttribute("onclick", "pop('Edit', 'div"+ baseName +"');return false;");
            div.appendChild(btnEdit);

            //Add this div to the Menu items
            document.getElementById('divMenuItems').appendChild(div);
        }
        function EditItem() {
            var baseName = document.getElementById('hdnEditFieldValue').value;
            var lblName = 'lbl' + baseName;
            var lblCost = 'lbl' + baseName + 'Price';
            var lblImage = 'img' + baseName;
            var lblIngredients = 'lbl' + baseName + 'Ingredients';
            document.getElementById(lblName).innerHTML = document.getElementById('MainContent_txtName').value;
            document.getElementById(lblCost).innerHTML = document.getElementById('MainContent_txtCost').value;
            document.getElementById(lblImage).src = document.getElementById('MainContent_txtImageUrl').value;
            document.getElementById(lblIngredients).innerHTML = document.getElementById('MainContent_txtIngredients').value;
            //return true;
        }
    </script>
    <div class="row" >
        <div id="divMain" class="container body-content" style="width:100%;">
            <h1 style="color:black; font-style:italic">Getting started</h1>
             <p>
                <input type="button" runat="server" ID="Button1" class="btn btn-default" value="Add Item To Menu" onclick="pop('Add',''); return false;"/>
            </p>
            <div id ="divMenuItems">
                <table id="tblMenuItems" runat="server" style="width:100%">
                    <tr style="border:groove">
                        <td>
                            <img src="https://h2savecom.files.wordpress.com/2014/01/easy-honety-bbq-chicken-wings.jpg" ID="imgChickenWings" alt="some_text" style="width:150px;height:100px;">
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" style="font-size:large">Chicken Wings</asp:Label>
                            <br/>
                            <h4>Ingredients:</h4> 
                            <asp:Label runat="server" ID="Label3">Chicken wings, unsalted butter, clove garlic, hot sauce.</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" style="font-size:large" ID="Label2">$9.99</asp:Label>
                            <br />
                            <asp:Button runat="server" ID="Button2" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divChickenWings'); return true;"/>
                            <asp:Button runat="server" ID="Button3" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divChickenWings'); return false;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="http://paleoaholic.com/wp-content/uploads/2013/08/buffalowing.jpg" ID="imgChickenWings" alt="some_text" style="width:150px;height:100px;">
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label4" style="font-size:large">Chicken Wings</asp:Label>
                            <br/>
                            <h4>Ingredients:</h4> 
                            <asp:Label runat="server" ID="Label5">Chicken wings, unsalted butter, clove garlic, hot sauce.</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" style="font-size:large" ID="Label6">$9.99</asp:Label>
                            <br />
                            <asp:Button runat="server" ID="Button4" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divChickenWings'); return true;"/>
                            <asp:Button runat="server" ID="Button5" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divChickenWings'); return false;"/>
                        </td>
                    </tr>
                     <tr style="border:groove">
                        <td>
                            <img src="https://h2savecom.files.wordpress.com/2014/01/easy-honety-bbq-chicken-wings.jpg" ID="imgChickenWings" alt="some_text" style="width:150px;height:100px;">
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label7" style="font-size:large">Chicken Wings</asp:Label>
                            <br/>
                            <h4>Ingredients:</h4> 
                            <asp:Label runat="server" ID="Label8">Chicken wings, unsalted butter, clove garlic, hot sauce.</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" style="font-size:large" ID="Label9">$9.99</asp:Label>
                            <br />
                            <asp:Button runat="server" ID="Button6" class="btn btn-default" Text="Remove Item From Menu" OnClientClick="removeItem('divChickenWings'); return true;"/>
                            <asp:Button runat="server" ID="Button7" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divChickenWings'); return false;"/>
                        </td>
                    </tr>
                </table>
                <div id="divBuffaloWings" style="width:25%">
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
                    <asp:Button runat="server" ID="btnEditBuffaloWings" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divBuffaloWings'); return false;"/>
                </div>
                <div id="divFrenchFries" style="width:25%">
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
                    <asp:Button runat="server" ID="btnEditFrenchFries" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divFrenchFries'); return false;"/>
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
                    <asp:Button runat="server" ID="btnEditBlackBeanPattyBurger" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divBlackBeanPattyBurger'); return false;"/>
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
                    <asp:Button runat="server" ID="btnEditChickenTandoori" class="btn btn-default" Text="Edit Item" OnClientClick="pop('Edit','divChickenTandoori'); return false;"/>
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
                    <input type="button" runat="server" class="btn btn-default" id="btnEditTresLeches" onclick="pop('Edit', 'divTresLeches'); return false" name="EditItem" value="Edit Item"/>
                    
                </div>
            </div>
        </div>
        <div id="popDiv" class="ontop" style="background-image:url(http://www.everydayinterviewtips.com/wp-content/uploads/2014/10/66082123-whitestorm-table-setting-restaurant.jpg)" >
            <label runat="server" ID="lblAddEditItem" style="font-size:larger;color:white" ></label>
            <span id='close' onclick="hide(); return true;">x</span>
            <table runat="server" ID="tblAddEditItem">
                <tr>
                    <td>
                        <label runat="server" value="Name of Item" style="color:white">Name of Item</label>
                    </td>
                    <td>
                        <input type="text" runat="server" ID="txtName" style="opacity:0.6" />
                    </td>
                </tr> 
                <tr>
                    <td>
                        <label runat="server" value="Cost" style="color:white">Cost</label>
                    </td>
                    <td>
                        <input type="text" runat="server" ID="txtCost"  style="opacity:0.6" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label runat="server" value="ImageUrl" style="color:white">Image Url</label>
                    </td>
                    <td>
                        <input type="text" runat="server" ID="txtImageUrl" style="opacity:0.6" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label runat="server" Text="Ingredients" style="color:white">Ingredients</label>
                    </td>
                    <td>
                        <textarea runat="server" ID="txtIngredients" style="opacity:0.6" rows="5" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" runat="server" ID="btnEditAddItem" class="btn btn-default" onclick="AddEditItem();return false;" />
                    </td>
                    <td>
                        <input type="button" runat="server" ID="btnCancel" class="btn btn-default" onclick ="hide(); return false;" value="Cancel" />
                    </td>
                </tr>
            </table>
            <input type="hidden" id="hdnEditFieldValue"/>
        </div>
    </div>
</asp:Content>
