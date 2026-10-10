{
  applications = {
    finder = {
      menuBar = {
        view = {
          showSidebar = true;
        };
      };
      settings = {
        advanced = {
          showAllFilenameExtensions = true;
        };
        general = {
          showTheseItemsOnTheDesktop = {
            cdsDvdsAndiPods = true;
            externalDisks = true;
            hardDisks = false;
          };
        };
      };
    };
    systemSettings = {
      accessibility = {
        audio = {
          backgroundSounds = false;
        };
        hoverText = {
          hoverTypingOptions = {
            textFont = "Default";
          };
          options = {
            textFont = "Default";
          };
        };
        keyboard = {
          accessibilityKeyboard = false;
          slowKeys = false;
          slowKeysOptions = {
            acceptanceDelay = 250;
          };
          stickyKeys = false;
          stickyKeysOptions = {
            pressTheShiftKeyFiveTimesToToggleStickyKeys = false;
          };
        };
        liveCaptions = {
          fontFamily = "Default";
        };
        pointerControl = {
          ignoreBuiltInTrackpadWhenMouseOrWirelessTrackpadIsPresent = false;
          springLoading = true;
          springLoadingSpeed = 0.5;
          trackpadOptions = {
            dragging = "Off";
            useInertiaWhenScrolling = true;
            useTrackpadForScrolling = true;
          };
        };
        readAndSpeak = {
          typingFeedback = {
            characters = true;
            modifierKeys = false;
            selectionChanges = false;
            words = true;
          };
        };
        rtt = {
          sendImmediately = true;
        };
        switchControl = {
          switchControl = false;
        };
        zoom = {
          useKeyboardShortcutsToZoom = false;
        };
      };
      appleIntelligenceAndSiri = {
        siri = {
          enable = false;
        };
      };
      desktopAndDock = {
        dock = {
          automaticallyHideAndShowTheDock = {
            enabled = true;
          };
          size = 50;
        };
        hotCorners = {
          bottomLeft = {
            modifiers = {
              command = false;
              control = false;
              option = false;
              shift = false;
            };
          };
          bottomRight = {
            action = "Quick Note";
            modifiers = {
              command = false;
              control = false;
              option = false;
              shift = false;
            };
          };
          topLeft = {
            modifiers = {
              command = false;
              control = false;
              option = false;
              shift = false;
            };
          };
          topRight = {
            modifiers = {
              command = false;
              control = false;
              option = false;
              shift = false;
            };
          };
        };
        missionControl = {
          shortcuts = {
            applicationWindows = "-";
            missionControl = "-";
            showDesktop = "-";
          };
        };
      };
      general = {
        languageAndRegion = {
          applications = { };
          preferredLanguages = [
            "en-US"
            "es-US"
          ];
          region = "en_US";
        };
        sharing = {
          mediaSharing = {
            shareMediaWithGuests = false;
          };
        };
      };
      keyboard = {
        keyboardShortcuts = {
          accessibility = {
            decreaseContrast = false;
            increaseContrast = false;
            invertColors = false;
          };
          appShortcuts = {
            menuItems = { };
          };
          inputSources = {
            selectNextSourceInInputMenu = false;
            selectThePreviousInputSource = false;
          };
          missionControl = {
            moveLeftASpace = true;
            moveRightASpace = true;
          };
        };
        textInput = {
          addPeriodWithDoubleSpace = true;
          capitalizeWordsAutomatically = true;
          correctSpellingAutomatically = true;
          inputSources = [
            "com.apple.keylayout.Dvorak"
            "com.apple.keylayout.US"
            "org.sil.ukelele.keyboardlayout.spanishdvorak.latinamericandvorak"
          ];
          useSmartQuotesAndDashes = true;
        };
        useF1F2EtcKeysAsStandardFunctionKeys = true;
      };
      menuBar = {
        clock = {
          showAmPm = true;
          showTheDayOfTheWeek = true;
        };
        textInput = true;
        timeMachine = false;
      };
      privacyAndSecurity = {
        appleAdvertising = {
          personalizedAds = true;
        };
      };
      spotlight = {
        searchResults = {
          appStore = true;
          apps = true;
          books = true;
          calculator = true;
          calendar = true;
          contacts = true;
          dictionary = true;
          files = true;
          folders = true;
          games = true;
          iPhoneApps = true;
          mail = true;
          menuItems = true;
          messages = true;
          music = true;
          notes = true;
          phone = true;
          photos = true;
          podcasts = true;
          reminders = true;
          safari = true;
          shortcuts = true;
          systemSettings = true;
          tips = true;
          voiceMemos = true;
        };
        showRelatedContent = true;
      };
      trackpad = {
        moreGestures = {
          notificationCenter = true;
        };
        pointAndClick = {
          click = "Medium";
          forceClickAndHapticFeedback = true;
          lookUpAndDataDetectors = "Force Click with One Finger";
        };
        scrollAndZoom = {
          naturalScrolling = false;
          rotate = true;
          smartZoom = true;
          zoomInOrOut = true;
        };
      };
    };
  };
}
