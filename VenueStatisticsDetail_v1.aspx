<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="VenueStatisticsDetail_v1.aspx.cs" Inherits="VenueStatisticsDetail_v1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
    <link href="//datatables.net/download/build/nightly/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="//datatables.net/download/build/nightly/jquery.dataTables.js"></script>
    <script src="//cdn.rawgit.com/ashl1/datatables-rowsgroup/v1.0.0/dataTables.rowsGroup.js"></script>

    <script>
        var language_cht = {
            "processing": "處理中...",
            "loadingRecords": "載入中...",
            "lengthMenu": "顯示 _MENU_ 項結果",
            "zeroRecords": "沒有符合的結果",
            "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
            "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
            "infoFiltered": "(從 _MAX_ 項結果中過濾)",
            "infoPostFix": "",
            "search": "搜尋:",
            "paginate": {
                "first": "第一頁",
                "previous": "上一頁",
                "next": "下一頁",
                "last": "最後一頁"
            },
            "aria": {
                "sortAscending": ": 升冪排列",
                "sortDescending": ": 降冪排列"
            }
        };

        $(document).ready(function () {
            //正規學制課程
            var table1 = $('#table1').DataTable({
                "language": language_cht,
                "info": false,
                "sort": false,
                "responsive": true,
                "searching": false,
                "paging": false,
                "rowsGroup": [1, 0],
            });

            //推廣教育-DadaTable初始化設定
            var table2 = $('#table2').DataTable({
                "language": language_cht,
                "sort": false,
                "info": false,
                "responsive": true,
                "searching": false,
                "paging": false,
                "rowsGroup": [0, 2, 1],
            });

            //微學分-DadaTable初始化設定
            var table3 = $('#table3').DataTable({
                "language": language_cht,
                "sort": false,
                "info": false,
                "responsive": true,
                "searching": false,
                "paging": false,
                "rowsGroup": [1, 0, 2, 3],
            });
        });

    </script>
    <style>
        .rblStyle label {
            margin-right: 20px;
            margin-left: 5px;
        }

        .hrclass {
            border: 1px solid #0072B5;
        }

        .custom-text-1 {
            color: #305496;
        }

        .custom-text-2 {
            color: #6C6B74;
        }

        .custom-text-3 {
            color: #EDD170;
        }

        .custom-bg-1 {
            background-color: #305496;
        }
        .custom-bg-2 {
            background-color: #EDD170;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DropDownList_類別設定">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ListView1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"></telerik:RadAjaxLoadingPanel>


    <div class="page-header">
        <h1>場地使用統計&nbsp;<small class="text-muted">整合型資料平台系統</small> </h1>
    </div>
    <div class="card">
        <div class="card-header custom-bg-1 text-white font-weight-bold">
            <div class="h3 font-weight-bold mb-0">場地使用詳細狀況</div>
        </div>
        <div class="card-body">
            <!--場地標題-->
            <h4 class="custom-text-1 font-weight-bold m-auto">
                <span id="span_場地編號" runat="server" title="編號"></span> _
                    <span id="span_建物名稱" runat="server" title="建物"></span>
                <span id="span_樓層名稱" runat="server" title="樓層"></span>
                <span id="span_場地名稱" runat="server" title="場地名稱"></span>
            </h4>
            <!--日、夜間部List-->
            <div id="div_日夜間部" runat="server">
                <div class="border m-0 p-3">
                    <div class="table-responsive">
                        <h5 class="font-weight-bold custom-text-1">正規學制課程(含日間部、進修部課程)</h5>
                        <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
                            <LayoutTemplate>
                                <table class="table table-bordered table-hover table-sm" id="table1">
                                    <thead class=" custom-bg-1 text-white">
                                        <tr>
                                            <th>學年期</th>
                                            <th>開課單位</th>
                                            <th>課程名稱</th>
                                            <th>授課教師</th>
                                            <th>上課時間</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# HttpUtility.HtmlEncode(Eval("學年")) %>-<%# HttpUtility.HtmlEncode(Eval("學期")) %></td>
                                    <td>
                                        <small class="text-muted">
                                            <%# HttpUtility.HtmlEncode(Eval("學部名稱")) %>
                                            <%# HttpUtility.HtmlEncode(Eval("學制名稱")) %>
                                            <%# HttpUtility.HtmlEncode(Eval("學院名稱")) %>
                                        </small>
                                        <div>
                                            <%# HttpUtility.HtmlEncode(Eval("科系名稱")) %>-<%# HttpUtility.HtmlEncode(Eval("班級名稱")) %>
                                        </div>
                                    </td>
                                    <td>
                                        <a title="前往教學大綱網站" href='https://syllabus.ksu.edu.tw/Course.aspx?cid=<%# HttpUtility.HtmlEncode(Eval("開課流水號")) %>' target="_blank">
                                            <%# HttpUtility.HtmlEncode(Eval("課程名稱")) %>
                                        </a>
                                    </td>
                                    <td><%# HttpUtility.HtmlEncode(Eval("授課教師")) %></td>
                                    <td class="text-left"><%# HttpUtility.HtmlEncode(Eval("上課時間")) %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table class="table table-bordered" id="table1">
                                    <tr class="text-center text-danger">
                                        <td>查無相關資料</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                    <!--分頁設定start-->
                    <%--<div class="row">
                        <div class="col-md-3 text-left small">
                            每頁最多顯示&nbsp;25&nbsp;筆，共&nbsp;<asp:Label ID="Label_counter" runat="server" Text="0" />&nbsp;筆
                        </div>
                        <div class="col-md-9 text-right">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="25" PagedControlID="ListView1">
                                <Fields>
                                    <asp:NextPreviousPagerField
                                        ButtonType="Button"
                                        ShowFirstPageButton="true"
                                        ShowNextPageButton="false"
                                        ShowPreviousPageButton="false"
                                        ButtonCssClass="btn btn-outline-primary mb-2 btn-sm" />

                                    <asp:NumericPagerField
                                        ButtonCount="10"
                                        NumericButtonCssClass="btn btn-outline-primary mb-2 btn-sm"
                                        NextPreviousButtonCssClass="btn btn-outline-primary mb-2 btn-sm"
                                        CurrentPageLabelCssClass="btn btn-primary mb-2 btn-sm" />

                                    <asp:NextPreviousPagerField
                                        ButtonType="Button"
                                        ShowLastPageButton="true"
                                        ShowNextPageButton="false"
                                        ShowPreviousPageButton="false"
                                        ButtonCssClass="btn btn-outline-primary mb-2 btn-sm" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>--%>
                    <!--分頁設定end-->
                </div>
            </div>

            <!--推廣教育List-->
            <div id="div_推廣教育" runat="server">
                <div class="border m-0 p-3">
                    <div class="table-responsive">
                        <h5 class="font-weight-bold custom-text-1">推廣教育課程</h5>
                        <asp:ListView ID="ListView2" runat="server">
                            <LayoutTemplate>
                                <table class="table table-bordered table-hover table-sm" id="table2">
                                    <thead class="custom-bg-1 text-white">
                                        <tr class="text-nowrap">
                                            <th>課程名稱</th>
                                            <th>教師姓名</th>
                                            <th>課程日期</th>
                                            <th>課程時間</th>
                                            <th>使用時數</th>
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
                                        <a title="前往推廣教育課程資訊網" href='https://cee.ksu.edu.tw/CourseInfo.aspx?id=<%# HttpUtility.HtmlEncode(Eval("推教E課程基本資料ID")) %>' target="_blank">
                                            <%# HttpUtility.HtmlEncode(Eval("課程中文名稱")) %>
                                        </a>
                                    </td>
                                    <td><%# HttpUtility.HtmlEncode(Eval("教師中文姓名")) %></td>
                                    <td>
                                        <%# HttpUtility.HtmlEncode(Convert.ToDateTime(Eval("授課時間起始")).ToString("yyyy-MM-dd (ddd)")) %>
                                    </td>
                                    <td>
                                        <%# HttpUtility.HtmlEncode(Convert.ToDateTime(Eval("授課時間起始")).ToString("HH:mm")) %>
                                        ~
                                        <%# HttpUtility.HtmlEncode(Convert.ToDateTime(Eval("授課時間結束")).ToString("HH:mm")) %>
                                    </td>
                                    <td><%#Convert.ToDouble(Eval("使用時數")).ToString("0.##") %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table class="table table-bordered" id="table2">
                                    <tr class="text-center text-danger">
                                        <td>查無相關資料</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

            <!--微學分課程List-->
            <div id="div_微學分" runat="server">
                <div class="border m-0 p-3">
                    <div class="table-responsive">
                        <h5 class="font-weight-bold custom-text-1">微學分課程</h5>
                        <asp:ListView ID="ListView3" runat="server">
                            <LayoutTemplate>
                                <table class="table table-bordered table-hover table-sm" id="table3">
                                    <thead class="custom-bg-1 text-white">
                                        <tr>
                                            <th>學年期</th>
                                            <th>課程名稱</th>
                                            <th>授課教師</th>
                                            <th>課程日期</th>
                                            <th>課程時間</th>
                                            <th>使用時數</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# HttpUtility.HtmlEncode(Eval("學年")) %>-<%# HttpUtility.HtmlEncode(Eval("學期")) %></td>
                                    <td>
                                        <a title="前往教學大綱網站" href='https://syllabus.ksu.edu.tw/MicroCourse.aspx?cid=<%# HttpUtility.HtmlEncode(Eval("微學分E基本資料ID")) %>' target="_blank">
                                            <%# HttpUtility.HtmlEncode(Eval("課程中文名稱")) %>
                                        </a>
                                    </td>
                                    <td><%# HttpUtility.HtmlEncode(Eval("授課教師姓名")) %></td>
                                    <td>
                                        <%# HttpUtility.HtmlEncode(Convert.ToDateTime(Eval("活動日期")).ToString("yyyy-MM-dd (ddd)")) %>
                                    </td>
                                    <td>
                                        <%# HttpUtility.HtmlEncode(Eval("開始時間")) %> ~ <%# HttpUtility.HtmlEncode(Eval("結束時間")) %>
                                    </td>
                                    <td><%# HttpUtility.HtmlEncode(Eval("使用時數")) %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table class="table table-bordered" id="table3">
                                    <tr class="text-center text-danger">
                                        <td>查無相關資料</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
