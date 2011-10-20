{*
$Id: dhl.tpl,v 1.6 2008/08/21 09:53:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<form action="http://track.dhl-usa.com/TrackByNbr.asp?nav=TrackBynumber" method="post" name="getTrackNum" id="getTrackNum" target="_blank">
<input type="hidden" id="txtTrackNbrs" name="txtTrackNbrs" value="{$order.tracking|escape}" />
<input type="hidden" name="hdnErrorMsg" value="" />
<input type="hidden" name="hdnTrackMode" value="nbr" />
<input type="hidden" name="hdnPostType" value="init" />
<input type="hidden" name="hdnRefPage" value="0" />
<input type="submit" value="{$lng.lbl_track_it|strip_tags:false|escape}" />
<br />
{$lng.txt_dhl_redirection}
</form>
