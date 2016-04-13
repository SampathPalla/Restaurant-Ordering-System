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
        function addToOrder(Name, Cost) {
            var nameSplit;
            var lblName = Name.split(",")[0];

            var chkName = 'chk' + lblName.replace(/\s+/g, '');
            var divName = 'div' + lblName.replace(/\s+/g, '');
            lblName = 'lbl' + lblName.replace(/\s+/g, '');

            if (document.getElementById(lblName)) {
                nameSplit = document.getElementById(chkName).value.split(",");
                if (nameSplit[2]) {
                    if (parseInt(nameSplit[2]) < 10) {
                        document.getElementById(lblName).innerHTML = document.getElementById(lblName).innerHTML.slice(0, -1) + (parseInt(nameSplit[2]) + 1);
                        document.getElementById(chkName).value = document.getElementById(chkName).value.slice(0, -1) + (parseInt(nameSplit[2]) + 1);
                    }
                    else {
                        alert("Atmost 10X can be ordered");
                        return false;
                    }
                }
                else {
                    document.getElementById(lblName).innerHTML += ', 2';
                    document.getElementById(chkName).value += ', 2';
                }
            }
            else {
                var div = document.createElement("div");
                div.setAttribute("id", divName);

                var label = document.createElement("label");
                var description = document.createTextNode(Name);
                label.setAttribute("id", lblName);

                var checkbox = document.createElement("input");
                checkbox.type = "checkbox";    // make the element a checkbox
                checkbox.name = 'remFood';      // give it a name we can check on the server side
                checkbox.value = Name;
                checkbox.setAttribute("id", chkName);
            
                label.appendChild(checkbox);   // add the box to the element
                label.appendChild(description);// add the description to the element

                div.appendChild(label);
                document.getElementById('divAddToOrder').appendChild(div);
            }
            var cost = parseFloat(document.getElementById("txtCost").value) + parseFloat(Cost);
            cost = Math.round(cost * 100) / 100;
            var tax = cost / 10;
            tax = Math.round(tax * 100) / 100;
            var total = cost + tax;
            total = Math.round(total * 100) / 100;
            document.getElementById("txtCost").value = cost;
            document.getElementById("txtTax").value = tax;
            document.getElementById("txtTotalPrice").value = total;
            return false;
        }

        function removeFromOrder() {
            var food = document.getElementsByName('remFood');
            for (var i = 0; i < food.length; i++) // loop through it
            {
                if (food[i].checked) // if its checked
                {
                    var nameSplit = food[i].value.split(",");
                    nameSplit[1] = nameSplit[1].replace("$", "");
                    if (nameSplit[2]) {
                        var cost = parseFloat(document.getElementById("txtCost").value) - (parseFloat(nameSplit[1]) * parseInt(nameSplit[2]));
                        cost = Math.round(cost * 100) / 100;
                    }
                    else {
                        var cost = parseFloat(document.getElementById("txtCost").value) - parseFloat(nameSplit[1]);
                        cost = Math.round(cost * 100) / 100;
                    }
                    var tax = cost / 10;
                    tax = Math.round(tax * 100) / 100;
                    var total = cost + tax;
                    total = Math.round(total * 100) / 100;
                    document.getElementById("txtCost").value = cost;
                    document.getElementById("txtTax").value = tax;
                    document.getElementById("txtTotalPrice").value = total;

                    var remElem = (food[i]).parentNode.parentNode;
                    removeElement(remElem);
                }




                else {
                }
            }
            return false;
        }
        function removeElement(remElem) {
            remElem.parentNode.removeChild(remElem);
            remElem.style.display = 'none';
            return true;
        }
    </script>
    <div class="row" >
        <div class="col-md-4" style="width:600px">
            <h1>Getting started</h1>
             <div id ="divMenuItems" class="col-md-4">
                
            </div>
        </div>
        <div class="col-md-4" style="position:fixed; top: 3em; right: 7em; ">
            <h1>Your Order</h1>
            <div id="divAddToOrder" class="col-md-4" style="width:60%; height:300px; overflow-y:scroll">
                
            </div>
            <br />
            <table runat="server" ID="tblAddToOrder">
                <tr>
                    <td>
                        <label runat="server">Cost: </label>
                    </td>
                    <td>
                        <input type="text" runat="server" ID="txtCost" readonly="readonly" Text="0" style="opacity:0.6" />
                    </td>
                </tr>
                <tr>
                    <td>    
                        <label runat="server" Text="Tax:  ">Tax: </label>
                    </td>
                    <td>
                       <input type="text" runat="server" ID="txtTax" readonly="readonly" Text="0" style="opacity:0.6" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label runat="server" Text="Total: $">Total: $</label>
                    </td>
                    <td>
                        <input type="text" runat="server" ID="txtTotalPrice" readonly="readonly" Text="0" style="opacity:0.6" />
                    </td>
                </tr>
            </table>
            <input type="button" runat="server" ID="btnPlaceOrder" class="btn btn-default" value="Place Order" />
            <input type="button" runat="server" ID="btnRemoveFrmOrder" class="btn btn-default" value="Remove Items From Order" onclick="removeFromOrder(); return false;" />
        </div>
    </div>

</asp:Content>
