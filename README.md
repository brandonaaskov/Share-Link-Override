About
=====

This project provides a Flash plug-in for overriding the default share link for the player. It will automatically make the share link the same URL that's in the address bar of the page. However, if you have related videos in the end screen, a playlist player where other videos can be played, or any other means where videos can load and playback without the page URL changing, the share link will not be updated for those videos.

Setup
=====

To use the plugin, you can either compile a SWF yourself by downloading the source code, or just simply grab the plugin from the [project's downloads page](https://github.com/BrightcoveOS/Share-Link-Override/downloads). Once you have that, you can [include it as a plugin](http://support.brightcove.com/en/docs/editing-settings-players#analytics) to the player, or [add it as a Module to the BEML](http://support.brightcove.com/en/docs/adding-custom-component-player-template) for your player.

Release Notes
=============

v1.1.1: The deep linking code didn't have a string initialized, and in single video players, a "null" variable was getting appended to the URL. This is fixed now.

v1.1.0: Updated the plugin to support playlist players. We first check if there are already params on the URL, and then add the bclid and bctid parameters appropriately.