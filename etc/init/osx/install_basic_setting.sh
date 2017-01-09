## NSGlobalDomain
# 12-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool true

# Don't restore windows when quitting or re-opening apps
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

## Trackpad
# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

## Dock
# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Magnification
defaults write com.apple.dock magnification -bool true

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

## Finder
# Show All File Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show All Hidden Files
defaults write com.apple.finder AppleShowAllFiles true

# Hide All Desktop Icons
defaults write com.apple.finder CreateDesktop -bool false

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Allow Text Selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true
killall Finder

# Disable Creation of Metadata Files on Network/USB Volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
