Sunzi Recipes
=============

[Sunzi](https://github.com/kenn/sunzi) is a server provisioning tool for minimalists.

This repository is a public source for my Sunzi recipes, templates and config.

How to Use
==========

Add sunzi to your app and run `bundle install`.  Generate the sunzi directories with the `sunzi create` command.  Then copy over my sunzi.yml and whatever templates you need.  If you're not sure which templates to grab, just download them all.  Then run `sunzi deploy example.com` and watch the magic.

Templates
=========

Many of the recipes reference files.  I've added the templates that I use.  Note that some of these use string replacement that is only enabled in my fork of sunzi.  You can find my fork at https://github.com/mm53bar/sunzi.

In the future, I want to add another patch to Sunzi so that it grabs the template files from a remote host (like this repo or a gist).

Rakefile
========

While Sunzi has support for creating Linode VMs, I prefer to use EC2.  I've created a Rakefile that uses Fog to create an EC2 instance and then passes off to Sunzi to do the provisioning.  I've uploaded my Rakefile as a gist at https://gist.github.com/2427e5015487683305ed
 
