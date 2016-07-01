<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimeoutControl.ascx.cs" Inherits="CustomerPortal.TimeoutControl" %>

<style type="text/css">
    .auto-style1 {
        height: 27px;
    }
    .auto-style2 {
        width: 76px;
    }
    .auto-style3 {
        height: 27px;
        width: 76px;
    }
</style>

<script type="text/javascript">

    //Creates an anononymous function  with variables we wish to reference
    window.SessionTimeout = (function() {
        var _timeLeft, _popupTimer, _countDownTimer;

        // Creates an anononymous function to clear the these 2 variables
        var stopTimers = function() {
            window.clearTimeout(_popupTimer);
            window.clearTimeout(_countDownTimer);
        };

        var updateCountDown = function() {
            // minutes
            var min = Math.floor(_timeLeft / 60);

            // seconds
            var sec = _timeLeft % 60;
            // Formats a single digit to 09, 08, 07...
            if(sec < 10)
                sec = "0" + sec;

            // Sets value to the timespan element below
            document.getElementById("CountDownHolder").innerHTML = min + ":" + sec;

            // Decrement timer
            if(_timeLeft > 0) {
                _timeLeft--;

                // Call the function 1 per second to update the countdown
                _countDownTimer = window.setTimeout(updateCountDown, 1000);
            } else  
            {
                // Redirect to Time out URL
                window.location = <%= QuotedTimeOutUrl %>;
            }            
        };

        var showPopup = function() {
            _timeLeft = 60;
            updateCountDown();
            ClientTimoutPopup.Show();
        };

        var schedulePopup = function() {       
            stopTimers();
            ClientTimoutPopup.Hide();
            _popupTimer = window.setTimeout(showPopup, <%= PopupShowDelay %>);
        };

        var sendKeepAlive = function() {
            stopTimers();
            ClientTimoutPopup.Hide();
            ClientKeepAliveHelper.PerformCallback();
        };

        return {
            schedulePopup: schedulePopup,
            sendKeepAlive: sendKeepAlive
        };

    })();    
</script>

<dx:ASPxPopupControl ID="TimeoutPopup" runat="server" ClientInstanceName="ClientTimoutPopup" CloseAction="None" FooterText="" HeaderText="Session Expiring" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowHeader="False" Height="143px" Width="383px">
    <ContentCollection>
     <dx:PopupControlContentControl>
                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <dx:ASPxImage ID="ASPxImage2" runat="server" ShowLoadingImage="true" ImageUrl="~/Images/Popups/SessionExpiring.png"></dx:ASPxImage>
                                </asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Table runat="server">
                                        <asp:TableRow HorizontalAlign="Center">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Session Expiring" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label runat="server">The current session is about to expire.  To continue, please click the Ok button.</asp:Label>
                                             </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                        &nbsp;
                                             </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Center">
                                            <asp:TableCell>
                                                    <span id="CountDownHolder"></span> seconds.
                                             </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
                        <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
                                <asp:TableRow HorizontalAlign="Center" >
                                    <asp:TableCell>
                                        <dx:ASPxButton ID="btnOK" runat="server"  HorizontalAlign="Center" Text="Ok" VerticalAlign="Middle" ><ClientSideEvents Click="function(s, e) {SessionTimeout.sendKeepAlive	}" /></dx:ASPxButton>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>      

    </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxGlobalEvents ID="GlobalEvents" runat="server">
    <ClientSideEvents ControlsInitialized="SessionTimeout.schedulePopup" />
</dx:ASPxGlobalEvents>
<dx:ASPxCallback ID="KeepAliveHelper" runat="server" ClientInstanceName="ClientKeepAliveHelper">
</dx:ASPxCallback>

