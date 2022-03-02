<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ResumeDataList.aspx.cs" Inherits="ResumeDataList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">

    <style>
        /*使用者照片大小顯示限制*/
        .avatar-pic {
            width: 150px;
        }

        .card-title {
            font-weight: bold;
            font-size: 20pt;
            color: #06880E;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
    </telerik:RadAjaxManager>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="page-header">
        <h1>研發企推組</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning">
                    <div class="text-right"><i class="fas fa-info-circle"></i></div>
                    <h4><strong>注意事項:</strong></h4>
                    <ol class="pl-4">
                        <li>提供資料有:<a style="color: darkred"</a>等基本資料。</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-primary text-white ">
            <i class="fas fa-list"></i>&nbsp;個人資料
        </div>
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">基本資料匯出</h2>

                    <div class="row">
                                        <div class="col-md-2 form-group">
                    <strong class="text-primary">年度</strong>
                    <asp:TextBox ID="TextBox_年度" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>
                </div>

                        <div class="col-md-3 form-group">
                            <asp:Button ID="Button_匯出查詢報表" runat="server" Text="匯出查詢報表" CssClass="btn btn-primary" OnClick="Button_匯出查詢報表_Click" ValidationGroup="main" />
                        </div>
                    </div>

                    <small class="text-muted">※以上聯絡資訊係來自本校My KSU應用系統，若需變更請至<a href="https://eip.ksu.edu.tw/cht/unit/D/A/RD/PPS/AP/research/index.aspx" target="_blank">學生學籍資訊系統</a>修改</small>

                </div>
            </div></div>

      </div>
</asp:Content>

