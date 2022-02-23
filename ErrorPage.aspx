<%@ Page Title="" Language="C#" MasterPageFile="~/root.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
       <div class="container theme-showcase" role="main"> 
           <div class="jumbotron">
          <h1>1111人力銀行求職履歷輔助系統</h1>
          <p>您已被系統登出，如果您確定有正常自KSU-IR登入仍出現本畫面，請您再<strong>重新點選左側選單</strong>進入一次</p>  
    </div>

    <div  class="alert alert-danger" style="font-size:x-large" role="alert"> 
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    目前1111人力銀行求職履歷輔助系統為登出狀態</div>
    </div>
</asp:Content>

