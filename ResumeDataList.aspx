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
        <h1>人力銀行求職履歷輔助建置系統</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning">
                    <div class="text-right"><i class="fas fa-info-circle"></i></div>
                    <h4><strong>注意事項:</strong></h4>
                    <ol class="pl-4">
                        <li>提供資料有:<a style="color: darkred">姓名、學號、身分證字號、生日、性別、E-mal信箱、聯絡地址、聯絡電話(戶籍電話)、手機號碼、系所名稱、入學年度、畢業年度、社團經驗、實習媒合、證照、競賽記錄</a>等基本資料。</li>
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
                    <h2 class="card-title">個人基本資料</h2>

                    <div class="row">
                                        <div class="col-md-2 form-group">
                    <strong class="text-primary">年度</strong>
                    <asp:TextBox ID="TextBox_年度" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                </div>

                        <div class="col-md-3 form-group">
                            <asp:Button ID="Button_匯出查詢報表" runat="server" Text="匯出查詢報表" CssClass="btn btn-primary" OnClick="Button_匯出查詢報表_Click" ValidationGroup="main" />

                        </div>

                        <div class="col-md-3 form-group">
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

                    <small class="text-muted">※以上聯絡資訊係來自本校學籍系統資料，若需變更請至<a href="https://ir.ksu.edu.tw/cca/public/schoolroll/infor/student" target="_blank">學生學籍資訊系統</a>修改</small>

                </div>
            </div>
            <%--個資--%>
            <div class="card d-none">
                <div class="card-body">
                    <h2 class="card-title">學籍資料</h2>

                    <div class="row">
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">主修科系</strong><br />
                            <div>
                                <asp:Label ID="Label_主修" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong class="text-primary">雙主修科系</strong><br />
                            <div>
                                <asp:Label ID="Label_雙主修" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--實習--%>
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">社團資料</h2>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <asp:ListView ID="ListView_社團" runat="server">
                                <LayoutTemplate>
                                    <table class="table table-bordered table-hover table-sm" id="table1">
                                        <thead class="bg-primary text-white">
                                            <tr>
                                                <th style="vertical-align: middle; text-align: center; white-space: nowrap;">社團名稱</th>
                                                <th style="vertical-align: middle; text-align: center; white-space: nowrap;">擔任職務</th>
                                                <th style="vertical-align: middle; text-align: center; white-space: nowrap;">在任起訖</th>
                                                <th style="vertical-align: middle; text-align: center; white-space: nowrap;">在任時間</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# HttpUtility.HtmlEncode( Eval("社團名稱")) %>
                                        </td>
                                        <td>
                                            <%# HttpUtility.HtmlEncode( Eval("頭銜")) %>
                                        </td>
                                        <td>
                                            <%# ViewConvert.getDateRangeString(Eval("新增時間"),Eval("退任日期")) %> 
                                        </td>
                                        <td>
                                            <%# ViewConvert.Months2YearMonthString((int)Eval("在職月數")) %> 
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table class="table table-bordered" id="table2">
                                        <tr class="text-center text-danger">
                                            <td>目前查無您的完成社團紀錄</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:ListView>
                            <div class=" text-danger small">
                                說明：本項校園經歷資料係擷取自「學生社團系統」中任職時間最長之前四筆資料，提供同學將在校期間校園經歷同步至人力銀行網站建立求職履歷之用，若發送資料有誤或需更改，請洽<a href="https://web.ksu.edu.tw/DASAECS/page/40072" target="_blank" title="前往查看">課外活動暨服務學習組</a>，後續亦可至人力銀行網站進行細部調整。
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="card-footer text-center" runat="server" id="checkResume" visible="false">

            <strong class=" text-danger">您已成功送出履歷資料至1111人力銀行，接下來請您點選下方按鈕前往1111人力銀行編輯與確認求職履歷</strong>
            <div>
                <a href="https://www.1111.com.tw/Resume/ResumeEdit?resumeGuid=<%=resumeGuid%>" target="_blank" class="btn btn-success">開啟1111人力銀行履歷進行編輯</a>
            </div>

        </div>
    </div>
</asp:Content>

