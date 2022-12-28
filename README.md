<h1>Failed RDP to IP Geolocation Information</h1>


 ### [YouTube Demonstration (@16:20)](https://youtu.be/RoZeVbbZ0o0?t=980)


<h2>Description</h2>
<b>In this lab we will created a Map in Azure Sentinel that will display multiple brute force attacks from all over the world.  We will use a Virtual Machine to crete a Honeypot where the malicious attackers can try to gain access to for the logging we need to plot those attacks on our Map in Azure Sentinel
</b>
<br />
<br />
<br />
<br />
<br />
First, with out pay-as-you-go Azure subscription, we will create our Virtual MAchine that will act as our HoneyPot
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/gL4WGWD.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />


Let us now set the Newtork Security Groups of this Virtual Machine TERRIBLY!!
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/jKyyfxS.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>

<br />
<br />

<p align="center">
<img src="https://i.imgur.com/NrfDDr9.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>

<br />
<br />
<br />

Now that we have set the TERRIBLE Network Security Groups, we will Review nad Crete our HoneyPot
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/ggX6bwL.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />


While we wait for our Virtual Machine to deploy, lets get started on creating our Log Analystics Workspace Resource
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/FBYAFL1.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />


With our Virtual Machine and Log Analytics Workspace now created, lets set up our Microsoft Defneder Setting to give up some alerts and to use a couple of their servers for our logs.
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/TRuw4QF.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />

Setting the Data Collection to all
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/IseMWMU.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />

Now we will connect our LAW to our VM
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/1Cgo7OE.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />


And add Sentinel to our LAW
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/iYPgSgK.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />



We will do a failed logon to the VM first before we actually log into it
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/CAMbJdv.jpg" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />


Now Lets Succefully logon
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/RH3RIH9.jpg" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />

And now we will open Event Viewer to see the logs of our logon attempts.  Here is the failed log we just administered. 
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/80BcFsc.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
</p>
<br />
<br />
<br />



Lets see if we can connect to the VM now on out local machine...
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/hvyn1O5.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



<h2>UNSUCCESSFUL</h2>
<br />
<br />
<br />
 
 Now lets adjust our FireWall settings to allow some nwtwork connectivity to our VM.  THIS IS ALSO NOT SUGGESTED FOR PRODUCTION USE AND ONLY AS WE ARE LABBING!!
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/XjJIe5z.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />
 
 <p align="center">
<img src="https://i.imgur.com/bRev4gN.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />

   <p align="center">
<img src="https://i.imgur.com/57lFl2K.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />
    
<h2>SUCCESS!</h2>


Now because the script we are runnig creates a log file in our Program Data folder, we need to open our Explorer Settings and set our view to Show Hidden Files and Folders
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/mSSARhK.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



For this script to run and give us the data we need, we will venture to a website that allows us to see the Geographical location of attempt logs on our machine.  This is where they will create a custom API key for me to use to get an idea of where those baddies live. 
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/a1TZBS7.jpg" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />


And lets adjust our script accordingly with said API
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/gQqOb6A.jpg" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



And lets give that file to Sentinel
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/0P7hu2E.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />


And here are our sample logs
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/XZHFqFs.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



Now lets give a path of the VM where Sentinel can see the logfile the script creates and pulls the necessary information we want it to look for
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/37F4QEY.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />



How we got that path
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/g6GSf30.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



Now lets run the query in Sentinel to see if it can pull the raw data we want. 
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/WkaXhTb.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



Since this will take a while to load, lets do another failed logon to update the query. 
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/9rrkQTt.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



And here is our Query data.  And lets Extract the fileds of the data so we can plot those later...
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/xnOG8nz.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />


Starting with Latitude *We did the same for longitude.  There was a locaion that had a negative longitude that I want to use instead of the positive number so I forgot to screenshot it but no worries, the process is the same.  Just make sure they are both labeled as numeric values.*
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/HN0Zz36.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />



Then Destination host, username, sourcehost, and state...
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/JP3wbha.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />

 <p align="center">
<img src="https://i.imgur.com/GaZElX8.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />

  <p align="center">
<img src="https://i.imgur.com/3PWtcGM.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />

   <p align="center">
<img src="https://i.imgur.com/1N7f2vd.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />
<br />



Now, when we 
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
<br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>
 <br />
<br />
<br />



Now that we hav added out API and we have ran the script, we will go to the log file created and copy that data to our local machine to create a sample template that Sentinel would love to have for the next part of our Cyber Duties
<br />
<br />
<br />

<p align="center">
<img src="https://i.imgur.com/2qlHVOa.png" height="85%" width="85%" alt="RDP event fail logs to iP Geographic information"/>

- <b>PowerShell:</b> Extract RDP failed logon logs from Windows Event Viewer 

<h2>Utilities Used</h2>

- <b>ipgeolocation.io:</b> IP Address to Geolocation API

<h2>Attacks from China coming in; Custom logs being output with geodata</h2>

<p align="center">
<img src="https://i.imgur.com/LhDCRz4.jpeg" height="85%" width="85%" alt="Image Analysis Dataflow"/>
</p>

<h2>World map of incoming attacks after 24 hours (built custom logs including geodata)</h2>

<p align="center">
<img src="https://i.imgur.com/krRFrK5.png" height="85%" width="85%" alt="Image Analysis Dataflow"/>
</p>
