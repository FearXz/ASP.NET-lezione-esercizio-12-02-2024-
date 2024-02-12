<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspNet_1._Default" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <div class="mb-5">
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" class="btn btn-primary mb-3" Width="278px"/> 
            <p id="parag1" runat="server"></p>
        </div>
        <div>
            <div id="total" runat="server"> 
                <p>Totale: </p>
            </div>
        </div>
       
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Menu</h3>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <p>1: Coca Cola 150 ml (€ 2.50)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="ButtonPlus"  CssClass="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Coca Cola 150 ml (€ 2.50)-2.5" />
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>2: Acqua 500 ml (€ 1.50)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button2" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Acqua 500 ml (€ 1.50)-1.5"/>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <p>3: Pizza Margherita (€ 8.00)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button3" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Pizza Margherita (€ 8.00)-8" />
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>4: Spaghetti al pomodoro (€ 7.00)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button4" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Spaghetti al pomodoro (€ 7.00)-7"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>5: Insalata mista (€ 6.00)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button5" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Insalata mista (€ 6.00)-6"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>6: Tiramisù (€ 4.00)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button6" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Tiramisù (€ 4.00)-4"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>7: Caffè (€ 1.00)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button7" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Caffè (€ 1.00)-1"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>8: Cappuccino (€ 1.50)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button8" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Cappuccino (€ 1.50)-1.5"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>9: Panino Salsiccia (€ 6.90)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button9" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Panino Salsiccia (€ 6.90)-6.9"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>10: Panino Tonno (€ 6.90)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button10" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Panino Tonno (€ 6.90)-6.9"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>11: Panino Prosciutto (€ 6.90)</p>
                                <div>
                                    <asp:Button runat="server" Text="+" id="Button11" class="btn btn-primary" OnClick="ButtonPlus_Click" CommandArgument="Panino Prosciutto (€ 6.90)-6.9"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">

                    <div class="card">
                        <div class="card-header">
                            <h3>Ordini</h3>
                        </div>
                        <div class="card-body">
                            <div id="orderListDiv" runat="server">
                                <asp:Repeater ID="OrderRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="d-flex  justify-content-between">
                                            <div class="mb-3 d-flex align-content-center">
                                                <span class="me-auto"><%# Eval("Nome") %> - <%# Eval("Prezzo") %>€ </span>
                                            </div>
                                            <div>
                                                <asp:Button runat="server" ID="ButtonMinus" CssClass="ms-auto btn btn-danger" Text="-" OnClick="ButtonMinus_Click" CommandArgument='<%# Eval("Nome") + "-" + Eval("Prezzo") %>' />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>

</asp:Content>
