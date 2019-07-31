# Angular Application with Pythonic Endpoints

The purpose is to build an AngularTS Application which is serviced by Python in its end points and Authorization servies.  I wanted to leverage the newer versions of Python as well, so in this walk through, I am leveraging: Python 3.7.0

## Python Setup

Read the init.sh file I have written.  It shows the step by step of what I needed to do, and the hiccups I had encounted.  I explain how to resolve them as well.

This is currently meant for mac os, and so far I have it working to serve flask at :4433 and if routed to :4433/kudos you will get a message (or an authorizatio error)

## Angular

I use the base scaffolding of an AngularTS Application so that way it is as vanilla as possible such that it can be augmented for others consumption.