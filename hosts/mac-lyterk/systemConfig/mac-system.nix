{
  applications = {
    systemSettings = {
      battery = {
        options = {
          preventAutomaticSleepingOnPowerAdapterWhenTheDisplayIsOff = false;
          slightlyDimTheDisplayOnBattery = true;
          wakeForNetworkAccess = "Only on Power Adapter";
        };
      };
      general = {
        dateAndTime = {
          setTimeZoneAutomaticallyUsingYourCurrentLocation = true;
          source = "time.apple.com";
          timeZone = "America/Los_Angeles";
        };
        sharing = {
          contentCaching = false;
          fileSharing = false;
          fileSharingOptions = {
            sharedFolders = {
              "/Users/lyterk/Public" = "Kevin Lyter’s Public Folder";
              "/Users/work/Public" = "Kevin Work’s Public Folder";
            };
          };
          printerSharing = false;
          remoteApplicationScripting = false;
          remoteApplicationScriptingOptions = {
            allowAccessFor = "Only these users";
          };
          remoteManagement = false;
          screenSharing = false;
          screenSharingOptions = {
            allowAccessFor = "Only these users";
          };
        };
        softwareUpdate = {
          automaticallyDownloadNewUpdatesWhenAvailable = true;
          automaticallyInstallMacOSUpdates = true;
          automaticallyInstallSystemDataFilesAndSecurityUpdates = true;
        };
      };
      lockScreen = {
        turnDisplayOffOnBatteryWhenInactive = "For 5 minutes";
        turnDisplayOffOnPowerAdapterWhenInactive = "For 10 minutes";
      };
      network = {
        firewall = {
          firewall = false;
          options = {
            automaticallyAllowBuiltInSoftwareToReceiveIncomingConnections = true;
            automaticallyAllowDownloadedSignedSoftwareToReceiveIncomingConnections = true;
            blockAllIncomingConnections = false;
            enableStealthMode = false;
          };
        };
      };
      privacyAndSecurity = {
        analyticsAndImprovements = {
          shareMacAnalytics = false;
          shareWithAppDevelopers = false;
        };
      };
      wiFi = {
        askToJoinNetworks = "Off";
      };
    };
  };
}
