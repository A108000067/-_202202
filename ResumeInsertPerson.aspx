<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ResumeInsertPerson.aspx.cs" Inherits="ResumeInsertPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
    </telerik:RadAjaxManager>
    <div class="page-header">
        <div class="row">
            <div class="col-md-6 form-group align-self-end">
                <h1>履歷填寫系統</h1>
            </div>
            <div class="col-md-6 form-group align-self-end text-right">
                <a href="ResumeDataList.aspx" class="btn btn-primary"><i class="fas fa-arrow-left"></i>&nbsp;回上一頁</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header bg-primary text-white ">
            <i class="fas fa-list"></i>&nbsp;個人基本資料
        </div>
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">個人基本資料</h2>

                    <div class="row">
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">部別</strong><br />
                            <div>
                                <asp:Label ID="Label_部別" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">學制</strong><br />
                            <div>
                                <asp:Label ID="Label_學制" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-3 form-group">
                            <strong class="text-primary">科系</strong><br />
                            <div>
                                <asp:Label ID="Label_科系" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">班級</strong><br />
                            <div>
                                <asp:Label ID="Label_班級" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">KSUID</strong><br />
                            <div>
                                <asp:Label ID="Label_KSUID" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-3 form-group">
                            <strong class="text-primary">真實姓名</strong>
                            <asp:RequiredFieldValidator ID="真實姓名1" runat="server" ErrorMessage="*必填欄位" SetFocusOnError="true" ForeColor="Red"
                                ControlToValidate="TextBox_真實姓名" Display="Dynamic" ValidationGroup="main"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="真實姓名2" runat="server" ValidationExpression="^.{0,200}" ControlToValidate="TextBox_真實姓名"
                                ErrorMessage="*限20字" ForeColor="Red" Display="Dynamic" ValidationGroup="main"></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="TextBox_真實姓名" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="請輸入真實姓名" MaxLength="20" ValidationGroup="main"></asp:TextBox>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">學號</strong><br />
                            <div>
                                <asp:Label ID="Label_學號" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="col-md-2 form-group">
                            <strong class="text-primary">身分證字號</strong><br />
                            <div>
                                <asp:Label ID="Label_身分證字號" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">性別</strong><br />
                            <div>
                                <asp:Label ID="Label_性別" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">出生年月日</strong><br />
                            <div>
                                <asp:Label ID="Label_出生日期" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <h2 class="card-title">聯絡資訊</h2>
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <strong class="text-primary">電子郵件信箱</strong>
                            <br />
                            <div>
                                <asp:Label ID="Label_電子郵件信箱" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 form-group">
                            <strong class="text-primary">聯絡電話</strong>
                            <br />
                            <div>
                                <asp:Label ID="Label_聯絡電話" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 form-group">
                            <strong class="text-primary">行動電話</strong>
                            <br />
                            <div>
                                <asp:Label ID="Label_行動電話" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted">※以上聯絡資訊係來自本校學籍系統資料，若需變更請至<a href="https://ir.ksu.edu.tw/cca/public/schoolroll/infor/student" target="_blank">學生學籍資訊系統</a>修改</small>

                </div>
            </div>

        </div>

        <div class="card-footer">
            <div class="align-self-center text-center">
                <asp:Button ID="Button_送出" runat="server" Text="送出" CssClass="btn btn-primary btn-lg" ValidationGroup="main" OnClick="Button_送出_Click" OnClientClick="if(confirm('確定要送出申請表嗎?')==false) return false; " />
            </div>
        </div>
    </div>

</asp:Content>

