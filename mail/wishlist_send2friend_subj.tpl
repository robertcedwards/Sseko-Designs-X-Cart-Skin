{*
$Id: wishlist_send2friend_subj.tpl,v 1.6 2008/08/21 09:52:50 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{$lng.eml_wishlist_send2friend_subj|substitute:"sender":"`$userinfo.firstname` `$userinfo.lastname`"}
